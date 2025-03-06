import 'package:diagnotech/screens/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';
import '../../widgets/customized_button.dart';
import 'checkout.dart';

int clinicalPathologyTestCost = 0;
int profileTestCost = 0;
int serologyTestCost = 0;
int bioChemistryTestCost = 0;
int totalCost = 0;

List<String> ClinicalPathologyTests = [
  'Urine Routine - Rs.165/-',
  'BS BP - Rs.50/-',
  'Sugar - Rs.80/-',
  'Ketones - Rs.500/-',
  'Microalbumin - Rs.340/-',
  '24hrs. Proteins - Rs.200/-',
  'Electrolytes - Rs.2000/-',
  'Pregnancy test - Rs.70/-'
];
List<int> ClinicalPathologyTestsCost = [165, 50, 80, 500, 340, 200, 2000, 70];
List<String> selectedClinicalPathologyTests = [];

List<String> ProfileTests = [
  'LFT (Liver function test) - Rs.400/-',
  'KFT (Kidney function test) - Rs.1100/-',
  'Lipid Profile - Rs.500/-',
  'ANC Profile - Rs.1200/-',
  'Coagulation Profile - Rs.300/-',
  'Physician Profile - Rs.800/-',
  'Cardiac Profile - Rs.2500/-'
];

List<int> ProfileTestCost = [400, 1100, 500, 1200, 300, 800, 2500];
List<String> selectedProfileTests = [];

List<String> SerologyTests = [
  'Mantoux Test - Rs.90/-',
  'HIV(Screening) Test - Rs.700/-',
  'HIV(Western blot) Test - Rs.2000/-',
  'HBsAg(Screening) Test - Rs.1300/-',
  'HBsAg(ELISA) Test - Rs.1150/-',
  'Maleria Antigen - Rs.600/-',
  'Anti HCV Antibodies - Rs.1350/-',
  'VDRL - Rs.290/-',
  'Widal(Slide) Test - Rs.300/-',
  'Widal(Tube) Test - Rs.260/-',
  'RA Factor(Qualitative) - Rs.650/-',
  'RA Factor(Quantitative) - Rs.680/-',
  'ASO(Latex) - Rs.690/-',
  'CRP(Quantitative) - Rs.650/-',
  'ANA - Rs.620/-',
  'TORCH Profile - Rs.2700/-',
  'Toxoplasma IgG/IgM - Rs.580/-',
  'Dengu IgG/IgM - Rs.600/-',
  'IgE - Rs.1150/-'
];
List<int> SerologyTestsCost = [
  90,
  700,
  2000,
  1300,
  1150,
  600,
  1350,
  290,
  300,
  260,
  650,
  680,
  690,
  650,
  620,
  2700,
  580,
  600,
  1150
];
List<String> selectedSerologyTests = [];

List<String> BiochemistryTests = [
  'Blood Sugar(BSL)-(F/R/PP) - Rs.100/-',
  'Glucose Tolerance Test - Rs.250/-',
  'HbA1C - Rs.400/-',
  'S.Urea - Rs.80/-',
  'S.Creat - Rs.150/-',
  'Uric Acid - Rs.130/-',
  'S.Cholestrol - Rs.300/-',
  'HDL Cholestrol - Rs.290/-',
  'S.Triglycerides - Rs.120/-',
  'S.Bilirubin - Rs.280/-',
  'SGOT - Rs.90/-',
  'SGPT - Rs.85/-',
  'GGT - Rs.120/-',
  'Total Proteins - Rs.145/-',
  'S.Albumin - Rs.200/-',
  'S.Amylase - Rs.400/-',
  'S.Lipase - Rs.590',
  'S.Electrolytes(ISE) - Rs.525/-',
  'S.Calcium - Rs.240/-',
  'S.Sodium(ISE) - Rs.120/-',
  'S.Potassium - Rs.250/-',
  'S.Magnesium - Rs.250/-',
  'S.Phosphates - Rs.200/-',
  'CPK-NAC - Rs.225/-',
  'CPK-MB - Rs.225/-',
  'Troponin T(Qualitative) - Rs.995/-',
  'Troponin I(Qualitative) - Rs.1850/-',
  'ADA Test - Rs.450',
  'Creatinine Clearance Test - Rs.150/-'
];
List<int> BiochemistryTestsCost = [
  100,
  250,
  400,
  80,
  150,
  130,
  300,
  290,
  120,
  280,
  90,
  85,
  120,
  145,
  200,
  400,
  590,
  525,
  240,
  120,
  250,
  250,
  200,
  225,
  225,
  995,
  1850,
  450,
  150
];
List<String> selectedBiochemistryTests = [];

