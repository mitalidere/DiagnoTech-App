import 'package:firebase_auth/firebase_auth.dart';
import 'package:diagnotech/screens/user/forgot_password.dart';
import 'package:diagnotech/screens/user/navigation.dart';
import 'package:diagnotech/screens/user/navigator.dart';
import 'package:diagnotech/screens/user/register.dart';
import 'package:diagnotech/screens/welcome_screen.dart';
import 'package:diagnotech/services/firebase_auth_service.dart';
import 'package:diagnotech/widgets/customized_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../widgets/customized_button.dart';
import '../global.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
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
                            // border: Border.all(color: const Color(0xFF795695), width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                              icon: const Icon(Icons.arrow_back_ios_sharp),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const WelcomeScreen()));
                              }),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/loginbg.png', // Replace 'your_image.png' with your image asset path
                          height: 130, // Adjust height as needed
                          width: 120, // Adjust width as needed
                          fit: BoxFit.cover, // Adjust image fit as needed
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Text(
                          'Login',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
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
                            child: Text("Please log in to continue our app",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          CustomizedTextfield(
                            myController: _emailController,
                            hintText: "Email",
                            isPassword: false,
                          ),
                          CustomizedTextfield(
                            myController: _passwordController,
                            hintText: "Password",
                            isPassword: true,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 20, bottom: 10, top: 5),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              const ForgotPassword()));
                                },
                                child: const Text("Forgot Password?",
                                    style: TextStyle(
                                      color: const Color(0xFF795695),
                                      fontSize: 14,
                                    )),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: CustomizedButton(
                              buttonText: "Login",
                              buttonColor: const Color(0xFF795695),
                              textColor: Colors.white,
                              onPressed: () async {
                                try {
                                  await FirebaseAuthService().login(
                                      _emailController.text.trim(),
                                      _passwordController.text.trim());
                                  if (FirebaseAuth.instance.currentUser !=
                                      null) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text("Login successful"),
                                    ));
                                    userEmail = _emailController.text;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const NavigatorScreen()));
                                  }
                                } on FirebaseException catch (e) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content:
                                        Text("Invalid username or password"),
                                  ));
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 1,
                                  width:
                                      MediaQuery.of(context).size.height * 0.19,
                                  color: Colors.grey,
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Text("OR"),
                                ),
                                Container(
                                  height: 1,
                                  width:
                                      MediaQuery.of(context).size.height * 0.19,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () async {
                                  await FirebaseAuthService()
                                      .registerwithgoogle();
                                  GoogleSignInAccount? googleUser =
                                      await GoogleSignIn().signIn();
                                  GoogleSignInAuthentication? googleAuth =
                                      await googleUser?.authentication;

                                  AuthCredential myCredential =
                                      GoogleAuthProvider.credential(
                                    accessToken: googleAuth?.accessToken,
                                    idToken: googleAuth?.idToken,
                                  );
                                  UserCredential user = await FirebaseAuth
                                      .instance
                                      .signInWithCredential(myCredential);
                                  userEmail = user.user?.email;
                                  if (FirebaseAuth.instance.currentUser !=
                                      null) {
                                    if (!mounted) return;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const NavigatorScreen()));
                                  }
                                },
                                child: Container(
                                    height: 47,
                                    width: 220,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                      children: const <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Image(
                                            image: AssetImage(
                                                "assets/google_logo.png"),
                                            height: 30,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            'Continue with Google',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                              )),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account? ",
                                  style: TextStyle(
                                    color: Color(0xff6A707C),
                                    fontSize: 14,
                                  )),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const Register()));
                                },
                                child: const Text("Register Now",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 14,
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ]),
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }
}
