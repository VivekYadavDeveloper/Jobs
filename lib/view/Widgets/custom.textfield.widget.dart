import 'package:flutter/material.dart';
import 'package:inductus_jobs/app/app.color.constant.dart';

class CustomTextField {
  static customTextField({
    required TextEditingController textEditingController,
    required TextInputType textInputType,
    required String helperText,
    int? maxLength,
    String? Function(String?)? validator,
    Function(String)? onChange,
  }) {
    return TextFormField(
      keyboardType: textInputType,
      style: TextStyle(color: AppColors.whiteColor),
      onChanged: onChange,
      controller: textEditingController,
      validator: validator,
      decoration: InputDecoration(
        helperText: helperText,
        focusColor: AppColors.textFieldFillColor,
        hoverColor: AppColors.textFieldFillColor,
        fillColor: AppColors.textFieldFillColor,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        helperStyle: TextStyle(color: AppColors.whiteColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(color: AppColors.activeColor, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: AppColors.activeColor)),
      ),
    );
  }
}
