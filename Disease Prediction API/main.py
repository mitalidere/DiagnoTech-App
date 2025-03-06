from flask import Flask, jsonify, request
import pickle
from lightgbm import LGBMClassifier
import pandas as pd
import numpy as np
from flask_cors import CORS

# creating a Flask app
app = Flask(__name__)
app.json.sort_keys = False
CORS(app)

@app.route('/', methods=['GET', 'POST'])
def home():
    if request.method == 'GET':
        welcome = "Welcome to disease Prediction API"
        diseases = ['Heart Disease', 'Diabetes', 'Chronic Kidney Disease', 'Lung Cancer']
        heart_disease = {
            'url': '/heart/<int:age>/<int:sex>/<int:cp>/<int:trestbps>/<int:chol>/<int:fbs>/<int:restecg>/<int:thalach>/<int:exang>/<float:oldpeak>/<int:slope>/<int:ca>/<int:thal>',
            'prediction': {0: 'No', 1: 'Yes'}
        }
        diabetes_disease = {
            'url': '/diabetes/<int:Pregnancies>/<int:Glucose>/<int:BloodPressure>/<int:SkinThickness>/<int:Insulin>/<float:BMI>/<float:DiabetesPedigreeFunction>/<int:Age>',
            'prediction': {0: 'No', 1: 'Yes'}
        }
        chronic_kidney_disease = {
            'url': '/kidney/<float:age>/<float:blood_pressure>/<float:specific_gravity>/<float:albumin>/<float:sugar>/<float:red_blood_cells>/<float:pus_cell>/<float:pus_cell_clumps>/<float:bacteria>/<float:blood_glucose_random>/<float:blood_urea>/<float:serum_creatinine>/<float:sodium>/<float:potassium>/<float:haemoglobin>/<float:packed_cell_volume>/<float:white_blood_cell_count>/<float:red_blood_cell_count>/<float:hypertension>/<float:diabetes_mellitus>/<float:coronary_artery_disease>/<float:appetite>/<float:peda_edema>/<float:aanemia>',
            'prediction': {0: 'No', 1: 'Yes'}
        }
        lung_cancer_disease = {
            'url': '/lungs/<int:GENDER>/<int:AGE>/<int:SMOKING>/<int:YELLOW_FINGERS>/<int:ANXIETY>/<int:PEER_PRESSURE>/<int:CHRONIC_DISEASE>/<int:FATIGUE>/<int:ALLERGY>/<int:WHEEZING>/<int:ALCOHOL_CONSUMING>/<int:COUGHING>/<int:SHORTNESS_OF_BREATH>/<int:SWALLOWING_DIFFICULTY>/<int:CHEST_PAIN>',
            'prediction': {0: 'No', 1: 'Yes'}
        }
        data = {'data': welcome,"diseases":diseases, 'url_details': {'heart_disease': heart_disease, 'diabetes': diabetes_disease,
                                              "chronic_kidney_disease": chronic_kidney_disease,
                                              'lung_cancer': lung_cancer_disease}}
        return jsonify(data)


@app.route(
    '/heart/<int:age>/<int:sex>/<int:cp>/<int:trestbps>/<int:chol>/<int:fbs>/<int:restecg>/<int:thalach>/<int:exang>/<float:oldpeak>/<int:slope>/<int:ca>/<int:thal>',
    methods=['GET'])
def heart(age, sex, cp, trestbps, chol, fbs, restecg, thalach, exang, oldpeak, slope, ca, thal):
    result = heart_disease([age, sex, cp, trestbps, chol, fbs, restecg, thalach, exang, oldpeak, slope, ca, thal])
    data = {"prediction": int(result[0])}
    print(data)
    return jsonify(data)


@app.route(
    '/diabetes/<int:Pregnancies>/<int:Glucose>/<int:BloodPressure>/<int:SkinThickness>/<int:Insulin>/<float:BMI>/<float:DiabetesPedigreeFunction>/<int:Age>',
    methods=['GET'])
def diabetes(Pregnancies, Glucose, BloodPressure, SkinThickness, Insulin, BMI, DiabetesPedigreeFunction, Age):
    result = diabetes_disease(
        [Pregnancies, Glucose, BloodPressure, SkinThickness, Insulin, BMI, DiabetesPedigreeFunction, Age])
    data = {"prediction": int(result[0])}
    print(data)
    return jsonify(data)


@app.route(
    '/kidney/<float:age>/<float:blood_pressure>/<float:specific_gravity>/<float:albumin>/<float:sugar>/<float:red_blood_cells>/<float:pus_cell>/<float:pus_cell_clumps>/<float:bacteria>/<float:blood_glucose_random>/<float:blood_urea>/<float:serum_creatinine>/<float:sodium>/<float:potassium>/<float:haemoglobin>/<float:packed_cell_volume>/<float:white_blood_cell_count>/<float:red_blood_cell_count>/<float:hypertension>/<float:diabetes_mellitus>/<float:coronary_artery_disease>/<float:appetite>/<float:peda_edema>/<float:aanemia>',
    methods=['GET'])
