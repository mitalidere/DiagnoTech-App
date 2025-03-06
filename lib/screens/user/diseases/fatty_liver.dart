import 'package:flutter/material.dart';

class FattyLiver extends StatefulWidget {
  const FattyLiver({Key? key}) : super(key: key);

  @override
  _FattyLiverState createState() => _FattyLiverState();
}

class _FattyLiverState extends State<FattyLiver> {
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
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "Fatty Liver (Hepatic Steatosis)",
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
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 320,
                        child: Text(
                          "An increased build-up of fat in the liver.\n",
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
                                    'Types',
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                            "Nonalcoholic Fatty Liver Disease (NAFLD)\n",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 6, 116, 171)),
                          ),
                        ),
                        SizedBox(
                          width: 320,
                          child: Text(
                            "1. Overweight or obesity\n\n2. Insulin resistance\n\n3. Type 2 diabetes\n\n4. High cholesterol\n\n5. High triglycerides\n\n6. Metabolic syndrome\n\n",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF616161)),
                          ),
                        ),
                        SizedBox(
                          width: 320,
                          child: Text(
                            "Alcoholic Fatty Liver Disease (AFLD)\n",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 6, 116, 171)),
                          ),
                        ),
                        SizedBox(
                          width: 320,
                          child: Text(
                            "1. Abdominal pain or a feeling of fullness in the upper right side of your abdomen\n\n2. Fatigue\n\n3. Nausea\n\n4. Loss of appetite\n\n5. Unexplained weight loss\n\n6. Yellowish skin and whites of the eyes\n\n7. Swelling in your abdomen\n\n8. Swelling in your legs, feet or hands",
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                      children: [
                        SizedBox(
                          width: 320,
                          child: Text(
                            "A. Triangle Pose\n",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 6, 116, 171)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/fl1.png', // Replace 'your_image.png' with your image asset path
                            height: 180, // Adjust height as needed
                            width: 200,// Adjust width as needed
                            fit: BoxFit.cover, // Adjust image fit as needed
                          ),
                        ),
                        SizedBox(
                          width: 320,
                          child: Text(
                            "This energizing pose increases strength, balance, and flexibility.\n\nTo do this:\n1. Jump, step, or walk your feet slightly wider than your hips.\n2. Turn your right toes forward and your left toes outward.\n3. Raise your arms parallel to the floor, palms facing down.\n4. Hinge at your right hip and extend your right arm forward.\n5. Lower your right arm and raise your left arm toward the ceiling.\n6. Gently rotate your neck up and down, gazing upward or downward.\n7. Hold this pose for up to 30 seconds.\n8. Repeat on the other side.",
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
                            "B. Sphinx Pose\n",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 6, 116, 171)),
                          ),
                        ),
                           Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/fl2.png', // Replace 'your_image.png' with your image asset path
                            height: 180, // Adjust height as needed
                            width: 200,// Adjust width as needed
                            fit: BoxFit.cover, // Adjust image fit as needed
                          ),
                        ),
                        SizedBox(
                          width: 320,
                          child: Text(
                            "Sphinx Pose is a gentle backbend that improves core strength, stimulates abdominal organs, and encourages relaxation.\n\nTo do this:\n1. Begin by lying flat on your stomach.\n2. Place your elbows directly under your shoulders, firmly pressing your palms and forearms into the floor.\n3. Engage your lower back, buttocks, and thighs as you raise your upper torso and head.\n4. Maintain a straight gaze and focus on elongating your spine.\n5. Hold this pose for up to 1 minute.",
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
                            "C. Cobra Pose\n",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 6, 116, 171)),
                          ),
                        ),
                           Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/fl3.png', // Replace 'your_image.png' with your image asset path
                            height: 180, // Adjust height as needed
                            width: 200,// Adjust width as needed
                            fit: BoxFit.cover, // Adjust image fit as needed
                          ),
                        ),
                        SizedBox(
                          width: 320,
                          child: Text(
                            "Cobra Pose improves core strength, spinal flexibility, and blood flow. It also positively affects stress, digestion, and respiratory function.\n\nTo do this:\n1. Lie on your stomach with your hands beneath your shoulders.\n2. Draw your elbows into your torso.\n3. Inhale as you lift your head, chest, and shoulders.\n4. Keep a gentle bend in your elbows as you lift and expand your chest.\n5. Engage your lower back, abdominals, and thighs.\n6. Hold for up to 30 seconds.\n7. Gently release the pose.\n8. Repeat 1–3 times.",
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
                            "D. Bow Pose\n",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 6, 116, 171)),
                          ),
                        ),
                           Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/fl4.png', // Replace 'your_image.png' with your image asset path
                            height: 180, // Adjust height as needed
                            width: 200,// Adjust width as needed
                            fit: BoxFit.cover, // Adjust image fit as needed
                          ),
                        ),
                        SizedBox(
                          width: 320,
                          child: Text(
                            "Practicing Bow Pose can enhance blood circulation, improve digestion, and boost energy.\n\nTo do this:\n1. Lie on your stomach with your arms extended beside you.\n2. Bend your knees and reach your hands back to grip the outer edges of your ankles.\n3. If possible, lift your chest and shoulders off the ground.\n4. Gaze forward and take slow, deep breaths.\n5. Hold the pose for up to 30 seconds.\n6. Repeat 1–2 times.",
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
                            "E. Half Lord of the Fishes Pose\n",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 6, 116, 171)),
                          ),
                        ),
                           Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/fl5.png', // Replace 'your_image.png' with your image asset path
                            height: 180, // Adjust height as needed
                            width: 200,// Adjust width as needed
                            fit: BoxFit.cover, // Adjust image fit as needed
                          ),
                        ),
                        SizedBox(
                          width: 320,
                          child: Text(
                            "Practicing this invigorating twist alleviates tension and stimulates your internal organs.\nTo support your hips, sit on the edge of a cushion.\n\nTo do this:\n1. Begin in a seated position.\n2. Place your right foot to the outside of your left hip, pointing your right knee forward.\n3. Bring your left foot to the outside of your right thigh.\n4. Place your left hand on the floor behind you, pressing into your fingertips for support.\n5. Move your right arm to the outside of your left leg.\n6. Gently rotate your torso and gaze over either shoulder.\n7. Hold the pose for up to 1 minute.\n8. Repeat on the opposite side.",
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                            "1. Vegetable Dalia (Broken Wheat Porridge):\n- Cook dalia with vegetables like carrots, peas, and beans.\n- Season with cumin seeds, coriander, and a pinch of turmeric.\n\n2. Moong Dal Chilla (Lentil Pancakes):\n- Make pancakes using moong dal batter.\n- Add finely chopped vegetables like spinach, tomatoes, and onions.\n- Serve with mint chutney.",
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
                            "1. Turmeric Milk:\n- Warm milk with a pinch of turmeric and a dash of black pepper.",
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
                            "1. Brown Rice with Dal and Mixed Vegetable Curry:\n- Opt for brown rice over white rice.\n- Pair with dal (lentils) and a side of mixed vegetable curry.\n- Include a cucumber and tomato salad with lemon dressing.\n\n2. Methi (Fenugreek) Roti with Lauki (Bottle Gourd) Raita:\n- Make rotis with a mix of whole wheat flour and methi leaves.\n- Serve with raita made with grated bottle gourd and low-fat yogurt.",
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
                            "1. Mixed Fruit Bowl:\n- Combine fruits like papaya, apple, and berries for a nutrient-rich snack.",
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
                            "1. Grilled Fish or Tofu with Quinoa:\n- Season with herbs like coriander and cumin.\n- Serve with quinoa and steamed broccoli or spinach.\n\n2. Palak (Spinach) and Tomato Dal:\n- Prepare dal with spinach and tomatoes.\n- Use minimal oil and season with cumin and coriander.",
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
                    child: SizedBox(
                      width: 320,
                      child: Text(
                        "Types\n",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 6, 116, 171)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 15),
                    child: SizedBox(
                      width: 320,
                      child: Text(
                        "1. Nonalcoholic Fatty Liver Disease (NAFLD): NAFLD is a type of fatty liver disease that is not related to heavy alcohol use. There are two forms of NAFLD:\n\na. Simple fatty liver, in which you have fat in your liver but little or no inflammation or liver cell damage. Simple fatty liver typically does not get bad enough to cause liver damage or complications.\n\nb. Nonalcoholic steatohepatitis (NASH), in which you have inflammation and liver cell damage, as well as fat in your liver. Inflammation and liver cell damage can cause fibrosis, or scarring, of the liver. NASH may lead to cirrhosis or liver cancer.\n\n2. Alcoholic Fatty Liver Disease (AFLD): Alcoholic fatty liver disease is due to heavy alcohol use.",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFF616161)),
                      ),
                    ),
                  )
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
