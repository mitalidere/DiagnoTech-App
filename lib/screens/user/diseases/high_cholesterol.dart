
import 'package:flutter/material.dart';

class HighCholesterol extends StatefulWidget {
  const HighCholesterol({Key? key}) : super(key: key);

  @override
  _HighCholesterolState createState() => _HighCholesterolState();
}

class _HighCholesterolState extends State<HighCholesterol> {
  bool showSymptoms = true;
  bool showYoga = false;
  bool showDiet = false;

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
                        "High Cholesterol (Hypercholesterolemia)",


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
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 320,
                        child: Text(
                              "High amounts of cholesterol in the blood. High cholesterol can limit blood flow, increasing the risk of a heart attack or stroke.",

                          style: TextStyle(
                              fontSize: 16, color: Color(0xFF616161)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, top: 20),
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
                              "1. Oatmeal with Nuts and Seeds:\n- Cook oats with low-fat milk or water.\n- Add a handful of almonds or walnuts and sprinkle with chia seeds or flaxseeds.\n\n2. Dalia (Broken Wheat) Porridge:\n- Prepare dalia with vegetables like carrots and peas.\n- Season with cumin seeds, coriander, and a pinch of turmeric.",
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
                              "1. Apple or Orange:\n- These fruits are rich in soluble fiber, which can help lower cholesterol levels.",
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
                              "1. Brown Rice with Lentils and Mixed Vegetables:\n- Opt for brown rice over white rice.\n- Pair with lentils and a side of mixed vegetable curry.\n- Include a cucumber and tomato salad with lemon dressing.\n\n2. Methi (Fenugreek) Roti with Palak (Spinach) Dal:\n- Make rotis with a mix of whole wheat flour and methi leaves.\n- Prepare dal with spinach and minimal oil.",
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
                              "1. Greek Yogurt with Berries:\n- Choose low-fat Greek yogurt and top it with fresh berries.",
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
                              "1. Grilled Fish or Tofu with Quinoa:\n- Season with herbs like rosemary and thyme.\n- Serve with quinoa and sautéed broccoli or asparagus.\n\n2. Chickpea Salad:\n- Combine chickpeas with cucumber, cherry tomatoes, and bell peppers.\n- Dress with olive oil, lemon juice, and a sprinkle of cumin.",
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
                              "1. Mixed Nuts:\n- A small handful of almonds, walnuts, and pistachios can provide healthy fats.",
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
                              "A. Bonus breathing technique (Kapalbhati Pranayama)\n",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 6, 116, 171)),
                            ),
                          ),
                          Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/hcl1.png', // Replace 'your_image.png' with your image asset path
                            height: 180, // Adjust height as needed
                            width: 200,// Adjust width as needed
                            fit: BoxFit.cover, // Adjust image fit as needed
                          ),
                        ),
                          SizedBox(
                            width: 320,
                            child: Text(
                              "In this technique you will inhale normally but exhale with force and the help of the abdominal muscles. This is best if performed on an empty stomach. This breathing exercise is not recommended during pregnancy.\n\nTo do this:\n1. Sit in a chair or cross-legged on the floor.\n2. Close your eyes and try to relax the entire body.\n3. Inhale deeply through the nose while expanding the chest.\n4. Exhale with forceful abdominal muscle contractions to relax.\n5. Repeat 10 times (1 cycle) up to 5 minutes while beginning.",
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
                              "C. Child's pose\n",
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
                        ],
                      ),
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
