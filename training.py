import nltk
from nltk.stem import WordNetLemmatizer
lemmatizer = WordNetLemmatizer()
import json
import pickle

import numpy as np
from keras.models import Sequential
from keras.layers import Dense, Activation, Dropout
from keras.optimizers import SGD
import random

words=[]
classes=[]
documents=[]
ignore_words= ['?','!'],
data_file = open('new_intents.json').read()
intents = json.loads(data_file)

for intent in intents['intents']:
    for pattern in intent['patterns']:
        ### method to tokenize each word
        w = nltk.word_tokenize(pattern)
        words.extend(w)

        ### adding documents on the corpus
        documents.append((w, intent['tag']))

        ### adding to our classes
        if intent['tag'] not in classes:
            classes.append(intent['tag'])

### lemmatize and lowercase each word and take out duplicates
words = [lemmatizer.lemmatize(w.lower()) for w in words if w not in ignore_words]
words = sorted(list(set(words)))

### sort classes
classes = sorted(list(set(classes)))

print(len(documents), "documents")
print(len(classes), "classes", classes)
print(len(words), "lemmatize words", words)

pickle.dump(words, open('texts.pkl', 'wb'))
pickle.dump(classes, open('labels.pkl', 'wb'))

### time to create training data
training=[]
### create an empty array for our output
output_empty = [0] * len(classes)
### training set, word's box for each sentence
for doc in documents:
    ### initialize our word's box
    bag = []
    ### listing our tokenizer words for the pattern
    pattern_words = doc[0]
    ### lemmatize each word - create a base word, in attempt to represent related words
    pattern_words = [lemmatizer.lemmatize(word.lower()) for word in pattern_words]
    ### create our word's box array with 1, if word match found in current pattern
    for w in words:
        bag.append(1) if w in pattern_words else bag.append(0)

    ### output is "0" for each tag and "1" for current tag (for each pattern)
    output_row = list(output_empty)
    output_row[classes.index(doc[1])] = 1

    training.append([bag, output_row])

### shuffle our features and turn into np.array
random.shuffle(training)
training = np.array(training)
### create train and test lists x - patterns, y - intents
train_x = list(training[:,0])
train_y = list(training[:,1])
print("Training data created")

### model creation - 3 capas, la primera de 128 neuronas, segunda de 64 y la ultima contiene el numero de intenciones para predecir la salida con softmax
model = Sequential()
model.add(Dense(128, input_shape=(len(train_x[0]),), activation='relu'))
model.add(Dropout(0.5))
model.add(Dense(64, activation='relu'))
model.add(Dropout(0.5))
model.add(Dense(len(train_y[0]), activation='softmax'))

### compile model
sgd = SGD(lr=0.01, decay=1e-6, momentum=0.9, nesterov=True)
model.compile(loss='categorical_crossentropy', optimizer=sgd, metrics=['accuracy'])

### fitting and saving model
hist = model.fit(np.array(train_x), np.array(train_y), epochs=200, batch_size=5, verbose=1)
model.save('model.h5', hist)

print('Model was created')
