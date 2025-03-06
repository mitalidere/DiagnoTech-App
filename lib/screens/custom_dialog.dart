import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String description;
  const CustomAlertDialog({Key? key, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            height: 225,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 60, 10, 20),
              child: Column(children: [
                Text(
                  description,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Text(
                  'If you want more accurate data, please consult a nearby doctor.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 14,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF674188),
                        padding: EdgeInsets.fromLTRB(20, 15, 20, 15)),
                    child: const Text(
                      'Got it',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ))
              ]),
            ),
          ),
          Positioned(
              top: -60,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50,
                child: Image.asset('assets/logo-png.png'),
              ))
        ],
      ),
    );
  }
}
