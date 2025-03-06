import 'package:diagnotech/screens/custom_appbar.dart';
import 'package:diagnotech/screens/custom_tile.dart';
import 'package:diagnotech/screens/user/diseases/high_cholesterol.dart';
import 'package:diagnotech/screens/user/diseases/pcos.dart';
import 'package:flutter/material.dart';
import 'diseases/high_blood_pressure.dart';
import 'diseases/diabetes.dart';
import 'diseases/fatty_liver.dart';
import 'diseases/migraine.dart';
import 'diseases/thyroid.dart';

class DiseaseSelectionScreen extends StatefulWidget {
  const DiseaseSelectionScreen({Key? key}) : super(key: key);

  @override
  State<DiseaseSelectionScreen> createState() => _DiseaseSelectionScreenState();
}

class _DiseaseSelectionScreenState extends State<DiseaseSelectionScreen> {
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
                    CustomAppBar(title: 'Select Disease', context: context),
                    const SizedBox(height: 40),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomTile(
                              name: 'Diabetes',
                              imagePath: 'assets/yoga-diabetes.jpg',
                              navigationPage: Diabetes()),
                          SizedBox(height: 20),
                          CustomTile(
                              name: 'Migraine',
                              imagePath: 'assets/yoga-migraine.jpg',
                              navigationPage: Migraine()),
                          SizedBox(height: 20),
                          CustomTile(
                              name: 'Thyroid',
                              imagePath: 'assets/yoga-thyroid.jpg',
                              navigationPage: Thyroid()),
                          SizedBox(height: 20),
                          CustomTile(
                              name: 'PCOS',
                              imagePath: 'assets/yoga-pcos.jpg',
                              navigationPage: Pcos()),
                          SizedBox(height: 20),
                          CustomTile(
                              name: 'Fatty Liver',
                              imagePath: 'assets/yoga-fatty-liver.jpg',
                              navigationPage: FattyLiver()),
                          SizedBox(height: 20),
                          CustomTile(
                              name: 'High Cholesterol',
                              imagePath: 'assets/yoga-high-cholesterol.jpg',
                              navigationPage: HighCholesterol()),
                          SizedBox(height: 20),
                          CustomTile(
                              name: 'High BloodPressure',
                              imagePath: 'assets/yoga-high-bloodpressure.jpg',
                              navigationPage: HighBloodPressure()),
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
