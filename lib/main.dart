import 'package:diagnotech/firebase_options.dart';
import 'package:diagnotech/screens/admin/login.dart';
import 'package:diagnotech/screens/splash_screen.dart';
import 'package:diagnotech/screens/user/appointments.dart';
import 'package:diagnotech/screens/user/bmi_home.dart';
import 'package:diagnotech/screens/user/bmi_result.dart';
import 'package:diagnotech/screens/user/checkout.dart';
import 'package:diagnotech/screens/user/disease_prediction.dart';
import 'package:diagnotech/screens/user/forgot_password.dart';
import 'package:diagnotech/screens/user/login.dart';
import 'package:diagnotech/screens/user/navigator.dart';
import 'package:diagnotech/screens/user/predict_diabetes.dart';
import 'package:diagnotech/screens/user/predict_heart_disease.dart';
import 'package:diagnotech/screens/user/predict_kidney_disease.dart';
import 'package:diagnotech/screens/user/predict_lung_disease.dart';
import 'package:diagnotech/screens/user/navigation.dart';
import 'package:diagnotech/screens/user/disease_selection.dart';
import 'package:diagnotech/screens/admin/navigation.dart';
import 'package:diagnotech/screens/user/register.dart';
import 'package:diagnotech/screens/user/select_tests.dart';
import 'package:diagnotech/screens/user/test_details.dart';
import 'package:diagnotech/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: NavigatorScreen(),
      home: SplashScreen(),
      // home: PredictLungDisease(),
    );
    //  debugShowCheckedModeBanner: false, home: NavigatorScreen());// like this temp you can direct access
  }
}
