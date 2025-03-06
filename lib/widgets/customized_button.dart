import 'package:flutter/material.dart';

class CustomizedButton extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final Color? textColor;
  final VoidCallback? onPressed;
  
  const CustomizedButton({
    Key? key,
    this.buttonText,
    this.buttonColor,
    this.onPressed,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        elevation: 15, // Adjust the elevation value as needed
        borderRadius: BorderRadius.circular(50),
        child: InkWell(
          onTap: onPressed,
          child: Container(
            height: 47,
            width: 200,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                buttonText!,
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
