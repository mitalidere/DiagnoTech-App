import 'package:diagnotech/screens/custom_appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class TestDetails extends StatelessWidget {
  String id;
  TestDetails({Key? key, required this.id}) : super(key: key);

  final auth = FirebaseAuth.instance;
  final dbRef = FirebaseDatabase.instance.ref('Appointments');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomAppBar(title: "Appointment Details ", context: context),
            Expanded(
              child: FirebaseAnimatedList(
                query: dbRef,
                itemBuilder: (context, snapshot, animation, index) {
                  if (snapshot.key.toString() == id) {
                    return SingleChildScrollView(
                      child: Container(
                        margin:
                            EdgeInsets.only(top: 0), // Adjust top margin here
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 0,
                                left: 10,
                                right: 20,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "Appointment Date: ${snapshot.child('appointmentdate').value}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      top: 10,
                                      bottom: 10,
                                      right: 10,
                                      left: 20,
                                    ),
                                    child: SizedBox(
                                      height: 1,
                                      width: 300,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                    ),
                                    child: Text(
                                      "\nId: ${snapshot.key}\n\nName: ${snapshot.child('fullname').value}\n\nAge: ${snapshot.child('age').value}\n\nGender: ${snapshot.child('appointmentdate').value}\n\nBlood Group: ${snapshot.child('bloodgroup').value}\n\nHeight: ${snapshot.child('height').value}\n\nWeight: ${snapshot.child('weight').value}\n\nPhone No.: ${snapshot.child('phoneno').value}\n\nAddress: ${snapshot.child('address').value}\n\nClinical Pathology Tests: ${snapshot.child('clinicalpathologytests').value}\n\nProfile Tests: ${snapshot.child('profiletests').value}\n\nSerology Tests: ${snapshot.child('serologytests').value}\n\nBiochemistry Tests: ${snapshot.child('biochemistrytests').value}\n\nPayment Mode: ${snapshot.child('paymentMode').value}\n\nTotal Cost: ${snapshot.child('totalcost').value}",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF616161),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
    );
  }
}
