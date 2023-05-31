import 'package:flutter/material.dart';
import 'package:learn_provider/color_controller.dart';

class CommonTextField extends StatelessWidget {
  final int? minLines;
  final int? maxLines;
  final String? hintText;
  final bool? obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CommonTextField({
    Key? key,
    this.hintText,
    this.minLines,
    this.maxLines,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      minLines: minLines ?? 1,
      maxLines: maxLines ?? 1,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText ?? '',
        fillColor: Colors.grey.shade200,
        prefixIconColor: ColorController.buttonColor,
        suffixIconColor: ColorController.buttonColor,
        hintStyle: const TextStyle(
          color: ColorController.buttonColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: ColorController.buttonColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: ColorController.buttonColor.withOpacity(0.5),
          ),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      onFieldSubmitted: (value) {},
      validator: validator ??
          (value) {
            return null;
          },
    );
  }
}
