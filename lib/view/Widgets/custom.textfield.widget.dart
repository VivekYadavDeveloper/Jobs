import 'package:flutter/material.dart';

class CustomTextField {
  static customTextField({
    required TextEditingController textEditingController,
    required TextInputType textInputType,
    required String hintText,
    int? maxLength,
    String? Function(String?)? validator,
    Function(String)? onChange,
  }) {
    return TextFormField(
      keyboardType: textInputType,
      style: const TextStyle(color: Colors.black),
      onChanged: onChange,
      controller: textEditingController,
      validator: validator,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        helperText: hintText,
        hintStyle: TextStyle(
          color: Colors.lightBlue.shade400,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(color: Colors.blueAccent.shade400, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.purpleAccent.shade200)),
      ),
    );
  }
}
