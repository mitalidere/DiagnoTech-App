import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import '../../widgets/customized_button.dart';
import 'package:intl/intl.dart';

class SendEmail extends StatefulWidget {
  var id;
  SendEmail({Key? key, required this.id}) : super(key: key);

  @override
  State<SendEmail> createState() => _SendEmailState();
}

class _SendEmailState extends State<SendEmail> {
  final _key = GlobalKey<FormState>();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _time = TextEditingController();

  sendEmail(String subject, String body, String recipientemail) async {
    final Email email = Email(
        body: body,
        subject: subject,
        recipients: [recipientemail],
        isHTML: false);
    await FlutterEmailSender.send(email);
  }

  final auth = FirebaseAuth.instance;
  final dbRef = FirebaseDatabase.instance.ref('Appointments');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: FirebaseAnimatedList(
              query: dbRef,
              itemBuilder: (context, snapshot, animation, index) {
                if (snapshot.key.toString() == widget.id) {
                  return SizedBox(
                    height: 900,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  // border:// Border.all(color: Colors.black, width: 1),
                                  // borderRadius: BorderRadius.circular(10),
                                ),
                                child: IconButton(
                                    icon:
                                        const Icon(Icons.arrow_back_ios_sharp),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 0, left: 10, right: 20),
                            child: Column(children: [
                              Text(
                                "\Appointment Date: ${snapshot.child('appointmentdate').value}",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    top: 20, bottom: 10, right: 10, left: 20),
                                child: SizedBox(
                                  height: 1,
                                  width: 300,
                                  child: DecoratedBox(
                                      decoration:
                                          BoxDecoration(color: Colors.grey)),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Text(
                                  "\nId: ${snapshot.key}\n\nEmail Id: ${snapshot.child('email').value}\n\nName: ${snapshot.child('fullname').value}\n\nAge: ${snapshot.child('age').value}\n\nGender: ${snapshot.child('appointmentdate').value}\n\nBlood Group: ${snapshot.child('bloodgroup').value}\n\nHeight: ${snapshot.child('height').value}\n\nWeight: ${snapshot.child('weight').value}\n\nPhone No.: ${snapshot.child('phoneno').value}\n\nAddress: ${snapshot.child('address').value}\n\nClinical Pathology Tests: ${snapshot.child('clinicalpathologytests').value}\n\nProfile Tests: ${snapshot.child('profiletests').value}\n\nSerology Tests: ${snapshot.child('serologytests').value}\n\nBiochemistry Tests: ${snapshot.child('biochemistrytests').value}\n\nPayment Mode: ${snapshot.child('paymentMode').value}\n\nTotal Cost: ${snapshot.child('totalcost').value}",
                                  style: const TextStyle(
                                      fontSize: 14, color: Color(0xFF616161)),
                                ),
                              ),
                            ]),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: Form(
                                key: _key,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        hintText: 'Appointment Date',
                                      ),
                                      controller: _date,
                                      readOnly: true,
                                      onTap: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now().subtract(
                                              const Duration(days: 0)),
                                          lastDate: DateTime.now()
                                              .add(const Duration(days: 6)),
                                        );

                                        if (pickedDate != null) {
                                          _date.text =
                                              DateFormat('dd MMMM yyyy')
                                                  .format(pickedDate);
                                        }
                                      },
                                    ),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        hintText: 'Appointment Time',
                                      ),
                                      controller: _time,
                                    ),
                                    CustomizedButton(
                                      buttonText: "Send Email",
                                      buttonColor: const Color(0xFF452c63),
                                      textColor: Colors.white,
                                      onPressed: () {
                                        if (_date.text != "" &&
                                            _time.text != "") {
                                          _key.currentState!.save();
                                          sendEmail(
                                              'Message from E-Lab',
                                              'Your appointment is scheduled on ${_date.text} at ${_time.text}.',
                                              '${snapshot.child('email').value}');
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                            content: Text(
                                                "Please fill all the details"),
                                          ));
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  );
                } else {
                  return const SizedBox(height: 0);
                }
              }),
        ),
      ),
    );
  }
}
