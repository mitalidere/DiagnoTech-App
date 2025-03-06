import 'package:flutter/material.dart';

class HighBloodPressure extends StatefulWidget {
  const HighBloodPressure({Key? key}) : super(key: key);

  @override
  _HighBloodPressureState createState() => _HighBloodPressureState();
}

class _HighBloodPressureState extends State<HighBloodPressure> {
  bool showSymptoms = true;
  bool showYoga = false;
  bool showDiet = false;
  bool showTypes = false;

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
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
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
                            onPressed: () {Navigator.pop(context);},
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                        "High Blood Pressure (HBP, Hypertension)",


                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 320,
                        child: Text(
                              "A condition in which the force of the blood against the artery walls is too high.\n",


                          style:
                              TextStyle(fontSize: 16, color: Color(0xFF616161)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  showSymptoms = true;
                                  showYoga = false;
                                  showDiet = false;
                                  showTypes = false;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(150, 150),
                                backgroundColor: const Color(0xFF6638A6),
                                foregroundColor: const Color(0xFFD8BFD8),
                                shadowColor: Colors.grey,
                                elevation: 15,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/td3.png',
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Symptoms',
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  showSymptoms = false;
                                  showYoga = true;
                                  showDiet = false;
                                  showTypes = false;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(150, 150),
                                backgroundColor: const Color(0xFFCBC3E3),
                                foregroundColor: const Color(0xFF452c63),
                                shadowColor: Colors.grey,
                                elevation: 15,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/s6.png',
                                    height: 100,
                                    width: 300,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Yoga',
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  showSymptoms = false;
                                  showYoga = false;
                                  showDiet = true;
                                  showTypes = false;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(150, 150),
                                backgroundColor: const Color(0xFFCBC3E3),
                                foregroundColor: const Color(0xFF452c63),
                                shadowColor: Colors.grey,
                                elevation: 15,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/s7.png',
                                    height: 100,
                                    width: 300,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Diet',
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  showSymptoms = false;
                                  showYoga = false;
                                  showDiet = false;
                                  showTypes = true;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(150, 150),
                                backgroundColor: const Color(0xFF6638A6),
                                foregroundColor: const Color(0xFFD8BFD8),
                                shadowColor: Colors.grey, // Set shadow color
                                elevation: 15, // Set elevation
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10), // Set border radius
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/td1.png', // Replace with your image asset path
                                    height: 100, // Adjust height as needed
                                    width: 300, // Adjust width as needed
                                    fit: BoxFit
                                        .contain, // Adjust image fit as needed
                                  ),
                                  const SizedBox(
                                      height:
                                          8), // Add some space between the image and text
                                  const Text(
                                    'Categories of Blood Pressure',
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (showSymptoms) ...[
                const Padding(
                      padding: EdgeInsets.only(top: 30, left: 20),
                      child: Text(
                        "Symptoms",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                        children: const [
                          SizedBox(
                            width: 320,
                            child: Text(
                              "Most people with hypertension don’t feel any symptoms. People with very high blood pressure (usually 180/120 or higher) can experience symptoms including:\n\n1. Severe headaches\n\n2. Chest pain\n\n3. Dizziness\n\n4. Difficulty breathing\n\n5. Nausea\n\n6. Vomiting\n\n7. Blurred vision or other vision changes\n\n8. Anxiety\n\n9. Confusion\n\n10. Buzzing in the ears\n\n11. Nosebleeds\n\n12. Abnormal heart rhythm",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF616161)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                    ),
                ],
                if (showYoga) ...[
                   const Padding(
                      padding: EdgeInsets.only(top: 30, left: 20),
                      child: Text(
                        "Yogas",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                      child: Column(
                        children:  [
                          SizedBox(
                            width: 320,
                            child: Text(
                              "A. Child’s pose\n",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 6, 116, 171)),
                            ),
                          ),
                             Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/hbp1.png', // Replace 'your_image.png' with your image asset path
                            height: 180, // Adjust height as needed
                            width: 200,// Adjust width as needed
                            fit: BoxFit.cover, // Adjust image fit as needed
                          ),
                        ),
                          SizedBox(
                            width: 320,
                            child: Text(
                              "The child’s pose can calm the nervous system and reduce pain.\n\nTo do this:\n1. Kneel on the floor. You should keep your toes together and spread your knees as wide as you can.\n2. Lower your buttocks onto your heels.\n3. Sit up straight and allow your body to adjust to this position.\n4. After you exhale, lean forward so that your head and chest rests between or on top of your thighs. Allow your forehead to rest on the floor.\n5. Your arms should remain extended, palms facing down.\n6. Hold for one minute or more, allowing your neck and shoulders to release any tension.\n\nTo come out of this pose, use your hands to push yourself upward and sit back on your heels.",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF616161)),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: 320,
                            child: Text(
                              "B. Seated forward bend\n",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 6, 116, 171)),
                            ),
                          ),
                             Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/hbp2.png', // Replace 'your_image.png' with your image asset path
                            height: 180, // Adjust height as needed
                            width: 200,// Adjust width as needed
                            fit: BoxFit.cover, // Adjust image fit as needed
                          ),
                        ),
                          SizedBox(
                            width: 320,
                            child: Text(
                              "This pose is a therapeutic forward bend. In addition to lowering blood pressure and promoting weight loss, this pose may help relieve anxiety, headache, and fatigue.\n\n1. Sit on the edge of a folded blanket and extend your legs long.\n2. You may place a prop under your knees for support.\n3. Imagine that you’re pressing the soles of your feet against a wall so that your toes are drawing back toward your shins.\n4. Root into your sit bones, lengthen your spine, and open your heart center.\n5. Hinge at your hips as you bend forward.\n6. Walk your hands down to your feet, stopping when you reach a comfortable position. Your torso should fold into your legs.\n7. Tuck your chin into your chest.\n8. Remain in the pose for up to 3 minutes.",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF616161)),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: 320,
                            child: Text(
                              "C. Corpse pose\n",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 6, 116, 171)),
                            ),
                          ),
                             Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/hbp3.png', // Replace 'your_image.png' with your image asset path
                            height: 180, // Adjust height as needed
                            width: 200,// Adjust width as needed
                            fit: BoxFit.cover, // Adjust image fit as needed
                          ),
                        ),
                          SizedBox(
                            width: 320,
                            child: Text(
                              "This pose can restore your body to a deep state of rest.\n\nTo do this:\n1. Lie on the floor with your back to the ground.\n2. Let your legs spread slightly apart, and move your arms to your side. Your palms should face up to the ceiling\n3. Hold this position for between 5 and 30 minutes.\n\nSome find it helpful to listen to relaxing music during this pose. During a migraine you may be sensitive to noise, so you will need to decide if the music helps you relax.\nTo exit this pose, you should slowly introduce awareness back into your body. Wiggle your fingers and toes. Roll to one side and allow yourself to rest there for a moment. Slowly move yourself into an upright position.",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF616161)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                    ),
                ],
                if (showDiet) ...[
                  const Padding(
                      padding: EdgeInsets.only(top: 30, left: 20),
                      child: Text(
                        "Diet",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                      child: Column(
                        children: const [
                          SizedBox(
                            width: 320,
                            child: Text(
                              "A. Breakfast\n",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 6, 116, 171)),
                            ),
                          ),
                          SizedBox(
                            width: 320,
                            child: Text(
                              "1. Oats Upma:\n- Cook oats with vegetables like carrots, peas, and beans.\n- Season with mustard seeds, cumin, and curry leaves.\n- Top with a sprinkle of flaxseeds for added omega-3 fatty acids.\n\n2. Idli with Sambhar:\n- Include whole grain idlis with a side of vegetable sambhar.\n- Use less salt and incorporate spices like coriander and cumin for flavor.",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF616161)),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: 320,
                            child: Text(
                              "B. Mid-Morning Snack\n",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 6, 116, 171)),
                            ),
                          ),
                          SizedBox(
                            width: 320,
                            child: Text(
                              "1. Fruit Salad:\n- Mix fresh fruits like watermelon, papaya, and oranges.\n- Add a pinch of chaat masala for taste.",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF616161)),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: 320,
                            child: Text(
                              "C. Lunch\n",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 6, 116, 171)),
                            ),
                          ),
                          SizedBox(
                            width: 320,
                            child: Text(
                              "1. Brown Rice with Dal and Vegetable Curry:\n- Opt for brown rice over white rice.\n- Pair with dal (lentils) and a side of mixed vegetable curry.\n- Include a cucumber and tomato salad with a dash of lemon.\n\n2. Methi (Fenugreek) Roti with Raita:\n- Make rotis with a mix of whole wheat flour and methi leaves.\n- Serve with cucumber and mint raita.",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF616161)),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: 320,
                            child: Text(
                              "D. Afternoon Snack\n",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 6, 116, 171)),
                            ),
                          ),
                          SizedBox(
                            width: 320,
                            child: Text(
                              "1. Yogurt with Walnuts:\n- Choose low-fat yogurt.\n- Add a handful of walnuts for a source of healthy fats.",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF616161)),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: 320,
                            child: Text(
                              "E. Dinner\n",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 6, 116, 171)),
                            ),
                          ),
                          SizedBox(
                            width: 320,
                            child: Text(
                              "1. Grilled Fish or Tofu with Quinoa:\n- Season with herbs like basil and thyme.\n- Serve with quinoa and steamed broccoli.\n\n2. Palak (Spinach) and Tomato Dal:\n- Prepare dal with spinach and tomatoes.\n- Use minimal salt and enhance flavor with garlic and ginger.",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF616161)),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: 320,
                            child: Text(
                              "F. Evening Snack (if needed)\n",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 6, 116, 171)),
                            ),
                          ),
                          SizedBox(
                            width: 320,
                            child: Text(
                              "1. Vegetable Sticks with Hummus:\n- Enjoy cucumber, carrot, and bell pepper sticks with a small portion of hummus.",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF616161)),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                ],

                   if (showTypes) ...[
                  Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, top: 40),
                  child:
                  SizedBox(
                    width: 320,
                    child: Text(
                      "Categories of Blood Pressure\n",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 6, 116, 171)),
                    ),
                  ),
                  ),
               Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Table(
                          border: TableBorder.all(
                              width: 1,
                              color: Colors.grey,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                          children: const [
                            TableRow(children: [
                              TableCell(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text("Blood Pressure Category")),
                                ),
                              )),
                              TableCell(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                          "Systolic mm Hg (upper number)")),
                                ),
                              )),
                              TableCell(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(child: Text("and/or")),
                                ),
                              )),
                              TableCell(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                          "Diastolic mm Hg (lpper number)")),
                                ),
                              )),
                            ]),
                            TableRow(children: [
                              TableCell(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(child: Text("Normal")),
                              )),
                              TableCell(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(child: Text("Less than 120")),
                              )),
                              TableCell(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(child: Text("and")),
                              )),
                              TableCell(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(child: Text("Less than 80")),
                              )),
                            ]),
                            TableRow(children: [
                              TableCell(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(child: Text("Elevated")),
                              )),
                              TableCell(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(child: Text("120-129")),
                              )),
                              TableCell(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(child: Text("and")),
                              )),
                              TableCell(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(child: Text("Less than 80")),
                              )),
                            ]),
                            TableRow(children: [
                              TableCell(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text(
                                        "High blood pressure (Hypertension), Stage 1")),
                              )),
                              TableCell(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(child: Text("130-139")),
                              )),
                              TableCell(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(child: Text("or")),
                              )),
                              TableCell(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(child: Text("80-89")),
                              )),
                            ]),
                            TableRow(children: [
                              TableCell(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text(
                                        "High blood pressure (Hypertension), Stage 2")),
                              )),
                              TableCell(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(child: Text("140 or higher")),
                              )),
                              TableCell(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(child: Text("or")),
                              )),
                              TableCell(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(child: Text("90 or higher")),
                              )),
                            ]),
                            TableRow(children: [
                              TableCell(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text(
                                        "Hypertensive crisis (Consult your doctor immediately)")),
                              )),
                              TableCell(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(child: Text("Higher than 180")),
                              )),
                              TableCell(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(child: Text("and/or")),
                              )),
                              TableCell(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(child: Text("Higher than 120")),
                              )),
                            ]),
                          ]),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                    ),
                    
                ],
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
