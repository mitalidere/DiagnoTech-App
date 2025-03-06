import 'package:firebase_auth/firebase_auth.dart';
import 'package:diagnotech/screens/welcome_screen.dart';
import 'package:diagnotech/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../widgets/customized_button.dart';
import '../../widgets/customized_textfield.dart';
import '../global.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

double bmi = 0;
String category = "";
String? gender;

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF452c63),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(
                                0.3), // Set shadow color and opacity
                            spreadRadius: 2.5, // Set spread radius
                            blurRadius: 7, // Set blur radius
                            offset: Offset(0, 3), // Set offset
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Row(
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_back_ios_sharp,
                                  color:
                                      Colors.white, // Set icon color to white
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                "BMI Calculator",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // const Padding(
                    //   padding: EdgeInsets.all(20.0),
                    //   child: Text("BMI Calculator",
                    //       style: TextStyle(
                    //         color: Colors.black,
                    //         fontSize: 26,
                    //         fontWeight: FontWeight.bold,
                    //       )),
                    // ),
                    SizedBox(height: 40),
                    CustomizedTextfield(
                      myController: _heightController,
                      hintText: "Height (in metres)",
                      isPassword: false,
                    ),
                    CustomizedTextfield(
                      myController: _weightController,
                      hintText: "Weight (in kg)",
                      isPassword: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35, right: 35),
                      child: Row(
                        children: [
                          Expanded(
                              child: RadioListTile(
                            title: const Text("Male"),
                            value: "male",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            },
                          )),
                          Expanded(
                              child: RadioListTile(
                            title: const Text("Female"),
                            value: "female",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            },
                          )),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CustomizedButton(
                        buttonText: "Calculate BMI",
                        buttonColor: const Color(0xFF452c63),
                        textColor: Colors.white,
                        onPressed: () {
                          if (_heightController.text != "" &&
                              _weightController.text != "") {
                            bmi = (double.parse(_weightController.text) /
                                (double.parse(_heightController.text) *
                                    double.parse(_heightController.text)));
                            if (bmi < 18.5) {
                              category = "Underweight";
                            } else if (bmi > 18.5 && bmi < 24.9) {
                              category = "Normal Weight";
                            } else if (bmi > 25 && bmi < 29.9) {
                              category = "Overweight";
                            } else if (bmi > 30 && bmi < 34.9) {
                              category = "Obesity (obese)";
                            }
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: SizedBox(
                                    height: 100,
                                    child: Column(
                                      children: [
                                        const Text("BMI Report"),
                                        const SizedBox(height: 10),
                                        Container(
                                          height: 1,
                                          width: 250,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                            "BMI Score: ${bmi.toStringAsFixed(2)}\nBMI Category: $category"),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Please enter height and weight"),
                            ));
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Table(
                          border: TableBorder.all(
                            width: 1,
                            color: Colors.grey,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                          columnWidths: {
                            0: FlexColumnWidth(),
                            1: FlexColumnWidth(),
                          },
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: [
                            TableRow(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF452c63),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                  ),
                                ),
                                children: [
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Container(
                                      height: 50, // Set the height of the cell
                                      child: Center(
                                        child: Text(
                                          "Category",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Container(
                                      height: 50, // Set the height of the cell
                                      child: Center(
                                        child: Text(
                                          "BMI Limit kg/m^2",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                            TableRow(children: [
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(child: Text("Underweight")),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(child: Text("< 18.5")),
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(child: Text("Normal Weight")),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(child: Text("18.5 - 24.9")),
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(child: Text("Overweight")),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(child: Text("25 - 29.9")),
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(child: Text("Obesity (obese)")),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(child: Text("> 30")),
                                ),
                              ),
                            ]),
                          ],
                        )),
                  ],
                ),
              ))),
    );
  }
}
