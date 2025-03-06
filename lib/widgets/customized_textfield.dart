import 'package:flutter/material.dart';

class CustomizedTextfield extends StatelessWidget {
  final TextEditingController myController;
  final String? hintText;
  final bool? isPassword;
  const CustomizedTextfield(
      {Key? key, required this.myController, this.hintText, this.isPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: TextFormField(
          keyboardType: isPassword!
              ? TextInputType.visiblePassword
              : TextInputType.emailAddress,
          enableSuggestions: isPassword! ? false : true,
          autocorrect: isPassword! ? false : true,
          obscureText: isPassword ?? true,
          controller: myController,
          decoration: InputDecoration(
            hintText: hintText,
          ),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
          )),
    );
  }
}
