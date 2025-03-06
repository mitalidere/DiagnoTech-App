import 'package:flutter/material.dart';

class Diabetes extends StatefulWidget {
  const Diabetes({Key? key}) : super(key: key);

  @override
  _DiabetesState createState() => _DiabetesState();
}

class _DiabetesState extends State<Diabetes> {
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
                            "Diabetes (Diabetes Mellitus)",
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
                          "A group of diseases that result in too much sugar in the blood (high blood glucose).\n",
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
                    padding: EdgeInsets.only(top: 20, left: 20),
                    child: Text(
                      "Symptoms",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                            "1. Urinate a lot, often at night\n\n2. Being really thirsty\n\n3. Feeling more tired than usual\n\n4. Losing weight without trying to\n\n5. Genital itching or thrush\n\n6. Cuts and wounds take longer to heal\n\n7. Blurred eyesight\n\n8. Increased hunger",
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
                    padding: EdgeInsets.only(top: 20, left: 20),
                    child: Text(
                      "Yogas",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                            "A. Legs-Up-the-Wall Pose\n",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 6, 116, 171)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/dd1.png', // Replace 'your_image.png' with your image asset path
                            height: 180, // Adjust height as needed
                            width: 170, // Adjust width as needed
                            fit: BoxFit.cover, // Adjust image fit as needed
                          ),
                        ),
                        SizedBox(
                          width: 320,
                          child: Text(
                            "This restorative inversion allows for relaxation. This helps lower stress levels, which may in turn help lower blood pressure and blood sugar levels. It can also help relieve headaches, boost energy, and increase circulation.\n\nTo do this:\n1. Fold up a blanket or towel to sit on.\n2. Sit with your right side against a wall.\n3. Swing your legs up along the wall as you move to lay flat on your back. Your body should form a 90-degree angle against the wall.\n4. Keep your sitting bones as close to the wall as possible.\n5. Relax your neck, chin, and throat.\n6. Stretch your arms out to the side with your palms facing up.\n7. Remain in this pose for 5 to 15 minutes.\n8. Release by slowly sliding your legs down to the side.",
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
                            "B.Reclining Bound Angle Pose\n",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 6, 116, 171)),
                          ),
                        ),
                         Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/dd2.png', // Replace 'your_image.png' with your image asset path
                            height: 180, // Adjust height as needed
                            width: 170, // Adjust width as needed
                            fit: BoxFit.cover, // Adjust image fit as needed
                          ),
                        ),
                        SizedBox(
                          width: 320,
                          child: Text(
                            "This is a restorative pose that can help calm your nervous system. This pose can also help reduce your stress levels, which may help lower blood pressure and blood sugar levels. It’s also thought to stimulate the abdominal organs, bladder, and kidneys.\n\nTo do this:\n1. While seated, bring the soles of your feet together. Your knees should be out to the sides.\n2. You may place a bolster underneath your knees for support.\n3. Slowly lean back until your back is flat on the floor.\n4. Relax the area around your hips.\n5. Rest your hands alongside your body with your palms facing up.\n6. You can also press down on your thighs to gently deepen the stretch in your legs and hips.\n7. Stay in this pose for up to 10 minutes.\n8. To release, use your hands to lift and press your knees together. Slowly sit all the way up.",
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
                            "C. Seated forward bend\n",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 6, 116, 171)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/dd3.png', // Replace 'your_image.png' with your image asset path
                            height: 180, // Adjust height as needed
                            width: 170, // Adjust width as needed
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
                            "D. Supported shoulderstand\n",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 6, 116, 171)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/dd4.png', // Replace 'your_image.png' with your image asset path
                            height: 180, // Adjust height as needed
                            width: 170, // Adjust width as needed
                            fit: BoxFit.cover, // Adjust image fit as needed
                          ),
                        ),
                        SizedBox(
                          width: 320,
                          child: Text(
                            "This inversion may help improve circulation and stimulate the thyroid gland. It can also help calm the mind and relieve stress.\n\nTo do this:\n1. Lie down flat on your back with a folded blanket under your shoulders.\n2. Align your shoulders with the edge of the blanket.\n3. Rest your arms alongside your body with your palms facing down.\n4. Lift your legs straight up into the air.\n5. Slowly lower your legs back toward your head.\n6. Move your hands to your lower back for support. Your fingers should be facing upward.\n7. Raise your legs up so that your shoulders, spine, and hips are in one straight line.\n8. Remain in the pose for 30 seconds to 3 minutes.\n9. Release by rolling your spine back down to the mat and lowering your legs to the floor.",
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
                            "E. Plow pose\n",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 6, 116, 171)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/dd5.png', // Replace 'your_image.png' with your image asset path
                            height: 180, // Adjust height as needed
                            width: 170, // Adjust width as needed
                            fit: BoxFit.cover, // Adjust image fit as needed
                          ),
                        ),
                        SizedBox(
                          width: 320,
                          child: Text(
                            "This inversion may help stimulate the thyroid gland, increase circulation, and reduce stress. Its therapeutic effects may also help relieve backache, headache, and insomnia.\n\nTo do this:\n1. From shoulderstand, bring your feet to the floor above your head.\n2. If your feet don’t reach the floor, use a pillow or block for support.\n3. Keep your hands on your lower back for added support.\n4. Remain in the pose for 1 to 5 minutes.\n5. To release, roll your spine back down to your mat and raise your legs up to form a 90-degree angle.\n6. Lower your legs back down to your mat.",
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
                    padding: EdgeInsets.only(top: 20, left: 20),
                    child: Text(
                      "Diet",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                            "1. Vegetable Dalia (Broken Wheat Porridge):\n- Use broken wheat cooked with vegetables like carrots, peas, and beans.\n- Season with cumin seeds, mustard seeds, and curry leaves.\n- Serve with a side of plain yogurt.\n\n2. Moong Dal Chilla (Lentil Pancakes):\n- Make pancakes using moong dal (split green gram) batter.\n- Add finely chopped vegetables like spinach, tomatoes, and onions to the batter.\n- Serve with mint chutney.",
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
                            "1. Handful of Nuts:\n- Almonds, walnuts, or pistachios can be a good choice.\n- These provide healthy fats and proteins.",
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
                            "1. Brown Rice with Dal:\n- Opt for brown rice instead of white rice for a lower glycemic index.\n- Pair with dal (lentils) and a side of mixed vegetable curry.\n- Include a salad with cucumber and tomatoes.\n\n2. Palak (Spinach) and Methi (Fenugreek) Roti:\n- Make rotis (Indian flatbreads) with a mix of whole wheat flour, spinach, and fenugreek leaves.\n- Serve with a side of low-fat curd.",
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
                            "1. Vegetable Sticks with Hummus:\n- Enjoy cucumber, carrot, and bell pepper sticks with a small portion of hummus.",
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
                            "1. Grilled Fish or Tofu:\n- Season with Indian spices like turmeric, cumin, and coriander.\n- Serve with sautéed green vegetables like broccoli and asparagus.\n\n2. Quinoa Pulao:\n- Prepare a pulao using quinoa, mixed vegetables, and spices like cumin and cinnamon.\n- Include a side of raita made with low-fat yogurt and cucumber.",
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
                            "1. Chana Chaat:\n- Mix boiled chickpeas with chopped onions, tomatoes, cucumber, and mint.\n- Add a squeeze of lemon juice and chaat masala for flavor.",
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
                          "1. Type 1 Diabetes: A chronic condition that affects the way the body processes blood sugar (glucose).\n\n2. Type 2 Diabetes: A chronic condition that affects the way the body processes blood sugar (glucose).\n\n3. Prediabetes: A condition in which blood sugar is high, but not high enough to be type 2 diabetes.\n\n4. Gestational Diabetes: A form of high blood sugar affecting pregnant women.",
                          style:
                              TextStyle(fontSize: 14, color: Color(0xFF616161)),
                        ),
                      ))
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
