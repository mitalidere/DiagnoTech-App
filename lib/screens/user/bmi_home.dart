import 'dart:math';

import 'package:diagnotech/screens/custom_appbar.dart';
import 'package:diagnotech/screens/user/bmi_result.dart';
import 'package:flutter/material.dart';

class BmiHomePage extends StatefulWidget {
  const BmiHomePage({Key? key}) : super(key: key);

  @override
  State<BmiHomePage> createState() => _BmiHomePageState();
}

class _BmiHomePageState extends State<BmiHomePage> {
  int height = 150;
  int weight = 56;
  double bmi = 0;
  int gender = 1;
  int age = 18;
  String category = '';
  Widget CustomRadioButton(String text, int index, IconData genderIcon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          gender = index;
          print('$gender $index');
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xFFC3ACD0),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: (gender == index)
                  ? const Color(0xFF674188)
                  : const Color(0xFFC3ACD0),
              width: 3,
            )),
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Icon(
              genderIcon,
              size: 80,
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child:Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(title: 'BMI Calculator', context: context),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: CustomRadioButton('Female', 0, Icons.female)),
                Expanded(child: CustomRadioButton('Male', 1, Icons.male))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Color(0xFFC3ACD0),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    'Height',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$height cm',
                    style: const TextStyle(
                        fontSize: 48, fontWeight: FontWeight.bold),
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 0,
                    max: 200,
                    divisions: 200,
                    onChanged: (double value) {
                      setState(() {
                        height = value.toInt();
                        // print(height);
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFC3ACD0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      const Text(
                        'Weight',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        '$weight kg',
                        style: const TextStyle(
                            fontSize: 48, fontWeight: FontWeight.w700),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            heroTag: 'weightDecrease',
                            onPressed: () => {
                              setState(() {
                                weight--;
                                print(weight);
                              })
                            },
                            shape: const CircleBorder(),
                            backgroundColor: const Color(0xFF674188),
                            child:
                                const Icon(Icons.remove, color: Colors.white),
                          ),
                          const SizedBox(width: 20.0),
                          FloatingActionButton(
                            heroTag: 'weightIncrease',
                            onPressed: () => {
                              setState(() {
                                weight++;
                                print(weight);
                              })
                            },
                            shape: const CircleBorder(),
                            backgroundColor: const Color(0xFF674188),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ]),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFC3ACD0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      const Text(
                        'Age',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        '$age',
                        style: const TextStyle(
                            fontSize: 48, fontWeight: FontWeight.w700),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            heroTag: 'ageDecrease',
                            onPressed: () => {
                              setState(() {
                                age--;
                                print(age);
                              })
                            },
                            shape: const CircleBorder(),
                            backgroundColor: const Color(0xFF674188),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 20.0),
                          FloatingActionButton(
                            heroTag: 'ageIncrease',
                            onPressed: () => {
                              setState(() {
                                age++;
                                print(age);
                              })
                            },
                            shape: const CircleBorder(),
                            backgroundColor: const Color(0xFF674188),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Material(
        color: const Color(0xFF674188),
        child: InkWell(
          onTap: () {
            // Add your onTap functionality here
            setState(() {
              bmi = (weight / (height * height)) * 10000;
              if (bmi < 18.5) {
                category = "Underweight";
              } else if (bmi > 18.5 && bmi < 24.9) {
                category = "Normal Weight";
              } else if (bmi > 25 && bmi < 29.9) {
                category = "Overweight";
              } else if (bmi > 30 && bmi < 34.9) {
                category = "Obesity (obese)";
              }
            });

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BmiResult(
                    height: height,
                    weight: weight,
                    bmi: bmi,
                    category: category),
              ),
            );
          },
          splashColor: const Color(0xFFC3ACD0),
          child: const SizedBox(
            width: double.infinity, // Full-width button
            height: 50.0, // Fixed height for the button
            // color: Color(0xFF674188), // Button color

            child: Center(
              child: Text(
                'CALCULATE',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      ),
    );
  }
}
