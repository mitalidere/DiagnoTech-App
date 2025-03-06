import 'package:firebase_auth/firebase_auth.dart';
import 'package:diagnotech/screens/user/test_details.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../global.dart';

class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  TextEditingController _emailController = TextEditingController();
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
                    // height: 95,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 15, right: 15),
                      child: SingleChildScrollView(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            // border:Border.all(width: 0.5, color: Colors.grey),

                            borderRadius: BorderRadius.circular(10),
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
    padding: const EdgeInsets.only(top: 10, bottom: 10),
    child: ListTile(
      title: Text("Id: ${snapshot.key}"),
      subtitle: Text(
        snapshot.child('reports').value != ''
            ? "\nReport is generated and sent to ${snapshot.child('email').value}. Check your inbox."
            : "\nReport is pending.",
      ),
    ),
  ),
  if (snapshot.child('reports').value != '')
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
       onPressed: () {
  Object? reportUrl = snapshot.child('reports').value;
  if (reportUrl != null && reportUrl is String && reportUrl.isNotEmpty) {
    print('Launching URL: $reportUrl');
     final String chromeUrl = 'googlechrome://navigate?url=$reportUrl';
    launch(chromeUrl);
  } else {
    // Handle the case where report URL is not available
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Report URL is not available.'),
      ),
    );
  }
},
        child: Text('Download Report'),
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
              }),
        ),
      ),
    );
  }
}
