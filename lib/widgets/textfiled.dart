import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final String? hintText;
  TextInputType? inputType;
  CustomTextField({
    super.key,
    this.hintText,
    this.inputType,
    this.onChanged,
  });
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: inputType,
      style: const TextStyle(
        color: Color.fromARGB(255, 7, 6, 6),
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(255, 6, 5, 5),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: const BorderSide(
            color: Color(0xfff63a79),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 15, 14, 14),
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 114, 111, 111),
        ),
      ),
    );
  }
}
