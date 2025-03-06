
import 'package:flutter/material.dart';

class Pcos extends StatefulWidget {
  const Pcos({Key? key}) : super(key: key);

  @override
  _PcosState createState() => _PcosState();
}

class _PcosState extends State<Pcos> {
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
                        "PCOS (Polycystic ovary syndrome)",

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
                              "A hormonal disorder causing enlarged ovaries with small cysts on the outer edges.",

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
                              "1. Heavy, long, intermittent, unpredictable or absent periods\n\n2. Infertility\n\n3. Acne or oily skin\n\n4. Excessive hair on the face or body\n\n5. Male-pattern baldness or hair thinning\n\n6. Weight gain, especially around the belly.",
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
                              "1. Quinoa Upma:\n- Cook quinoa with vegetables like spinach, bell peppers, and tomatoes.\n- Season with cumin, turmeric, and a squeeze of lemon.\n\n2. Vegetable Omelette:\n- Make an omelette with egg whites and loaded with colorful vegetables like spinach, tomatoes, and mushrooms.",
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
                              "1. Greek Yogurt with Berries:\n- Choose low-fat Greek yogurt and top it with fresh berries for added antioxidants.",
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
                              "1. Chickpea Salad:\n- Combine chickpeas with cucumber, cherry tomatoes, and bell peppers.\n- Dress with olive oil, lemon juice, and a sprinkle of chaat masala.\n\n2. Palak (Spinach) Roti with Paneer (Cottage Cheese) Bhurji:\n- Make rotis with spinach and serve with a side of paneer bhurji cooked with tomatoes, onions, and spices.",
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
                              "1. Handful of Almonds and Walnuts:\n- Nuts provide healthy fats and can be a satisfying snack.",
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
                              "1. Grilled Fish with Quinoa:\n- Marinate fish with turmeric, ginger, and garlic, then grill.\n- Serve with quinoa and steamed broccoli.\n\n2. Methi (Fenugreek) Dal:\n- Prepare dal with methi leaves, tomatoes, and minimal oil.\n- Pair with brown rice or whole wheat rotis.",
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
                              "1. Chia Seed Pudding:\n- Mix chia seeds with almond milk and let it sit in the refrigerator. Top with berries before serving.",
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
                              "A. Garland Pose (Malasana)\n",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 6, 116, 171)),
                            ),
                          ),
                           Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/pd1.png', // Replace 'your_image.png' with your image asset path
                            height: 180, // Adjust height as needed
                            width: 200,// Adjust width as needed
                            fit: BoxFit.cover, // Adjust image fit as needed
                          ),
                        ),
                          SizedBox(
                            width: 320,
                            child: Text(
                              "Malasana can strengthen the pelvic floor and abdominal core while opening the hips. Bhanote says this can benefit individuals with PCOS by increasing circulation and blood flow to the pelvic region, improving metabolism, and aiding digestion.\nYou can use a block or two under your glutes for support until your body becomes familiar with this position.\n\nTo do this:\n1. Start with feet about a mat’s width apart.\n2. Bend your knees and lower your buttocks toward the floor to come into a squat position.\n3. Bring your hands in prayer position (anjali mudra). You can allow your thumbs to touch your sternum to help keep the chest lifted.\n4. Press your upper arms/triceps inside of your knees and stay engaged with spine straight (elbows press into knees to open the hips).\n5. Extend the low back and draw shoulder blades toward one another.\n6. Remain in this position for up to 5 breaths.\n7. Come out of it by straightening your legs.\n8. Repeat the pose for a total of three times.\n\nIt’s OK if your heels don’t remain planted on the ground when you come into the position. Support the heels with a rolled blanket to help keep you balanced and upright.",
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
                              "B. Bridge Pose (Setu Bandhasana)\n",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 6, 116, 171)),
                            ),
                          ),
                           Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/md1.png', // Replace 'your_image.png' with your image asset path
                            height: 180, // Adjust height as needed
                            width: 200,// Adjust width as needed
                            fit: BoxFit.cover, // Adjust image fit as needed
                          ),
                        ),
                          SizedBox(
                            width: 320,
                            child: Text(
                              "Bridge Pose can calm the brain and reduce stress and anxiety while relieving tension in the back muscles.\n\nTo do this:\n1. Start by lying on your back with your knees folded and feet hip-distance apart on the floor.\n2. Place your hands, palm down beside your body.\n3. Inhale while slowly lifting your lower back, mid-back, then upper back off the floor (while the pelvis lifts up, lengthen from pelvis to sternum).\n4. Gently roll the shoulders and bring the chest toward the chin.\n5. Keep thighs parallel to each other and the floor with all four corners of the feet pressed firmly into the ground.\n6. Breathe with ease and stay in this pose for 1–2 minutes.\n7. Repeat up to 5 times.",
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
                              "C. Bow Pose (Dhanurasana)\n",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 6, 116, 171)),
                            ),
                          ),
                           Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/pd2.png', // Replace 'your_image.png' with your image asset path
                            height: 180, // Adjust height as needed
                            width: 200,// Adjust width as needed
                            fit: BoxFit.cover, // Adjust image fit as needed
                          ),
                        ),
                          SizedBox(
                            width: 320,
                            child: Text(
                              "Dhanurasana may help relieve menstrual discomfort, stimulate reproductive organs, and regulate menstrual flow, according to Bhanote. “It increases circulation to the pelvic region, releases tension from abdominal organs, and also stretches the neck, shoulders, and legs muscles,” she says. Overall, it may improve anxiety and decrease stress.\n\nTo do this:\n1. Start lying down on your stomach with your arms on the side of your body.\n2. Fold your knees up and reach your hands to hold your ankles.\n3. Breathe in and lift your chest up off the ground while pulling your legs up.\n4. Hold the pose for 15 seconds, and remember to keep breathing.\n5. To release, bring your chest and legs back toward the ground, release the hold on your ankles, and relax, face down.\n6. Repeat for a total of 3 times.\n\nIf you cannot reach both of your ankles at the same time, you can do one leg at a time, or use a yoga strap for assistance.",
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
                              "D. Cat-Cow Pose (Chakravakasana)\n",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 6, 116, 171)),
                            ),
                          ),
                           Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/pd3.png', // Replace 'your_image.png' with your image asset path
                            height: 180, // Adjust height as needed
                            width: 200,// Adjust width as needed
                            fit: BoxFit.cover, // Adjust image fit as needed
                          ),
                        ),
                          SizedBox(
                            width: 320,
                            child: Text(
                              "The Cat-Cow Pose is also high on Burnett’s go-to list for PCOS.\n\n1. Get in tabletop position with your palms down, wrists and elbows aligned under shoulders, knees under hips, ankles straight back from the knees. You can curl the toes under or tops of the feet down, as the flow moves you.\n2. Inhale, bend the elbows, lower the belly, lift the chin and the tail bone simultaneously, moving each of the vertebrae of the spinal column in a wave.\n3. Reverse the movement on the exhale by tucking the tail bone and chin, and doming the back as you draw the navel toward the spine as the chin tips toward the chest.\n4. Repeat for desired amount of times.",
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
                              "E. Bonus breathing technique (Kapalbhati Pranayama)\n",
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
                              "“Kapalbhati is a rapid breathing exercise that may help a few of the characteristics associated with PCOS such as weight management, blood sugar levels, and stress levels,” says Bhanote.\nIn this technique you will inhale normally but exhale with force and the help of the abdominal muscles. This is best if performed on an empty stomach. This breathing exercise is not recommended during pregnancy.\n\nTo do this:\n1. Sit in a chair or cross-legged on the floor.\n2. Close your eyes and try to relax the entire body.\n3. Inhale deeply through the nose while expanding the chest.\n4. Exhale with forceful abdominal muscle contractions to relax.\n5. Repeat 10 times (1 cycle) up to 5 minutes while beginning.",
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
