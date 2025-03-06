import 'package:diagnotech/screens/admin/login.dart';
import 'package:diagnotech/screens/user/login.dart';
import 'package:diagnotech/screens/user/navigation.dart';
import 'package:diagnotech/widgets/customized_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:email_otp/email_otp.dart';

import '../../services/firebase_auth_service.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({Key? key, required this.otpController})
      : super(key: key);
  final TextEditingController otpController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: TextField(
        controller: otpController,
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
}

class OtpScreen extends StatefulWidget {
  const OtpScreen(
      {Key? key,
      required this.myauth,
      required this.emailController,
      required this.passwordController})
      : super(key: key);
  final EmailOTP myauth;
  final emailController;
  final passwordController;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otp1Controller = TextEditingController();
  TextEditingController otp2Controller = TextEditingController();
  TextEditingController otp3Controller = TextEditingController();
  TextEditingController otp4Controller = TextEditingController();

  String otpController = "1234";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_sharp,
                            color: Color(0xFF452c63),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const AdminLogin()));
                          }),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Text("Enter Otp",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 20, top: 15),
                    child: Text(
                        "Please enter the OTP generated on your registered email address",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OtpVerificationScreen(otpController: otp1Controller),
                      OtpVerificationScreen(otpController: otp2Controller),
                      OtpVerificationScreen(otpController: otp3Controller),
                      OtpVerificationScreen(otpController: otp4Controller)
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CustomizedButton(
                      buttonText: "Verify OTP",
                      buttonColor: Color(0xFF452c63),
                      textColor: Colors.white,
                      onPressed: () async {
                        try {
                          if (await widget.myauth.verifyOTP(
                                  otp: otp1Controller.text +
                                      otp2Controller.text +
                                      otp3Controller.text +
                                      otp4Controller.text) ==
                              true) {
                            await FirebaseAuthService().register(
                                widget.emailController.text.trim(),
                                widget.passwordController.text.trim());

                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content:
                                  Text("OTP is verified. Please login again"),
                            ));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserLogin()));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Invalid OTP"),
                            ));
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Email is already registered"),
                          ));
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ))),
    );
  }
}
