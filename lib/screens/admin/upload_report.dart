import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/customized_button.dart';

class UploadReport extends StatefulWidget {
  var id;
  UploadReport({Key? key, required this.id}) : super(key: key);

  @override
  State<UploadReport> createState() => _UploadReportState();
}

class _UploadReportState extends State<UploadReport> {
  final _key = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  final dbRef = FirebaseDatabase.instance.ref('Appointments');
  final TextEditingController reportpdf = TextEditingController();
  List<String> temp = [];
  FilePickerResult? result;

  sendEmail(String subject, String body, String recipientemail,
      List<String> attachments) async {
    final Email email = Email(
        body: body,
        subject: subject,
        recipients: [recipientemail],
        attachmentPaths: attachments,
        isHTML: false);
    await FlutterEmailSender.send(email);
  }

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<String?> uploadFileToStorage(String filePath) async {
    try {
      firebase_storage.Reference ref = storage
          .ref()
          .child('reports/${DateTime.now().millisecondsSinceEpoch}');
      await ref.putFile(File(filePath));
      String downloadURL = await ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print('Error uploading file: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: FirebaseAnimatedList(
                query: dbRef,
                itemBuilder: (context, snapshot, animation, index) {
                  if (snapshot.key.toString() == widget.id) {
                    DatabaseReference db = FirebaseDatabase.instance
                        .ref('Appointments/${snapshot.key}');
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
                                    // border:
                                    //     Border.all(color: Colors.black, width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: IconButton(
                                      icon: const Icon(
                                          Icons.arrow_back_ios_sharp),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      }),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 20),
                              child: Column(children: [
                                Text(
                                  "\Appointment Date: ${snapshot.child('appointmentdate').value}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 0, bottom: 10, right: 10, left: 20),
                                  child: SizedBox(
                                    height: 1,
                                    width: 300,
                                    child: DecoratedBox(
                                        decoration:
                                            BoxDecoration(color: Colors.grey)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Text(
                                    "\nId: ${snapshot.key}\n\nEmail Id: ${snapshot.child('email').value}\n\nName: ${snapshot.child('fullname').value}\n\nAge: ${snapshot.child('age').value}\n\nGender: ${snapshot.child('appointmentdate').value}\n\nBlood Group: ${snapshot.child('bloodgroup').value}\n\nHeight: ${snapshot.child('height').value}\n\nWeight: ${snapshot.child('weight').value}\n\nPhone No.: ${snapshot.child('phoneno').value}\n\nAddress: ${snapshot.child('address').value}\n\nClinical Pathology Tests: ${snapshot.child('clinicalpathologytests').value}\n\nProfile Tests: ${snapshot.child('profiletests').value}\n\nSerology Tests: ${snapshot.child('serologytests').value}\n\nBiochemistry Tests: ${snapshot.child('biochemistrytests').value}\n\nPayment Mode: ${snapshot.child('paymentMode').value}\n\nTotal: ${snapshot.child('totalcost').value}",
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
                                          hintText: 'Upload Report',
                                        ),
                                        controller: reportpdf,
                                        readOnly: true,
                                        onTap: () async {
                                          result = await FilePicker.platform
                                              .pickFiles(allowMultiple: false);
                                          if (result == null) {
                                            print("No file selected");
                                          } else {
                                            setState(() {});
                                            result?.files.forEach((element) {
                                              print(element.name);
                                            });
                                          }
                                          if (result != null) {
                                            reportpdf.text =
                                                result?.files[0].name ?? '';
                                            temp.add(
                                                result?.files[0].path ?? '');
                                          }
                                        },
                                      ),
                                      const SizedBox(height: 10),
                                      if (snapshot.child('reports').value != '')
                                        CustomizedButton(
                                          buttonText: "Download Report",
                                          buttonColor: const Color(0xFF452c63),
                                          textColor: Colors.white,
                                          onPressed: () async {
                                            Object? reportUrl =
                                                snapshot.child('reports').value;
                                            if (reportUrl != null &&
                                                reportUrl is String &&
                                                reportUrl.isNotEmpty) {
                                              print(
                                                  'Launching URL: $reportUrl');
                                              final String chromeUrl =
                                                  'googlechrome://navigate?url=$reportUrl';
                                              launch(chromeUrl);
                                            } else {
                                              // Handle the case where report URL is not available
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                      'Report URL is not available.'),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      CustomizedButton(
                                        buttonText: "Upload PDF",
                                        buttonColor: const Color(0xFF452c63),
                                        textColor: Colors.white,
                                        onPressed: () async {
                                          if (reportpdf.text != "") {
                                            String? downloadURL =
                                                await uploadFileToStorage(
                                                    temp[0]);
                                            if (downloadURL != null) {
                                              await db.update(
                                                  {"reports": downloadURL});
                                              _key.currentState!.save();
                                              sendEmail(
                                                  'Message from E-Lab',
                                                  'Your reports are ready.\nYou can also check it on your e-lab account',
                                                  '${snapshot.child('email').value}',
                                                  temp);
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                content: Text(
                                                    "Failed to upload file"),
                                              ));
                                            }
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
      ),
    );
  }
}
