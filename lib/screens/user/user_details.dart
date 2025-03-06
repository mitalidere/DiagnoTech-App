import 'package:diagnotech/screens/user/navigator.dart';
import 'package:diagnotech/screens/user/select_tests.dart';
import 'package:diagnotech/screens/welcome_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../widgets/customized_button.dart';
import '../../widgets/customized_textfield.dart';
import '../global.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

final TextEditingController _fullnameController = TextEditingController();
final TextEditingController _phonenoController = TextEditingController();
final TextEditingController _ageController = TextEditingController();
final TextEditingController _genderController = TextEditingController();
final TextEditingController _bloodgroupController = TextEditingController();
final TextEditingController _heightController = TextEditingController();
final TextEditingController _weightController = TextEditingController();
final TextEditingController _addressController = TextEditingController();
final TextEditingController _dateInputController = TextEditingController();
String paymentMethod = 'Cash Payment';

class UserDetails extends StatefulWidget {
  List<String> selectedClinicalPathologyTests,
      selectedProfileTests,
      selectedSerologyTests,
      selectedBiochemistryTests;
  int clinicalPathologyTestCost,
      profileTestCost,
      serologyTestCost,
      bioChemistryTestCost,
      totalCost;

  UserDetails(
      {Key? key,
      required this.selectedClinicalPathologyTests,
      required this.selectedProfileTests,
      required this.selectedSerologyTests,
      required this.selectedBiochemistryTests,
      required this.clinicalPathologyTestCost,
      required this.profileTestCost,
      required this.serologyTestCost,
      required this.bioChemistryTestCost,
      required this.totalCost})
      : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  late DatabaseReference dbRef;
  late DatabaseReference dbRef2;
 dynamic data;
  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Appointments');
    dbRef2 = FirebaseDatabase.instance.ref('Razorpay');
    initializeDatabaseReferences();
  }

   Future<void> initializeDatabaseReferences() async {
    dbRef = FirebaseDatabase.instance.ref().child('Appointments');
    dbRef2 = FirebaseDatabase.instance.ref('Razorpay');

    DatabaseEvent event = await dbRef2.once();
    DataSnapshot snapshot = event.snapshot;
    setState(() {
      data = snapshot.value;
    });
    // print('Razorpay key:${data.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
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
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Row(
                      children: [
                        Container(
                          height: 45,
                          width: 45,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios_sharp,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "Fill Up all details",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                    // Padding(
                    //   padding: const EdgeInsets.all(10.0),
                    //   child: Container(
                    //     height: 45,
                    //     width: 45,
                    //     decoration: BoxDecoration(
                    //       border: Border.all(color: Colors.black, width: 1),
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     child: IconButton(
                    //         icon: const Icon(Icons.arrow_back_ios_sharp),
                    //         onPressed: () {
                    //           Navigator.pop(context);
                    //         }),
                    //   ),
                    // ),
                    // const Padding(
                    //   padding: EdgeInsets.all(20.0),
                    //   child: Text("Fill up all your details",
                    //       style: TextStyle(
                    //         color: Colors.black,
                    //         fontSize: 26,
                    //         fontWeight: FontWeight.bold,
                    //       )),
                    // ),
                          SizedBox(height: 20),

                    CustomizedTextfield(
                      myController: _fullnameController,
                      hintText: "Full Name",
                      isPassword: false,
                    ),
                    CustomizedTextfield(
                      myController: _phonenoController,
                      hintText: "Phone No.",
                      isPassword: false,
                    ),
                    CustomizedTextfield(
                      myController: _ageController,
                      hintText: "Age",
                      isPassword: false,
                    ),
                    CustomizedTextfield(
                      myController: _genderController,
                      hintText: "Gender",
                      isPassword: false,
                    ),
                    CustomizedTextfield(
                      myController: _bloodgroupController,
                      hintText: "Blood Group",
                      isPassword: false,
                    ),
                    CustomizedTextfield(
                      myController: _heightController,
                      hintText: "Height (in cm.)",
                      isPassword: false,
                    ),
                    CustomizedTextfield(
                      myController: _weightController,
                      hintText: "Weight (in kg.)",
                      isPassword: false,
                    ),
                    CustomizedTextfield(
                      myController: _addressController,
                      hintText: "Address",
                      isPassword: false,
                    ),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 20),
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
                            firstDate: DateTime.now()
                                .subtract(const Duration(days: 0)),
                            lastDate:
                                DateTime.now().add(const Duration(days: 6)),
                          );

                          if (pickedDate != null) {
                            _dateInputController.text =
                                DateFormat('dd MMMM yyyy').format(pickedDate);
                          }
                        },
                      ),
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(
                          value: 'Cash Payment',
                          groupValue: paymentMethod,
                          onChanged: (value) {
                            setState(() {
                              paymentMethod = value.toString();
                            });
                          },
                        ),
                        Text('Cash Payment'),
                        Radio(
                          value: 'Online Payment',
                          groupValue: paymentMethod,
                          onChanged: (value) {
                            setState(() {
                              paymentMethod = value.toString();
                            });
                          },
                        ),
                        Text('Online Payment'),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Align(
                        alignment: Alignment.center,
                        child: CustomizedButton(
                            buttonText: "Book",
                            buttonColor: Color(0xFF452c63),
                            textColor: Colors.white,
                            onPressed: () async {
                              if (_addressController.text != "" &&
                                  RegExp(r'^[0-9]+$')
                                      .hasMatch(_ageController.text) &&
                                  _bloodgroupController.text != "" &&
                                  RegExp('[a-zA-Z]')
                                      .hasMatch(_fullnameController.text) &&
                                  _genderController.text != "" &&
                                  RegExp(r'^[0-9]+$')
                                      .hasMatch(_heightController.text) &&
                                  RegExp(r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
                                      .hasMatch(_phonenoController.text) &&
                                  RegExp(r'^[0-9]+$')
                                      .hasMatch(_weightController.text) &&
                                  _dateInputController.text != "") {
                                if (paymentMethod == 'Online Payment') {
                                  Razorpay razorpay = Razorpay();
                                  var options = {
                                    'key': data.toString(),
                                    'amount': (totalCost + 50) * 100,
                                    'name': 'Diagnotech',
                                    'description': 'Diagnotech',
                                    'retry': {'enabled': true, 'max_count': 1},
                                    'send_sms_hash': true,
                                    'prefill': {
                                      'contact': '8888888888',
                                      'email': 'Diagnotech@razorpay.com'
                                    },
                                    'external': {
                                      'wallets': ['paytm']
                                    }
                                  };

                                  razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                                      (PaymentSuccessResponse response) {
                                    showSnackbar(
                                        "Payment failed. Your appointment is not book.");
                                  });
                                  razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                                      (PaymentSuccessResponse response) {
                                    showSnackbar(
                                        "Payment received. Your appointment is recorded.");
                                    Map<String, String> appointments = {
                                      'fullname': _fullnameController.text,
                                      'phoneno': _phonenoController.text,
                                      'age': _ageController.text,
                                      'gender': _genderController.text,
                                      'bloodgroup': _bloodgroupController.text,
                                      'height': _heightController.text,
                                      'weight': _weightController.text,
                                      'address': _addressController.text,
                                      'email': userEmail.toString(),
                                      'appointmentdate':
                                          _dateInputController.text,
                                      'clinicalpathologytests':
                                          selectedClinicalPathologyTests
                                              .toString(),
                                      'profiletests':
                                          selectedProfileTests.toString(),
                                      'serologytests':
                                          selectedSerologyTests.toString(),
                                      'biochemistrytests':
                                          selectedBiochemistryTests.toString(),
                                      'totalcost': (totalCost + 50).toString(),
                                      'reports': "",
                                      'paymentMode': "online"
                                    };

                                    dbRef.push().set(appointments);
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const NavigatorScreen(),
                                      ),
                                    );
                                    // Clear text values
                                    _fullnameController.clear();
                                    _phonenoController.clear();
                                    _ageController.clear();
                                    _genderController.clear();
                                    _bloodgroupController.clear();
                                    _heightController.clear();
                                    _weightController.clear();
                                    _addressController.clear();
                                    _dateInputController.clear();
                                  });
                                  razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                                      handleExternalWalletSelected);
                                  razorpay.open(options);
                                }

                                if (paymentMethod == 'Cash Payment') {
                                  Map<String, String> appointments = {
                                    'fullname': _fullnameController.text,
                                    'phoneno': _phonenoController.text,
                                    'age': _ageController.text,
                                    'gender': _genderController.text,
                                    'bloodgroup': _bloodgroupController.text,
                                    'height': _heightController.text,
                                    'weight': _weightController.text,
                                    'address': _addressController.text,
                                    'email': userEmail.toString(),
                                    'appointmentdate':
                                        _dateInputController.text,
                                    'clinicalpathologytests':
                                        selectedClinicalPathologyTests
                                            .toString(),
                                    'profiletests':
                                        selectedProfileTests.toString(),
                                    'serologytests':
                                        selectedSerologyTests.toString(),
                                    'biochemistrytests':
                                        selectedBiochemistryTests.toString(),
                                    'totalcost': (totalCost + 50).toString(),
                                    'reports': "",
                                    'paymentMode': "cash"
                                  };

                                  dbRef.push().set(appointments);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text(
                                        "Your appointment is recorded. You will shortly receive a email regarding the appointment details."),
                                  ));

                                  // Clear text values
                                  _fullnameController.clear();
                                  _phonenoController.clear();
                                  _ageController.clear();
                                  _genderController.clear();
                                  _bloodgroupController.clear();
                                  _heightController.clear();
                                  _weightController.clear();
                                  _addressController.clear();
                                  _dateInputController.clear();

                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const NavigatorScreen(),
                                    ),
                                  );
                                }
                              } else if (_addressController.text == "" ||
                                  _ageController.text == "" ||
                                  _bloodgroupController.text == "" ||
                                  _fullnameController.text == "" ||
                                  _genderController.text == "" ||
                                  _heightController.text == "" ||
                                  _phonenoController.text == "" ||
                                  _weightController.text == "" ||
                                  _dateInputController.text == "") {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Please fill all the details"),
                                ));
                              } else if (!RegExp(
                                      r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
                                  .hasMatch(_phonenoController.text)) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Enter valid phone number"),
                                ));
                              } else if (!RegExp('[a-zA-Z]')
                                  .hasMatch(_fullnameController.text)) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Enter valid name"),
                                ));
                              } else if (!RegExp(r'^[0-9]+$')
                                  .hasMatch(_heightController.text)) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Enter valid height"),
                                ));
                              } else if (!RegExp(r'^[0-9]+$')
                                  .hasMatch(_weightController.text)) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Enter valid weight"),
                                ));
                              } else if (!RegExp(r'^[0-9]+$')
                                  .hasMatch(_ageController.text)) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Enter valid age"),
                                ));
                              }
                            }),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    print('external wallet');
  }
}
