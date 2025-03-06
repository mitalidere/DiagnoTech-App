import 'package:diagnotech/screens/user/user_details.dart';
import 'package:flutter/material.dart';
import '../../widgets/customized_button.dart';

class Checkout extends StatelessWidget {
  List<String> selectedClinicalPathologyTests,
      selectedProfileTests,
      selectedSerologyTests,
      selectedBiochemistryTests;
  int clinicalPathologyTestCost,
      profileTestCost,
      serologyTestCost,
      bioChemistryTestCost,
      totalCost;

  Checkout(
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
  Widget build(BuildContext context) {
    int itemCount;
    return SafeArea(
      child: Scaffold(
          body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF452c63),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2.5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Row(
                          children: [
                            SizedBox(
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
                            const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                "Cart Billing",
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
                    //       // border: Border.all(color: Colors.black, width: 1),
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     child: IconButton(
                    //         icon: Icon(Icons.arrow_back_ios_sharp),
                    //         onPressed: () {
                    //           Navigator.pop(context);
                    //         }),
                    //   ),
                    // ),
                    if (selectedClinicalPathologyTests.isNotEmpty)
                      const Padding(
                        padding: EdgeInsets.only(top: 40, left: 20),
                        child: Text(
                          "Clinical Pathology Tests",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    if (selectedClinicalPathologyTests.isNotEmpty)
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 15, bottom: 5),
                        child: SizedBox(
                          height: 1,
                          width: 315,
                          child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.grey)),
                        ),
                      ),
                    if (selectedClinicalPathologyTests.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 35),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      for (int index = 0;
                                          index <
                                              selectedClinicalPathologyTests
                                                  .length;
                                          index++)
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Text(
                                              selectedClinicalPathologyTests[
                                                  index],
                                              style: const TextStyle(
                                                color: Color(0xFF616161),
                                                fontSize: 14,
                                              )),
                                        ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    if (selectedProfileTests.isNotEmpty)
                      const Padding(
                        padding: EdgeInsets.only(top: 30, left: 20),
                        child: Text(
                          "Profile Tests",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    if (selectedProfileTests.isNotEmpty)
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 15, bottom: 5),
                        child: SizedBox(
                          height: 1,
                          width: 315,
                          child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.grey)),
                        ),
                      ),
                    if (selectedProfileTests.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 35),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      if (selectedProfileTests.isEmpty)
                                        const Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Text(
                                            "*No tests selected*",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xFF616161),
                                            ),
                                          ),
                                        )
                                      else
                                        for (int index = 0;
                                            index < selectedProfileTests.length;
                                            index++)
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Text(
                                                selectedProfileTests[index],
                                                style: const TextStyle(
                                                  color: Color(0xFF616161),
                                                  fontSize: 14,
                                                )),
                                          ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    if (selectedSerologyTests.isNotEmpty)
                      const Padding(
                        padding: EdgeInsets.only(top: 30, left: 20),
                        child: Text(
                          "Serology Tests",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    if (selectedSerologyTests.isNotEmpty)
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 15, bottom: 5),
                        child: SizedBox(
                          height: 1,
                          width: 315,
                          child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.grey)),
                        ),
                      ),
                    if (selectedSerologyTests.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 35),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      if (selectedSerologyTests.isEmpty)
                                        const Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Text(
                                            "*No tests selected*",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xFF616161),
                                            ),
                                          ),
                                        )
                                      else
                                        for (int index = 0;
                                            index <
                                                selectedSerologyTests.length;
                                            index++)
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Text(
                                                selectedSerologyTests[index],
                                                style: const TextStyle(
                                                  color: Color(0xFF616161),
                                                  fontSize: 14,
                                                )),
                                          ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    if (selectedBiochemistryTests.isNotEmpty)
                      const Padding(
                        padding: EdgeInsets.only(top: 30, left: 20),
                        child: Text(
                          "BioChemistry Tests",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    if (selectedBiochemistryTests.isNotEmpty)
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 15, bottom: 5),
                        child: SizedBox(
                          height: 1,
                          width: 315,
                          child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.grey)),
                        ),
                      ),
                    if (selectedBiochemistryTests.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 35),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      if (selectedBiochemistryTests.isEmpty)
                                        const Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Text(
                                            "*No tests selected*",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xFF616161),
                                            ),
                                          ),
                                        )
                                      else
                                        for (int index = 0;
                                            index <
                                                selectedBiochemistryTests
                                                    .length;
                                            index++)
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Text(
                                                selectedBiochemistryTests[
                                                    index],
                                                style: const TextStyle(
                                                  color: Color(0xFF616161),
                                                  fontSize: 14,
                                                )),
                                          ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    const Padding(
                      padding: EdgeInsets.only(top: 80, left: 20),
                      child: Text(
                        "Amount Details",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 10),
                      child: SizedBox(
                        height: 1,
                        width: 315,
                        child: DecoratedBox(
                            decoration: BoxDecoration(color: Colors.grey)),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 240,
                            child: Text(
                              "Clinical Pathology Tests\n\nProfile Tests\n\nSerology Tests\n\nBiochemistry Tests\n\nConvenience fee",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF616161)),
                            ),
                          ),
                          SizedBox(
                            child: Text(
                              "Rs.${clinicalPathologyTestCost}.00\n\nRs.${profileTestCost}.00\n\nRs.${serologyTestCost}.00\n\nRs.${bioChemistryTestCost}.00\n\nRs.50.00",
                              style: const TextStyle(
                                  fontSize: 14, color: Color(0xFF616161)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 10),
                      child: SizedBox(
                        height: 1,
                        width: 315,
                        child: DecoratedBox(
                            decoration: BoxDecoration(color: Colors.grey)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 20),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 235,
                            child: Text(
                              "Total Amount",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            child: Text(
                              "Rs.${totalCost + 50}.00",
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: CustomizedButton(
                        buttonText: "Proceed",
                        buttonColor: const Color(0xFF452c63),
                        textColor: Colors.white,
                        onPressed: () {
                          if (totalCost != 0) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => UserDetails(
                                          selectedClinicalPathologyTests:
                                              selectedClinicalPathologyTests,
                                          selectedProfileTests:
                                              selectedProfileTests,
                                          selectedSerologyTests:
                                              selectedSerologyTests,
                                          selectedBiochemistryTests:
                                              selectedBiochemistryTests,
                                          clinicalPathologyTestCost:
                                              clinicalPathologyTestCost,
                                          profileTestCost: profileTestCost,
                                          serologyTestCost: serologyTestCost,
                                          bioChemistryTestCost:
                                              bioChemistryTestCost,
                                          totalCost: totalCost,
                                        )));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Please select atleast 1 test"),
                            ));
                          }
                        },
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}
