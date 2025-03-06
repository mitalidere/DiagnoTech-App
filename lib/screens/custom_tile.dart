import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final String name;
  final String imagePath;
  final Widget navigationPage;

  const CustomTile({
    Key? key,
    required this.name,
    required this.imagePath,
    required this.navigationPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => navigationPage),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              // Adjust image fit as needed
            ),
            const SizedBox(
                height: 8), // Add some space between the image and text
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 10),
              child: Text(
                name,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Color(0xFF674188),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
