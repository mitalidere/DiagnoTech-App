import 'package:firebase_auth/firebase_auth.dart';
import 'package:diagnotech/screens/admin/upload_report.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

final TextEditingController _dateInputController = TextEditingController();

class AppointmentsScreen2 extends StatefulWidget {
  const AppointmentsScreen2({Key? key, required this.dateController})
      : super(key: key);
  final dateController;

  @override
  State<AppointmentsScreen2> createState() => _AppointmentsScreenState2();
}

class _AppointmentsScreenState2 extends State<AppointmentsScreen2> {
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
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF452c63),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2.5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 20, top: 0, right: 10, bottom: 20),
                    child: Center(
                      child: Text(
                        "Appointments",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FirebaseAnimatedList(
                  query: dbRef,
                  itemBuilder: (context, snapshot, animation, index) {
                    if (snapshot.child('appointmentdate').value.toString() ==
                        widget.dateController.text.toString()) {
                      return SizedBox(
                        height: 131,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 15, bottom: 5),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => UploadReport(
                                    id: '${snapshot.key}',
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  // border:Border.all(width: 1, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ]),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: ListTile(
                                      title: Text(
                                        "Appointment Date: ${snapshot.child('appointmentdate').value}",
                                      ),
                                      subtitle: Text(
                                        "\n${snapshot.child('fullname').value}",
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 20.0, right: 20),
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        child: const Icon(
                                            Icons.keyboard_double_arrow_right),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return SizedBox(height: 1);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
