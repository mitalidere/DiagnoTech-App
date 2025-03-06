import 'package:diagnotech/screens/welcome_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../widgets/customized_button.dart';
import '../../widgets/customized_textfield.dart';
import 'navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final auth = FirebaseAuth.instance;
  // final dbRef = FirebaseDatabase.instance.reference().child('Admin');
  final dbRef = FirebaseDatabase.instance.ref('Admin');
  final TextEditingController _passwordController = TextEditingController();

  Future<void> login() async {
    try {
      DatabaseEvent event = await dbRef.once();
      DataSnapshot snapshot = event.snapshot;

      dynamic data = snapshot.value;
      if (data != null && data is String) {
        String adminPassword = data;
        if (_passwordController.text == adminPassword) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Login successful"),
            ),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdminNavigation(),
            ),
          );
          return; // Exit the method after successful login
        }
      }

      // If any condition fails, show the invalid password message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid password'),
        ),
      );
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFC3ACD0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_sharp),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const WelcomeScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/loginbg.png', // Replace 'your_image.png' with your image asset path
                      height: 200, // Adjust height as needed
                      width: 200, // Adjust width as needed
                      fit: BoxFit.cover, // Adjust image fit as needed
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                    ),
                    child: Column(children: [
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text("Welcome Back! Glad to see you, Again! 🩺",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      CustomizedTextfield(
                        myController: _passwordController,
                        hintText: "Password",
                        isPassword: true,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CustomizedButton(
                          buttonText: "Login",
                          buttonColor: const Color(0xFF795695),
                          textColor: Colors.white,
                          onPressed: login,
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
