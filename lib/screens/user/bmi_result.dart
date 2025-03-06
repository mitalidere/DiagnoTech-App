import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {
  final int height;
  final int weight;
  final double bmi;
  final String category;
  final buttonHeight = 50.0;

  const BmiResult(
      {Key? key,
      required this.height,
      required this.weight,
      required this.bmi,
      required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              flex: 4,
              child: Container(
                // color: Colors.greenAccent[100],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Result',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFF674188),
                          ),
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          child: const Text(
                            'Height',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          width: 150,
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.black, width: 3))),
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          child: Text(
                            '$height',
                            style: const TextStyle(fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFF674188),
                          ),
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          child: const Text(
                            'Weight',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          width: 150,
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.black, width: 3))),
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          child: Text(
                            '$weight',
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                // Use same background color like the second container
                Container(
                  height: buttonHeight,
                  decoration: const BoxDecoration(
                    color: Color(0xFFC3ACD0),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    ),
                  ),
                ),
                // Translate the button
                Transform.translate(
                  offset: Offset(0.0, -buttonHeight / 2.0),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: buttonHeight,
                        decoration: BoxDecoration(
                          color: Color(0xFF674188),
                          shape: BoxShape.circle,
                          // borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 16.0,
                              offset: const Offset(0.0, 6.0),
                              color: Colors.black.withOpacity(0.16),
                            ),
                          ],
                        ),
                        padding:
                            const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0.0),
                        child: const Icon(
                          Icons.refresh,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Flexible(
              flex: 6,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFC3ACD0),
                ),
                child: Center(
                  child: Container(
                    // width: 200,
                    margin: const EdgeInsets.fromLTRB(30, 0, 30, 60),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            bmi.toStringAsFixed(2),
                            style: const TextStyle(
                                fontSize: 48, fontWeight: FontWeight.w700),
                          ),
                          const Text(
                            'BMI',
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            category,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w300),
                          ),
                          Image.asset(
                            'assets/bmi-graph.jpg',
                            fit: BoxFit.fill,
                          ),
                        ]),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
