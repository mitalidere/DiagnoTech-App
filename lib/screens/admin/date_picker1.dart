import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../../widgets/customized_button.dart';
import 'appointments1.dart';
import 'package:intl/intl.dart';

final TextEditingController _dateInputController = TextEditingController();

class DatePicker1 extends StatefulWidget {
  const DatePicker1({Key? key}) : super(key: key);

  @override
  State<DatePicker1> createState() => _DatePicker1State();
}

class _DatePicker1State extends State<DatePicker1> {
  final TextEditingController _emailController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final dbRef = FirebaseDatabase.instance.ref('Appointments');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        // const Padding(
        //   padding: EdgeInsets.only(left: 20, top: 70, right: 20),
        //   child: Text("Email Appointments",
        //       style: TextStyle(
        //         color: Colors.black,
        //         fontSize: 26,
        //         fontWeight: FontWeight.bold,
        //       )),
        // ),
        Padding(
          padding: EdgeInsets.only(
            top: 0,
          ),
          child: Container(
            // Set background color to black
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
              padding:
                  EdgeInsets.only(left: 20, top: 30, right: 10, bottom: 30),
              child: Center(
                // Center the text horizontally
                child: Text(
                  "Email Appointments",
                  style: TextStyle(
                    color: Colors.white, // Set text color to white for contrast
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 25, right: 20, bottom: 20, top: 15),
          child: Text("Enter the date to get the respective appointments",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              )),
        ),
        Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: 'Appointment Date',
            ),
            controller: _dateInputController,
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now().subtract(const Duration(days: 365)),
                lastDate: DateTime.now().add(const Duration(days: 365)),
              );

              if (pickedDate != null) {
                _dateInputController.text =
                    DateFormat('dd MMMM yyyy').format(pickedDate);
              }
            },
          ),
        )),

        CustomizedButton(
          buttonText: "Proceed",
          buttonColor: Color(0xFF452c63),
          textColor: Colors.white,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => Appointments1(
                          dateController: _dateInputController,
                        )));
          },
        ),
      ],
    ));
  }
}
