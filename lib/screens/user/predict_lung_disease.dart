import 'dart:convert';
import 'package:diagnotech/screens/custom_appbar.dart';
import 'package:diagnotech/screens/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PredictLungDisease extends StatefulWidget {
  const PredictLungDisease({Key? key}) : super(key: key);

  @override
  State<PredictLungDisease> createState() => _MyFormState();
}

class _MyFormState extends State<PredictLungDisease> {
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _smokingController = TextEditingController();
  final TextEditingController _yellowFingersController =
      TextEditingController();
  final TextEditingController _anxietyController = TextEditingController();
  final TextEditingController _peerPressureController = TextEditingController();
  final TextEditingController _chronicDiseaseController =
      TextEditingController();
  final TextEditingController _fatigueController = TextEditingController();
  final TextEditingController _allergyController = TextEditingController();
  final TextEditingController _wheezingController = TextEditingController();
  final TextEditingController _alcoholConsumingController =
      TextEditingController();
  final TextEditingController _coughingController = TextEditingController();
  final TextEditingController _shortnessOfBreathController =
      TextEditingController();
  final TextEditingController _swallowingDifficultyController =
      TextEditingController();
  final TextEditingController _chestPainController = TextEditingController();

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
                CustomAppBar(title: "Lung Disease", context: context),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      TextField(
                        controller: _genderController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Gender (male=1,female=0)'),
                      ),
                      TextField(
                        controller: _ageController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Age'),
                      ),
                      TextField(
                        controller: _smokingController,
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(labelText: 'Smoking (yes=1,no=0)'),
                      ),
                      TextField(
                        controller: _yellowFingersController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Yellow Fingers (yes=1,no=0)'),
                      ),
                      TextField(
                        controller: _anxietyController,
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(labelText: 'Anxiety (yes=1,no=0)'),
                      ),
                      TextField(
                        controller: _peerPressureController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Peer Pressure (yes=1,no=0)'),
                      ),
                      TextField(
                        controller: _chronicDiseaseController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Chronic Disease (yes=1,no=0)'),
                      ),
                      TextField(
                        controller: _fatigueController,
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(labelText: 'Fatigue (yes=1,no=0)'),
                      ),
                      TextField(
                        controller: _allergyController,
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(labelText: 'Allergy (yes=1,no=0)'),
                      ),
                      TextField(
                        controller: _wheezingController,
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(labelText: 'Wheezing (yes=1,no=0)'),
                      ),
                      TextField(
                        controller: _alcoholConsumingController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Alcohol Consuming (yes=1,no=0)'),
                      ),
                      TextField(
                        controller: _coughingController,
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(labelText: 'Coughing (yes=1,no=0)'),
                      ),
                      TextField(
                        controller: _shortnessOfBreathController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Shortness of Breath (yes=1,no=0)'),
                      ),
                      TextField(
                        controller: _swallowingDifficultyController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Swallowing Difficulty (yes=1,no=0)'),
                      ),
                      TextField(
                        controller: _chestPainController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Chest Pain (yes=1,no=0)'),
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
    final int gender = int.tryParse(_genderController.text) ?? 0;
    final int age = int.tryParse(_ageController.text) ?? 0;
    final int smoking = int.tryParse(_smokingController.text) ?? 0;
    final int yellowFingers = int.tryParse(_yellowFingersController.text) ?? 0;
    final int anxiety = int.tryParse(_anxietyController.text) ?? 0;
    final int peerPressure = int.tryParse(_peerPressureController.text) ?? 0;
    final int chronicDisease =
        int.tryParse(_chronicDiseaseController.text) ?? 0;
    final int fatigue = int.tryParse(_fatigueController.text) ?? 0;
    final int allergy = int.tryParse(_allergyController.text) ?? 0;
    final int wheezing = int.tryParse(_wheezingController.text) ?? 0;
    final int alcoholConsuming =
        int.tryParse(_alcoholConsumingController.text) ?? 0;
    final int coughing = int.tryParse(_coughingController.text) ?? 0;
    final int shortnessOfBreath =
        int.tryParse(_shortnessOfBreathController.text) ?? 0;
    final int swallowingDifficulty =
        int.tryParse(_swallowingDifficultyController.text) ?? 0;
    final int chestPain = int.tryParse(_chestPainController.text) ?? 0;

    // Construct URL with parameters
    final String apiUrl = 'https://disease-prediction-api.onrender.com/lungs/'
        '$gender/$age/$smoking/$yellowFingers/$anxiety/$peerPressure/'
        '$chronicDisease/$fatigue/$allergy/$wheezing/$alcoholConsuming/'
        '$coughing/$shortnessOfBreath/$swallowingDifficulty/$chestPain';

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
          predictionMessage = 'You have lungs disease.';
        } else {
          predictionMessage = 'You do not have lungs disease.';
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