def kidney(age, blood_pressure, specific_gravity, albumin, sugar, red_blood_cells, pus_cell, pus_cell_clumps, bacteria,
           blood_glucose_random, blood_urea, serum_creatinine, sodium, potassium, haemoglobin, packed_cell_volume,
           white_blood_cell_count, red_blood_cell_count, hypertension, diabetes_mellitus, coronary_artery_disease,
           appetite, peda_edema, aanemia):
    result = chronic_Kidney_disease(
        [age, blood_pressure, specific_gravity, albumin, sugar, red_blood_cells, pus_cell, pus_cell_clumps, bacteria,
         blood_glucose_random, blood_urea, serum_creatinine, sodium, potassium, haemoglobin, packed_cell_volume,
         white_blood_cell_count, red_blood_cell_count, hypertension, diabetes_mellitus, coronary_artery_disease,
         appetite, peda_edema, aanemia])
    data = {"prediction": int(result[0])}
    print(data)
    return jsonify(data)


@app.route(
    '/lungs/<int:GENDER>/<int:AGE>/<int:SMOKING>/<int:YELLOW_FINGERS>/<int:ANXIETY>/<int:PEER_PRESSURE>/<int:CHRONIC_DISEASE>/<int:FATIGUE>/<int:ALLERGY>/<int:WHEEZING>/<int:ALCOHOL_CONSUMING>/<int:COUGHING>/<int:SHORTNESS_OF_BREATH>/<int:SWALLOWING_DIFFICULTY>/<int:CHEST_PAIN>',
    methods=['GET'])
def lungs(GENDER, AGE, SMOKING, YELLOW_FINGERS, ANXIETY, PEER_PRESSURE, CHRONIC_DISEASE, FATIGUE, ALLERGY, WHEEZING,
          ALCOHOL_CONSUMING, COUGHING, SHORTNESS_OF_BREATH, SWALLOWING_DIFFICULTY, CHEST_PAIN):
    result = lung_cancer_disease(
        [GENDER, AGE, SMOKING, YELLOW_FINGERS, ANXIETY, PEER_PRESSURE, CHRONIC_DISEASE, FATIGUE, ALLERGY, WHEEZING,
         ALCOHOL_CONSUMING, COUGHING, SHORTNESS_OF_BREATH, SWALLOWING_DIFFICULTY, CHEST_PAIN])
    data = {"prediction": int(result[0])}
    print(data)
    return jsonify(data)


def heart_disease(pred_lst):
    heart_model_filename = "./models/heart_model.sav"
    loaded_model = pickle.load(open(heart_model_filename, 'rb'))
    prediction = loaded_model.predict([pred_lst])
    print(prediction)
    return prediction


def diabetes_disease(pred_lst):
    disbetes_scaler_filename = "models/disbetes_scaler.pkl"
    disbetes_model_filename = "models/disbetes_model.sav"
    loaded_scaler = pickle.load(open(disbetes_scaler_filename, 'rb'))
    loaded_model = pickle.load(open(disbetes_model_filename, 'rb'))
    scaledData = loaded_scaler.transform([pred_lst])
    prediction = loaded_model.predict(scaledData)
    print(prediction)
    return prediction


def chronic_Kidney_disease(pred_lst):
    chronic_kidney_filename = "models/chronic_kidney_model.sav"
    chronic_kidney_loaded_model = pickle.load(open(chronic_kidney_filename, 'rb'))
    prediction = chronic_kidney_loaded_model.predict([pred_lst])
    print(prediction)
    return prediction


def lung_cancer_disease(pred_lst):
    lung_cancer_filename = "models/lung_cancer_model.sav"
    lung_cancer_loaded_model = pickle.load(open(lung_cancer_filename, 'rb'))
    prediction = lung_cancer_loaded_model.predict([pred_lst])
    print(prediction)
    return prediction


# heart_disease([50, 0, 0, 110, 254, 0, 0, 159, 0, 0.0, 2, 0, 2])
# diabetes_disease([1, 93, 70, 31, 0, 30.4, 0.315, 23])
# chronic_Kidney_disease(
#     [34.0, 70.0, 1.015, 4.0, 0.0, 0.0, 0.0, 0.0, 0.0, 153.0, 22.0, 0.9, 133.0, 3.8, 15.9, 52.0, 7400.0, 3.7, 0.0, 0.0,
#      0.0, 0.0, 1.0, 0.0])
# lung_cancer_disease([1, 69, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1])

# driver function
if __name__ == '__main__':
    app.run(debug=True)
