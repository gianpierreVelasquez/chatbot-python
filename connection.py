import mysql.connector as mysql
from flask import Flask, jsonify, request
import json

app = Flask(__name__)

db = mysql.connect(
    host="localhost",
    user="root",
    passwd="admin",
    database = "universities"
)

universitiesList = []
patternsList = []

data_file = open('intents.json').read().encode('utf-8')
intents = json.loads(data_file)

cursor = db.cursor()
cursor.execute("SHOW TABLES")
tables = cursor.fetchall()
for table in tables:
    u = ''.join(table)
    universitiesList.append(u)

for univ in universitiesList:
    query = "SELECT * FROM " + univ
    cursor.execute(query)
    data = cursor.fetchall()
    
    for row in data:
        pattern = {
            "tag": row[0],
            "patterns": [row[1]],
            "responses": [row[2]],
            "context": []
        }
        patternsList.append(pattern)

intents['intents'].extend(patternsList)

with open("new_intents.json", "w") as fp:
    json.dump(intents , fp) 

if __name__ == '__main__':
    app.run(debug=True)