import 'dart:convert';

import 'package:diagnotech/screens/custom_appbar.dart';
import 'package:diagnotech/screens/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../widgets/customized_button.dart';

class PredictKidneyDisease extends StatefulWidget {
  const PredictKidneyDisease({Key? key}) : super(key: key);

  @override
  State<PredictKidneyDisease> createState() => _MyFormState();
}

class _MyFormState extends State<PredictKidneyDisease> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _bloodPressureController =
      TextEditingController();
  final TextEditingController _specificGravityController =
      TextEditingController();
  final TextEditingController _albuminController = TextEditingController();
  final TextEditingController _sugarController = TextEditingController();
  final TextEditingController _redBloodCellsController =
      TextEditingController();
  final TextEditingController _pusCellController = TextEditingController();
  final TextEditingController _pusCellClumpsController =
      TextEditingController();
  final TextEditingController _bacteriaController = TextEditingController();
  final TextEditingController _bloodGlucoseRandomController =
      TextEditingController();
  final TextEditingController _bloodUreaController = TextEditingController();
  final TextEditingController _serumCreatinineController =
      TextEditingController();
  final TextEditingController _sodiumController = TextEditingController();
  final TextEditingController _potassiumController = TextEditingController();
  final TextEditingController _haemoglobinController = TextEditingController();
  final TextEditingController _packedCellVolumeController =
      TextEditingController();
  final TextEditingController _whiteBloodCellCountController =
      TextEditingController();
  final TextEditingController _redBloodCellCountController =
      TextEditingController();
  final TextEditingController _hypertensionController = TextEditingController();
  final TextEditingController _diabetesMellitusController =
      TextEditingController();
  final TextEditingController _coronaryArteryDiseaseController =
      TextEditingController();
  final TextEditingController _appetiteController = TextEditingController();
  final TextEditingController _pedalEdemaController = TextEditingController();
  final TextEditingController _anemiaController = TextEditingController();

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
                CustomAppBar(title: "Kidney Disease", context: context),
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
                        controller: _bloodPressureController,
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(labelText: 'Blood Pressure'),
                      ),
                      TextField(
                        controller: _specificGravityController,
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(labelText: 'Specific Gravity'),
                      ),
                      TextField(
                        controller: _albuminController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Albumin'),
                      ),
                      TextField(
                        controller: _sugarController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Sugar'),
                      ),
                      TextField(
                        controller: _redBloodCellsController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText:
                                'Red Blood Cells (normal=1 or abnormal=0)'),
                      ),
                      TextField(
                        controller: _pusCellController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Pus Cell (normal=1 or abnormal=0)'),
                      ),
                      TextField(
                        controller: _pusCellClumpsController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText:
                                'Pus Cell Clumps (present=1 or notpresent=0)'),
                      ),
                      TextField(
                        controller: _bacteriaController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Bacteria (present=1 or notpresent=0)'),
                      ),
                      TextField(
                        controller: _bloodGlucoseRandomController,
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(labelText: 'Blood Glucose Random'),
                      ),
                      TextField(
                        controller: _bloodUreaController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Blood Urea'),
                      ),
                      TextField(
                        controller: _serumCreatinineController,
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(labelText: 'Serum Creatinine'),
                      ),
                      TextField(
                        controller: _sodiumController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Sodium'),
                      ),
                      TextField(
                        controller: _potassiumController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Potassium'),
                      ),
                      TextField(
                        controller: _haemoglobinController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Haemoglobin'),
                      ),
                      TextField(
                        controller: _packedCellVolumeController,
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(labelText: 'Packed Cell Volume'),
                      ),
                      TextField(
                        controller: _whiteBloodCellCountController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'White Blood Cell Count'),
                      ),
                      TextField(
                        controller: _redBloodCellCountController,
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(labelText: 'Red Blood Cell Count'),
                      ),
                      TextField(
                        controller: _hypertensionController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Hypertension (yes=1 or no=0)'),
                      ),
                      TextField(
                        controller: _diabetesMellitusController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Diabetes Mellitus (yes=1 or no=0)'),
                      ),
                      TextField(
                        controller: _coronaryArteryDiseaseController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText:
                                'Coronary Artery Disease (yes=1 or no=0)'),
                      ),
                      TextField(
                        controller: _appetiteController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Appetite (good=0 or poor=1)'),
                      ),
                      TextField(
                        controller: _pedalEdemaController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Peda Edema (yes=1 or no=0)'),
                      ),
                      TextField(
                        controller: _anemiaController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Anemia (yes=1 or no=0)'),
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
    // Set loading state to true before sending the request
    setState(() {
      _isLoading = true;
    });
    // Get data from controllers
    final double age = double.tryParse(_ageController.text) ?? 0.0;
    final double bloodPressure =
        double.tryParse(_bloodPressureController.text) ?? 0.0;
    final double specificGravity =
        double.tryParse(_specificGravityController.text) ?? 0.0;
    final double albumin = double.tryParse(_albuminController.text) ?? 0.0;
    final double sugar = double.tryParse(_sugarController.text) ?? 0.0;
    final double redBloodCells =
        double.tryParse(_redBloodCellsController.text) ?? 0.0;
    final double pusCell = double.tryParse(_pusCellController.text) ?? 0.0;
    final double pusCellClumps =
        double.tryParse(_pusCellClumpsController.text) ?? 0.0;
    final double bacteria = double.tryParse(_bacteriaController.text) ?? 0.0;
    final double bloodGlucoseRandom =
        double.tryParse(_bloodGlucoseRandomController.text) ?? 0.0;
    final double bloodUrea = double.tryParse(_bloodUreaController.text) ?? 0.0;
    final double serumCreatinine =
        double.tryParse(_serumCreatinineController.text) ?? 0.0;
    final double sodium = double.tryParse(_sodiumController.text) ?? 0.0;
    final double potassium = double.tryParse(_potassiumController.text) ?? 0.0;
    final double haemoglobin =
        double.tryParse(_haemoglobinController.text) ?? 0.0;
    final double packedCellVolume =
        double.tryParse(_packedCellVolumeController.text) ?? 0.0;
    final double whiteBloodCellCount =
        double.tryParse(_whiteBloodCellCountController.text) ?? 0.0;
    final double redBloodCellCount =
        double.tryParse(_redBloodCellCountController.text) ?? 0.0;
    final double hypertension =
        double.tryParse(_hypertensionController.text) ?? 0.0;
    final double diabetesMellitus =
        double.tryParse(_diabetesMellitusController.text) ?? 0.0;
    final double coronaryArteryDisease =
        double.tryParse(_coronaryArteryDiseaseController.text) ?? 0.0;
    final double appetite = double.tryParse(_appetiteController.text) ?? 0.0;
    final double pedalEdema =
        double.tryParse(_pedalEdemaController.text) ?? 0.0;
    final double anemia = double.tryParse(_anemiaController.text) ?? 0.0;

    // Format float values with one decimal place
    final formattedAge = age.toStringAsFixed(1);
    final formattedBloodPressure = bloodPressure.toStringAsFixed(1);
    final formattedSpecificGravity = specificGravity.toStringAsFixed(1);
    final formattedAlbumin = albumin.toStringAsFixed(1);
    final formattedSugar = sugar.toStringAsFixed(1);
    final formattedRedBloodCells = redBloodCells.toStringAsFixed(1);
    final formattedPusCell = pusCell.toStringAsFixed(1);
    final formattedPusCellClumps = pusCellClumps.toStringAsFixed(1);
    final formattedBacteria = bacteria.toStringAsFixed(1);
    final formattedBloodGlucoseRandom = bloodGlucoseRandom.toStringAsFixed(1);
    final formattedBloodUrea = bloodUrea.toStringAsFixed(1);
    final formattedSerumCreatinine = serumCreatinine.toStringAsFixed(1);
    final formattedSodium = sodium.toStringAsFixed(1);
    final formattedPotassium = potassium.toStringAsFixed(1);
    final formattedHaemoglobin = haemoglobin.toStringAsFixed(1);
    final formattedPackedCellVolume = packedCellVolume.toStringAsFixed(1);
    final formattedWhiteBloodCellCount = whiteBloodCellCount.toStringAsFixed(1);
    final formattedRedBloodCellCount = redBloodCellCount.toStringAsFixed(1);
    final formattedHypertension = hypertension.toStringAsFixed(1);
    final formattedDiabetesMellitus = diabetesMellitus.toStringAsFixed(1);
    final formattedCoronaryArteryDisease =
        coronaryArteryDisease.toStringAsFixed(1);
    final formattedAppetite = appetite.toStringAsFixed(1);
    final formattedPedalEdema = pedalEdema.toStringAsFixed(1);
    final formattedAnemia = anemia.toStringAsFixed(1);

    // Construct URL with parameters
    final String apiUrl = 'https://disease-prediction-api.onrender.com/kidney/'
        '$formattedAge/$formattedBloodPressure/$formattedSpecificGravity/'
        '$formattedAlbumin/$formattedSugar/$formattedRedBloodCells/'
        '$formattedPusCell/$formattedPusCellClumps/$formattedBacteria/'
        '$formattedBloodGlucoseRandom/$formattedBloodUrea/'
        '$formattedSerumCreatinine/$formattedSodium/$formattedPotassium/'
        '$formattedHaemoglobin/$formattedPackedCellVolume/'
        '$formattedWhiteBloodCellCount/$formattedRedBloodCellCount/'
        '$formattedHypertension/$formattedDiabetesMellitus/'
        '$formattedCoronaryArteryDisease/$formattedAppetite/'
        '$formattedPedalEdema/$formattedAnemia';

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
        // Set loading state to true before sending the request
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
          predictionMessage = 'You have kidney disease.';
        } else {
          predictionMessage = 'You do not have kidney disease.';
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
