import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:diagnotech/screens/user/otp_verification.dart';
import 'package:diagnotech/screens/welcome_screen.dart';
import 'package:diagnotech/services/firebase_auth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../widgets/customized_button.dart';
import '../../widgets/customized_textfield.dart';
import '../global.dart';
import 'navigation.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isEmailVerified = false;
  EmailOTP myauth = EmailOTP();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Container(
              color: Color(0xFFC3ACD0),
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
                          icon: Icon(Icons.arrow_back_ios_sharp),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const WelcomeScreen()));
                          }),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      'Sign Up',
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
                        child: Text("Please sign up to continue our app",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
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
                      CustomizedTextfield(
                        myController: _confirmpasswordController,
                        hintText: "Confirm Password",
                        isPassword: true,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CustomizedButton(
                          buttonText: "Register",
                          buttonColor: const Color(0xFF795695),
                          textColor: Colors.white,
                          onPressed: () async {
                            try {
                              if (_passwordController.text.length <= 6 ||
                                  _confirmpasswordController.text.length <= 6) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text("Password must be greater than 6"),
                                  ),
                                );
                              } else {
                                myauth.setConfig(
                                    appEmail: "mitalidere030@gmail.com",
                                    appName: "E-Lab",
                                    userEmail: _emailController.text,
                                    otpLength: 4,
                                    otpType: OTPType.digitsOnly);
                                // Show loading indicator
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Sending OTP..."),
                                        CircularProgressIndicator(),
                                      ],
                                    ),
                                  ),
                                );

                                bool result = await myauth.sendOTP();

                                // Close loading indicator
                                ScaffoldMessenger.of(context)
                                    .removeCurrentSnackBar();

                                if (result == true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Please verify your email"),
                                    ),
                                  );

                                  if (_passwordController.text ==
                                      _confirmpasswordController.text) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => OtpScreen(
                                          myauth: myauth,
                                          emailController: _emailController,
                                          passwordController:
                                              _passwordController,
                                        ),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text("Password must be the same"),
                                      ),
                                    );
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Something went wrong"),
                                    ),
                                  );
                                }
                              }
                            } on FirebaseException catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Something went wrong"),
                                ),
                              );
                              if (kDebugMode) {
                                print(e.message);
                              }
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
                              width: MediaQuery.of(context).size.height * 0.19,
                              color: Colors.grey,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                "OR",
                              ),
                            ),
                            Container(
                              height: 1,
                              width: MediaQuery.of(context).size.height * 0.19,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () async {
                              await FirebaseAuthService().registerwithgoogle();
                              GoogleSignInAccount? googleUser =
                                  await GoogleSignIn().signIn();
                              GoogleSignInAuthentication? googleAuth =
                                  await googleUser?.authentication;

                              AuthCredential myCredential =
                                  GoogleAuthProvider.credential(
                                accessToken: googleAuth?.accessToken,
                                idToken: googleAuth?.idToken,
                              );
                              UserCredential user = await FirebaseAuth.instance
                                  .signInWithCredential(myCredential);
                              userEmail = user.user?.email;
                              if (FirebaseAuth.instance.currentUser != null) {
                                if (!mounted) return;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UserNavigation()));
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
                          const Text("Already have an account? ",
                              style: TextStyle(
                                color: Color(0xff6A707C),
                                fontSize: 14,
                              )),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const UserLogin()));
                            },
                            child: const Text("Login Now",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                )),
                          ),
                        ],
                      ),
                    ]),
                  )
                ],
              )),
        ),
      )),
    );
  }
}