class SelectTests extends StatefulWidget {
  const SelectTests({Key? key}) : super(key: key);

  @override
  State<SelectTests> createState() => _SelectTestsState();
}

class _SelectTestsState extends State<SelectTests> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              CustomAppBar(title: 'Test Selection', context: context),
              const Padding(
                padding:
                    EdgeInsets.only(left: 20, top: 40, bottom: 30, right: 20),
                child: Text("Select the Tests you want to be done",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: DropDownMultiSelect(
                  options: ClinicalPathologyTests,
                  selectedValues: selectedClinicalPathologyTests,
                  onChanged: (value) {
                    print('selected tests $value');
                    setState(() {
                      selectedClinicalPathologyTests = value as List<String>;
                    });
                  },
                  whenEmpty: 'Clinical Pathology Tests',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: DropDownMultiSelect(
                  options: ProfileTests,
                  selectedValues: selectedProfileTests,
                  onChanged: (value) {
                    print('selected tests $value');
                    setState(() {
                      selectedProfileTests = value as List<String>;
                    });
                  },
                  whenEmpty: 'Profile Tests',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: DropDownMultiSelect(
                  options: SerologyTests,
                  selectedValues: selectedSerologyTests,
                  onChanged: (value) {
                    print('selected tests $value');
                    setState(() {
                      selectedSerologyTests = value as List<String>;
                    });
                  },
                  whenEmpty: 'Serology Tests',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: DropDownMultiSelect(
                  options: BiochemistryTests,
                  selectedValues: selectedBiochemistryTests,
                  onChanged: (value) {
                    print('selected tests $value');
                    setState(() {
                      selectedBiochemistryTests = value as List<String>;
                    });
                  },
                  whenEmpty: 'Biochemistry Tests',
                ),
              ),
              CustomizedButton(
                buttonText: "Proceed",
                buttonColor: Color(0xFF452c63),
                textColor: Colors.white,
                onPressed: () {
                  totalCost = 0;
                  clinicalPathologyTestCost = 0;
                  profileTestCost = 0;
                  serologyTestCost = 0;
                  bioChemistryTestCost = 0;
                  for (int i = 0;
                      i < selectedClinicalPathologyTests.length;
                      i++) {
                    int index = ClinicalPathologyTests.indexOf(
                        selectedClinicalPathologyTests[i]);
                    clinicalPathologyTestCost +=
                        ClinicalPathologyTestsCost[index];
                    totalCost += ClinicalPathologyTestsCost[index];
                  }
                  for (int i = 0; i < selectedProfileTests.length; i++) {
                    int index = ProfileTests.indexOf(selectedProfileTests[i]);
                    profileTestCost += ProfileTestCost[index];
                    totalCost += ProfileTestCost[index];
                  }
                  for (int i = 0; i < selectedSerologyTests.length; i++) {
                    int index = SerologyTests.indexOf(selectedSerologyTests[i]);
                    serologyTestCost += SerologyTestsCost[index];
                    totalCost += SerologyTestsCost[index];
                  }
                  for (int i = 0; i < selectedBiochemistryTests.length; i++) {
                    int index =
                        BiochemistryTests.indexOf(selectedBiochemistryTests[i]);
                    bioChemistryTestCost += BiochemistryTestsCost[index];
                    totalCost += BiochemistryTestsCost[index];
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => Checkout(
                                selectedClinicalPathologyTests:
                                    selectedClinicalPathologyTests,
                                selectedBiochemistryTests:
                                    selectedBiochemistryTests,
                                selectedProfileTests: selectedProfileTests,
                                selectedSerologyTests: selectedSerologyTests,
                                clinicalPathologyTestCost:
                                    clinicalPathologyTestCost,
                                profileTestCost: profileTestCost,
                                serologyTestCost: serologyTestCost,
                                bioChemistryTestCost: bioChemistryTestCost,
                                totalCost: totalCost,
                              )));
                },
              )
            ],
          ),
        ),
      ),
    ));
  }
}
