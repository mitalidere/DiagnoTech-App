import 'dart:convert';

import 'package:diagnotech/screens/custom_appbar.dart';
import 'package:diagnotech/screens/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../widgets/customized_button.dart';

class PredictDiabetes extends StatefulWidget {
  const PredictDiabetes({Key? key}) : super(key: key);

  @override
  State<PredictDiabetes> createState() => _MyFormState();
}

class _MyFormState extends State<PredictDiabetes> {
  final TextEditingController _pregnanciesController = TextEditingController();
  final TextEditingController _glucoseController = TextEditingController();
  final TextEditingController _bloodPressureController =
      TextEditingController();
  final TextEditingController _skinThicknessController =
      TextEditingController();
  final TextEditingController _insulinController = TextEditingController();
  final TextEditingController _bmiController = TextEditingController();
  final TextEditingController _diabetesPedigreeFunctionController =
      TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  String _responseText = '';
  bool _showResponse = false;
  bool _isLoading = false; // Added to track the loading state

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CustomAppBar(title: 'Predict Diabetes', context: context),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      TextField(
                        controller: _pregnanciesController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Pregnancies'),
                      ),
                      TextField(
                        controller: _glucoseController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Glucose'),
                      ),
                      TextField(
                        controller: _bloodPressureController,
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(labelText: 'Blood Pressure'),
                      ),
                      TextField(
                        controller: _skinThicknessController,
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(labelText: 'Skin Thickness'),
                      ),
                      TextField(
                        controller: _insulinController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Insulin'),
                      ),
                      TextField(
                        controller: _bmiController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'BMI'),
                      ),
                      TextField(
                        controller: _diabetesPedigreeFunctionController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Diabetes Pedigree Function'),
                      ),
                      TextField(
                        controller: _ageController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Age'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    // Use ElevatedButton for a visually appealing button
                    onPressed: _isLoading ? null : _submitForm,
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF452c63),
                    ),
                    child: _isLoading
                        ? CircularProgressIndicator() // Show loader if loading
                        : Text(
                            "Predict",
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    setState(() {
      _isLoading = true;
    });
    // Get data from controllers
    final int pregnancies = int.tryParse(_pregnanciesController.text) ?? 0;
    final int glucose = int.tryParse(_glucoseController.text) ?? 0;
    final int bloodPressure = int.tryParse(_bloodPressureController.text) ?? 0;
    final int skinThickness = int.tryParse(_skinThicknessController.text) ?? 0;
    final int insulin = int.tryParse(_insulinController.text) ?? 0;
    final double bmi =
        double.tryParse(_bmiController.text.replaceAll(",", ".")) ?? 0.0;
    final double diabetesPedigreeFunction = double.tryParse(
            _diabetesPedigreeFunctionController.text.replaceAll(",", ".")) ??
        0.0;
    final int age = int.tryParse(_ageController.text) ?? 0;

    // Format BMI and Diabetes Pedigree Function with one decimal place
    String formattedBmi = bmi.toStringAsFixed(1);
    String formattedDiabetesPedigreeFunction =
        diabetesPedigreeFunction.toStringAsFixed(1);

    // Construct URL with parameters
    final String apiUrl =
        'https://disease-prediction-api.onrender.com/diabetes/$pregnancies/$glucose/$bloodPressure/$skinThickness/$insulin/$formattedBmi/$formattedDiabetesPedigreeFunction/$age';

    print(apiUrl);
    // Send request
    _sendRequest(apiUrl);
  }

  void _sendRequest(String url) async {
    try {
      // Send request
      final http.Response response = await http.get(Uri.parse(url));

      // Handle response
      if (response.statusCode == 200) {
        // Successful submission
        print('Form submitted successfully!');
        print('Response data: ${response.body}');
        setState(() {
          _isLoading = false;
        });
        // Parse the prediction result from the response
        final Map<String, dynamic> result = json.decode(response.body);

        // Display a message based on the prediction
        String predictionMessage = '';
        if (result['prediction'] == 1) {
          predictionMessage = 'You have diabetes disease.';
        } else {
          predictionMessage = 'You do not have diabetes disease.';
        }

        setState(() {
          _responseText = predictionMessage;
          _showResponse = true;
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomAlertDialog(description: _responseText);
              });
        });
      } else {
        // Error in submission
        print('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      // Print any errors that occur
      print('Error sending request: $e');
    }
  }
}
