import 'dart:convert';
import 'package:diagnotech/screens/custom_appbar.dart';
import 'package:diagnotech/screens/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PredictHeartDisease extends StatefulWidget {
  const PredictHeartDisease({Key? key}) : super(key: key);

  @override
  State<PredictHeartDisease> createState() => _MyFormState();
}

class _MyFormState extends State<PredictHeartDisease> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _sexController = TextEditingController();
  final TextEditingController _cpController = TextEditingController();
  final TextEditingController _trestbpsController = TextEditingController();
  final TextEditingController _cholController = TextEditingController();
  final TextEditingController _fbsController = TextEditingController();
  final TextEditingController _restecgController = TextEditingController();
  final TextEditingController _thalachController = TextEditingController();
  final TextEditingController _exangController = TextEditingController();
  final TextEditingController _oldpeakController = TextEditingController();
  final TextEditingController _slopeController = TextEditingController();
  final TextEditingController _caController = TextEditingController();
  final TextEditingController _thalController = TextEditingController();
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
                CustomAppBar(title: 'Heart Disease', context: context),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      TextField(
                        controller: _ageController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Age'),
                      ),
                      TextField(
                        controller: _sexController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Sex (0 for female, 1 for male)'),
                      ),
                      TextField(
                        controller: _cpController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Chest Pain Type (0,1,2,3)'),
                      ),
                      TextField(
                        controller: _trestbpsController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Resting Blood Pressure'),
                      ),
                      TextField(
                        controller: _cholController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Serum Cholesterol (mg/dl)'),
                      ),
                      TextField(
                        controller: _fbsController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText:
                                'Fasting Blood Sugar (1 for true, 0 for false)'),
                      ),
                      TextField(
                        controller: _restecgController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText:
                                'Resting Electrocardiographic Results (0,1,2)'),
                      ),
                      TextField(
                        controller: _thalachController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Maximum Heart Rate Achieved'),
                      ),
                      TextField(
                        controller: _exangController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText:
                                'Exercise-Induced Angina (1 for true, 0 for false)'),
                      ),
                      TextField(
                        controller: _oldpeakController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText:
                                'ST Depression Induced by Exercise Relative to Rest'),
                      ),
                      TextField(
                        controller: _slopeController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText:
                                'Slope of the Peak Exercise ST Segment (0,1,2)'),
                      ),
                      TextField(
                        controller: _caController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText:
                                'Number of Major Vessels (0,1,2,3) Colored by Fluoroscopy'),
                      ),
                      TextField(
                        controller: _thalController,
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(labelText: 'Thalassemia (0,1,2,3)'),
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
                ),
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
    final int age = int.tryParse(_ageController.text) ?? 0;
    final int sex = int.tryParse(_sexController.text) ?? 0;
    final int cp = int.tryParse(_cpController.text) ?? 0;
    final int trestbps = int.tryParse(_trestbpsController.text) ?? 0;
    final int chol = int.tryParse(_cholController.text) ?? 0;
    final int fbs = int.tryParse(_fbsController.text) ?? 0;
    final int restecg = int.tryParse(_restecgController.text) ?? 0;
    final int thalach = int.tryParse(_thalachController.text) ?? 0;
    final int exang = int.tryParse(_exangController.text) ?? 0;
    final double oldpeak = double.tryParse(_oldpeakController.text) ?? 0.0;
    final int slope = int.tryParse(_slopeController.text) ?? 0;
    final int ca = int.tryParse(_caController.text) ?? 0;
    final int thal = int.tryParse(_thalController.text) ?? 0;

// Format oldpeak with one decimal place
    String formattedOldpeak = oldpeak.toStringAsFixed(1);

    // Construct URL with parameters
    final String apiUrl =
        'https://disease-prediction-api.onrender.com/heart/$age/$sex/$cp/$trestbps/$chol/$fbs/$restecg/$thalach/$exang/$formattedOldpeak/$slope/$ca/$thal';
    // final String apiUrl =
    //     'https://disease-prediction-api.onrender.com/heart/50/0/0/110/254/0/0/159/0/0.0/2/0/2';
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
        setState(() {
          _isLoading = false;
        });
        // Successful submission
        print('Form submitted successfully!');
        print('Response data: ${response.body}');

        // Parse the prediction result from the response
        final Map<String, dynamic> result = json.decode(response.body);

        // Display a message based on the prediction
        String predictionMessage = '';
        if (result['prediction'] == 1) {
          predictionMessage = 'You have heart disease.';
        } else {
          predictionMessage = 'You do not have heart disease.';
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
