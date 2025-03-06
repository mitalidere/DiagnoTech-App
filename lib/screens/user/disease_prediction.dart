import 'package:diagnotech/screens/custom_appbar.dart';
import 'package:diagnotech/screens/custom_tile.dart';
import 'package:diagnotech/screens/user/predict_diabetes.dart';
import 'package:diagnotech/screens/user/predict_heart_disease.dart';
import 'package:diagnotech/screens/user/predict_kidney_disease.dart';
import 'package:diagnotech/screens/user/predict_lung_disease.dart';
import 'package:flutter/material.dart';

class DiseasePredictionScreen extends StatefulWidget {
  const DiseasePredictionScreen({Key? key}) : super(key: key);

  @override
  State<DiseasePredictionScreen> createState() =>
      _DiseasePredictionScreenState();
}

class _DiseasePredictionScreenState extends State<DiseasePredictionScreen> {
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
                    CustomAppBar(title: 'Disease Prediction', context: context),
                    const SizedBox(height: 40),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomTile(
                              name: 'Diabetes',
                              imagePath: 'assets/disease-diabetese.jpg',
                              navigationPage: PredictDiabetes()),
                          SizedBox(height: 20),
                          CustomTile(
                              name: 'Heart Disease',
                              imagePath: 'assets/disease-heart.jpg',
                              navigationPage: PredictHeartDisease()),
                          SizedBox(height: 20),
                          CustomTile(
                              name: 'Lung Disease',
                              imagePath: 'assets/disease-lungs.jpg',
                              navigationPage: PredictLungDisease()),
                          SizedBox(height: 20),
                          CustomTile(
                              name: 'Kidney Disease',
                              imagePath: 'assets/disease-kidney.jpg',
                              navigationPage: PredictKidneyDisease()),
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
