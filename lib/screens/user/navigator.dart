import 'package:diagnotech/screens/custom_tile.dart';
import 'package:diagnotech/screens/user/bmi_home.dart';
import 'package:diagnotech/screens/logout.dart';
import 'package:diagnotech/screens/user/disease_prediction.dart';
import 'package:diagnotech/screens/user/disease_selection.dart';
import 'package:diagnotech/screens/user/navigation.dart';
import 'package:flutter/material.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({Key? key}) : super(key: key);

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
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
                        border: Border.all(),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(
                                0.3), // Set shadow color and opacity
                            spreadRadius: 2, // Set spread radius
                            blurRadius: 7, // Set blur radius
                            offset: const Offset(0, 3), // Set offset
                          ),
                        ],
                      ),
                      // Background color
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 20),
                                child: Text(
                                  "Welcome Back!",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 20.0, top: 20.0),
                                child: IconButton(
                                  icon: const Icon(Icons.logout,
                                      color: Colors.white),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => const Logout()));
                                    // Add logout functionality
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomTile(
                            name: 'Lab Tests',
                            imagePath: 'assets/labtest.jpg',
                            navigationPage: UserNavigation(),
                          ),
                          SizedBox(height: 20),
                          CustomTile(
                            name: 'BMI Calculator',
                            imagePath: 'assets/bmicalculator.jpg',
                            navigationPage: BmiHomePage(),
                          ),
                          SizedBox(height: 20),
                          CustomTile(
                            name: 'Yoga and Diet Recommendtions',
                            imagePath: 'assets/yoga.png',
                            navigationPage: DiseaseSelectionScreen(),
                          ),
                          SizedBox(height: 20),
                          CustomTile(
                            name: 'Disease Prediction',
                            imagePath: 'assets/disease-prediction.jpg',
                            navigationPage: DiseasePredictionScreen(),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
