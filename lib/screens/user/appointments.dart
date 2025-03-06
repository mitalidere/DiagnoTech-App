import 'package:firebase_auth/firebase_auth.dart';
import 'package:diagnotech/screens/user/test_details.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../global.dart';

class Appointments extends StatefulWidget {
  const Appointments({Key? key}) : super(key: key);

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
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
                if (snapshot.child('email').value.toString() == userEmail) {
                  return SizedBox(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 15, right: 15),
                      child: SingleChildScrollView(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => TestDetails(
                                  id: '${snapshot.key}',
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              // border: Border.all(width: 0.5, color: Colors.grey),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  offset: const Offset(
                                    5.0,
                                    5.0,
                                  ),
                                  blurRadius: 10.0,
                                  spreadRadius: 2.0,
                                ),
                                const BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 0.0,
                                  spreadRadius: 0.0,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: ListTile(
                                    title: Text(
                                      "Appointment Date: ${snapshot.child('appointmentdate').value}",
                                    ),
                                    subtitle: Text("\nId: ${snapshot.key}"),
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
                    ),
                  );
                } else {
                  return SizedBox(height: 1);
                }
              }),
        ),
      ),
    );
  }
}
