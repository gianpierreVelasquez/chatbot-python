from flask_cors import CORS, cross_origin
from flask import Flask, jsonify, request
import random
import json
from keras.models import load_model
import time
import numpy as np
import pickle
import nltk
from nltk.stem import WordNetLemmatizer
lemmatizer = WordNetLemmatizer()

model = load_model('model.h5')
intents = json.loads(open('new_intents.json').read().encode('utf-8'))
words = pickle.load(open('texts.pkl', 'rb'))
classes = pickle.load(open('labels.pkl', 'rb'))
selectedUniversity = False
university = "NO_DATA"
uHelper = ''


def clean_up_sentence(sentence):
    # tokenize the pattern - split words into array
    sentence_words = nltk.word_tokenize(sentence)
    # stem each word - create short form for word
    sentence_words = [lemmatizer.lemmatize(
        word.lower()) for word in sentence_words]
    return sentence_words

# return word's box of words array: 0 or 1 for each word in the box that exists in the sentence


def bow(sentence, words, show_details=True):
    # tokenize the pattern
    sentence_words = clean_up_sentence(sentence)
    # word's box - matrix of N words, vocabulary matrix
    bag = [0]*len(words)
    for s in sentence_words:
        for i, w in enumerate(words):
            if w == s:
                global uHelper
                uHelper = w
                print('helper: ', uHelper)
                # assign 1 if current word is in te vocabulary position
                bag[i] = 1
                if show_details:
                    print("found in box: %s" % w)
    return(np.array(bag))


def predict_class(sentence, model):
    # filter out predictions below a threshold
    p = bow(sentence, words, show_details=False)
    res = model.predict(np.array([p]))[0]
    ERROR_THRESHOLD = 0.25
    results = [[i, r] for i, r in enumerate(res) if r > ERROR_THRESHOLD]
    # sort by strength of probability
    results.sort(key=lambda x: x[1], reverse=True)
    return_list = []
    for r in results:
        print('r ', r)
        return_list.append({"intent": classes[r[0]], "probability": str(r[1])})
    return return_list


def getResponse(ints, intents_json):
    tag = ints[0]['intent']
    list_of_intents = intents_json['intents']
    for i in list_of_intents:
        if(i['tag'] == tag):
            result = random.choice(i['responses'])
            break
    return result


def chatbot_response(msg):
    global selectedUniversity 
    global university
    text = ''.join(msg)
    ints = predict_class(text, model)
    tag = ints[0]["intent"]

    if not tag.startswith('u_'):
        university = "NO_DATA"
        selectedUniversity = False

    if (tag != "universities" and selectedUniversity == False):
        res = getResponse(ints, intents)
        new_response = {
            "user": "bot",
            "message": res
        }
        return new_response

    elif (tag == "universities" and selectedUniversity == False):
        university = getUniversityName(uHelper)
        selectedUniversity = True
        res = getResponse(ints, intents)
        new_response = {
            "user": "bot",
            "message": res
        }
        return new_response

    elif (selectedUniversity == True and university != 'NO_DATA'):
        for i in ints:
            if i['intent'].startswith(university):
                new_ints = [i]
        res = getResponse(new_ints, intents)
        # university = "NO_DATA"
        # selectedUniversity = False
        new_response = {
            "user": "bot",
            "message": res
        }
        return new_response

# to get university
def getUniversityName(sentence):
    print(sentence)
    if sentence == 'san marcos' or sentence == 'unmsm':
        return 'san_marcos'
    elif sentence == 'callao' or sentence == 'unac':
        return 'u_callao'
    elif sentence == 'villareal' or sentence == 'unfv':
        return 'u_villareal'
    elif sentence == 'uni' or sentence == 'ingenieria':
        return 'u_ingenieria'
    elif sentence == 'agraria' or sentence == 'molina':
        return 'u_agraria'

# using flask to create restAPI
app = Flask(__name__)
CORS(app)


@ app.route("/sendMessage", methods=['POST'])
def get_bot_response():
    userText = request.json['message'],
    return jsonify(chatbot_response(userText))


if __name__ == '__main__':
    app.run(debug=True)
