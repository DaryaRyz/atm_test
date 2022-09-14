import 'package:atm_test/presentation/styles/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final double width;
  final TextInputType keyboardType;
  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    this.hintText,
    this.width = 160,
    this.keyboardType = TextInputType.text,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: 40.h,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(
          color: ColorStyles.tmnDarkBlue,
          fontFamily: 'Jost',
          fontSize: 16,
          fontWeight: FontWeight.w300,
        ),
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorStyles.tmnLightBlue, width: 1),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorStyles.tmnBlue, width: 1),
          ),
          contentPadding: const EdgeInsets.only(
            left: 8,
            top: 8,
            bottom: 8,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: ColorStyles.tmnLightGrey,
            fontFamily: 'Jost',
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
