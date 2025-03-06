import 'package:flutter/material.dart';

class Migraine extends StatefulWidget {
  const Migraine({Key? key}) : super(key: key);

  @override
  _MigraineState createState() => _MigraineState();
}

class _MigraineState extends State<Migraine> {
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
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "Migraine (Migraine Headache)",
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
                          "A headache of varying intensity, often accompanied by nausea and sensitivity to light and sound.",
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
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 320,
                          child: Text(
                            "1. Intense throbbing or dull aching pain on one side of your head or both sides\n\n2. Pain that worsens with physical activity\n\n3. Nausea or vomiting\n\n4. Changes in how you see, blurred vision or blind spots\n\n5. Being bothered by light, noise, or odors\n\n6. Feeling tired and/or confused\n\n7. Stuffy nose\n\n8. Feeling cold or sweaty\n\n9. Stiff or tender neck\n\n10. Lightheadedness\n\n11. Tender scalp",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF616161)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
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
                            width: 200, // Adjust width as needed
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
                            "B. Bridge pose\n",
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
                            width: 200, // Adjust width as needed
                            fit: BoxFit.cover, // Adjust image fit as needed
                          ),
                        ),
                        SizedBox(
                          width: 320,
                          child: Text(
                            "This pose opens the chest, heart, and shoulders, and can reduce any anxiety you may be having.\n\nTo do this:\n1. Lie on your back on the floor. Your knees should be bent, and your feet should be on the floor.\n2. Extend your arms. Your palms should be flat on the floor.\n3. Lift your pelvic region upward. Your torso should follow. Your shoulders and head should remain on the floor.\n4. Make sure your thighs and feet remain parallel. Your weight should be distributed evenly.\n5. Hold this position for up to one minute.\n\nTo release this pose, you should slowly drop your torso and pelvic region down onto the floor. Allow your knees to sink downward until you’re laying flat on the floor. From there, you should slowly rise into an upright position.",
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
                            "C. Downward facing dog\n",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 6, 116, 171)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/md2.png', // Replace 'your_image.png' with your image asset path
                            height: 180, // Adjust height as needed
                            width: 200, // Adjust width as needed
                            fit: BoxFit.cover, // Adjust image fit as needed
                          ),
                        ),
                        SizedBox(
                          width: 320,
                          child: Text(
                            "The downward face dog can increase circulation to the brain.\n\nTo do this:\n1. Start on your hands and knees. Align your wrists under your shoulders and your knees under your hips.\n2. Stretch out your elbows and relax your upper back.\n3. Spread out your fingers and press down. Your weight should be distributed evenly between your hands.\n4. Gently lift your knees off the floor.\n5. You should straighten your legs, but be careful not to lock your knees.\n6. Lift your pelvis and lengthen your spine.\n7. Hold this for up to two minutes.\n\nTo come out of this pose, gently bend your knees and return to being on your hands and knees on the floor.",
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
                            "D. Corpse pose\n",
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
                            width: 200, // Adjust width as needed
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
                  SizedBox(
                    height: 30,
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
                            "1. Multigrain Dosa with Coconut Chutney:\n- Use a mix of whole grains like rice, lentils, and millets for dosa batter.\n- Pair withcoconut chutney, made with fresh coconut, curry leaves, and minimal green chilies.\n\n2. Smoothie with Berries and Spinach:\n- Blend together berries, spinach, banana, and a dollop of yogurt.\n- Add a teaspoon of flaxseeds for omega-3 fatty acids.",
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
                            "1. Fresh Fruit Salad:\n- Include hydrating fruits like watermelon, cucumber, and oranges.",
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
                            "1. Quinoa Salad with Chickpeas:\n- Mix cooked quinoa with chickpeas, cucumber, cherry tomatoes, and mint.\n- Dress with olive oil and lemon juice.\n\n2. Cumin Rice with Dal and Vegetable Curry:\n- Prepare cumin-flavored rice with dal and a side of mixed vegetable curry.",
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
                            "1. Nuts and Seeds Mix:\n- Combine almonds, walnuts, sunflower seeds, and pumpkin seeds for a nutrient-rich snack.",
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
                            "1. Baked Fish with Sweet Potato Mash:\n- Season fish with herbs like dill and bake.\n- Serve with mashed sweet potatoes seasoned with a touch of cinnamon.\n\n2. Moong Dal Soup with Methi Roti:\n- Make a light moong dal soup with minimal spices.\n- Serve with methi (fenugreek) roti.",
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
                            "1. Yogurt with Honey and Flaxseeds:\n- Choose probiotic-rich yogurt and add a drizzle of honey.\n- Sprinkle with flaxseeds for added nutritional benefits.",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
