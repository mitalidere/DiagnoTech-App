import 'package:flutter/material.dart';

class Thyroid extends StatefulWidget {
  const Thyroid({Key? key}) : super(key: key);

  @override
  _ThyroidState createState() => _ThyroidState();
}

class _ThyroidState extends State<Thyroid> {
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
                        "Thyroid (Abnormal Thyroid)",

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
                              "Any dysfunction of the butterfly-shaped gland at the base of the neck (thyroid).\n",
                         
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
                              "1. Anxiety\n\n2. Difficulty concentrating\n\n3. Fatigue\n\n4. Frequent bowel movements\n\n5. Goiter (visibly enlarged thyroid gland) or thyroid nodules\n\n6. Hair loss\n\n7. Hand tremor\n\n8. Heat intolerance\n\n9. Increased appetite\n\n10. Increased sweating\n\n11. Irregular menstrual periods in women\n\n12. Nail changes (thickness or flaking)\n\n13. Nervousness\n\n14. Pounding or racing heart beat (palpitations)\n\n15. Restlessness\n\n16. Sleep problems\n\n17. Weight loss (or weight gain, in some cases)",
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
                              "A. Supported shoulderstand\n",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 6, 116, 171)),
                            ),
                          ),
                           Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/tdd1.png', // Replace 'your_image.png' with your image asset path
                            height: 180, // Adjust height as needed
                            width: 200,// Adjust width as needed
                            fit: BoxFit.cover, // Adjust image fit as needed
                          ),
                        ),
                          SizedBox(
                            width: 320,
                            child: Text(
                              "Shoulderstand is often the first pose that’s suggested to treat the thyroid. Since it’s an inversion, it stimulates blood flow to the glands in the upper body. This is believed to have a positive effect on the efficiency of the thyroid. Additionally, the way your chin is tucked into your chest in this position is believed to benefit thyroid function.\n\nTo do this:\n1. You can use a folded towel or blanket under your shoulders for support.\n2. Bring your shoulders to the edge of the blanket and let your head rest on the mat.\n3. Lie flat on your back with your arms alongside your body and your palms facing down.\n4. Press your arms and back into the floor for support.\n5. On an inhale, lift your legs up to ninety degrees.\n6. Slowly exhale and bring your legs over your head.\n7. Your feet can balance in the air.\n6. Bring your hands to your lower back to support your body.\n8. Keep your fingers pointing up toward your hips with your pinky fingers on either side of your spine.\n9. Raise your legs straight up toward the ceiling.\n10. Aim to keep your shoulders, spine, and hips in one line if it’s possible.\n11. You can also keep your hips away from your body at an angle.\n12. Keep your chin tucked into your chest as you keep your neck in one position.\n13. Release the pose by slowly releasing your legs back over your head.\n14. Bring your arms back alongside the body.\n15. On an inhale, slowly roll your spine down vertebrae by vertebrae and lift your legs to ninety degrees.\n16. Exhale as you lower your legs to the floor.\n\nBe mindful of your neck during this pose and discontinue the practice if you have any discomfort. It’s advised that you learn this pose under the tutelage of a teacher who has a strong knowledge of alignment. Remember that this pose is not recommended to everyone due to the possibility of injury.",
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
                              "B.Plow pose\n",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 6, 116, 171)),
                            ),
                          ),
                           Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/tdd2.png', // Replace 'your_image.png' with your image asset path
                            height: 180, // Adjust height as needed
                            width: 200,// Adjust width as needed
                            fit: BoxFit.cover, // Adjust image fit as needed
                          ),
                        ),
                          SizedBox(
                            width: 320,
                            child: Text(
                              "In plow pose, your thyroid is believed to get the same stimulation as it does in shoulderstand. You may find it easier to do plow pose.\n\nTo do this:\n1. Lie flat on your back with your arms alongside your body and your palms facing down.\n2. Press your arms and back into the floor for support.\n3. On an inhale, lift your legs up to ninety degrees.\n4. Slowly exhale and bring your legs over your head.\n5. Bring your hands to your lower back to support your body.\n6. Keep your fingers pointing up toward your hips with your pinky fingers on either side of your spine.\n7. You may place a bolster or block under your feet if they don’t reach the floor.\n8. Keep your hands on your hips if your feet do not touch reach the floor or the prop.\n9. If it’s comfortable and your feet are supported, you can bring your arms alongside your body or interlace your fingers in front of your hips. You may also bring your arms overhead.\n10. Release the pose by bringing your arms on the floor alongside your body.\n11. Slowly inhale to lift your legs up and realign your spine along the floor.\n12. Exhale to lower your legs to the floor.\n\nYou can use pillows to support your feet if they don’t reach all the way to the floor.",
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
                              "C. Fish pose\n",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 6, 116, 171)),
                            ),
                          ),
                           Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/tdd3.png', // Replace 'your_image.png' with your image asset path
                            height: 180, // Adjust height as needed
                            width: 200,// Adjust width as needed
                            fit: BoxFit.cover, // Adjust image fit as needed
                          ),
                        ),
                          SizedBox(
                            width: 320,
                            child: Text(
                              "Fish pose is the perfect counter pose to shoulderstand. It’s more accessible and can also be done on its own.\n\nTo do this:\n1. Sit on your buttocks with your legs extended in front of you.\n2. Move to one side at a time so you can place your hands underneath your buttocks.\n3. Face your palms down and your fingers facing toward your toes.\n4. Draw your elbows into each other and open your chest.\n5. Slowly lean back onto your forearms and elbows.\n6. Again, open your chest as much as possible and press into your arms to stay lifted.\n7. Drop your head back if you feel comfortable.\n8. Release by lifting your head, releasing your hands, and lying down on your back.\nFish pose and shoulderstand are thought to be most effective for improving thyroid function. As you let your head hang back in fish pose, you stimulate your thyroid by exposing the throat area.",
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
                              "1. Vegetable Poha:\n- Cook flattened rice with mixed vegetables like peas, carrots, and bell peppers.\n- Season with turmeric, mustard seeds, and curry leaves.\n\n2. Quinoa Upma:\n- Cook quinoa with vegetables and season with cumin, mustard seeds, and a pinch of hing (asafoetida).",
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
                              "1. Greek Yogurt with Berries:\n- Choose low-fat Greek yogurt for added protein.",
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
                              "1. Brown Rice with Lentils and Mixed Vegetables:\n- Opt for brown rice over white rice.\n- Pair with lentils and a side of mixed vegetable curry.\n- Include a cucumber and tomato salad with lemon dressing.\n\n2. Methi (Fenugreek) Roti with Lauki (Bottle Gourd) Sabzi:\n- Make rotis with a mix of whole wheat flour and methi leaves.\n- Serve with lauki sabzi cooked with tomatoes, onions, and minimal oil.",
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
                              "1. Nuts and Seeds Mix:\n- A small handful of almonds, walnuts, and pumpkin seeds for healthy fats.",
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
                              "1. Grilled Fish or Tofu with Quinoa:\n- Season with herbs like thyme and basil.\n- Serve with quinoa and sautéed spinach or kale.\n\n2. Palak (Spinach) and Tomato Dal:\n- Prepare dal with spinach and tomatoes.\n- Use minimal oil and season with cumin and coriander.",
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
                              "1. Roasted Chickpeas:\n- Season chickpeas with spices like cumin, coriander, and a pinch of salt, then roast until crunchy.",
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
                      "Types\n",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 6, 116, 171)),
                    ),
                  ),
                  ),
               Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, top:10,bottom: 15),
                  child:   
                 SizedBox(
                            width: 320,
                            child: Text(
                              "1. Thyroid Nodule: A lump in the thyroid, the butterfly-shaped gland at the base of the neck.\n\n2. Hypothyroidism (Underactive Thyroid): A condition in which the thyroid gland doesn't produce enough thyroid hormone.\n\n3. Hyperthyroidism(Overactive Thyroid): The overproduction of a hormone by the butterfly-shaped gland in the neck (thyroid).\n\n4. Goiter(Enlarged Thyroid): Abnormal enlargement of the butterfly-shaped gland below the Adam's apple (thyroid).\n\n5. Thyroiditis: Inflammation of the thyroid, the butterfly-shaped gland in the neck.\n\n6. Thyroid Cancer: A cancer of the thyroid, the butterfly-shaped gland at the base of the neck.",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF616161)),
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
