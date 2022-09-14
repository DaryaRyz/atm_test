import 'package:atm_test/presentation/styles/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final Color backgroundColor;
  final Color borderColor;
  final VoidCallback onTap;
  final String text;
  final Color textColor;
  final FontWeight fontWeight;
  final double fontSize;

  const CustomButton({
    Key? key,
    this.height = 48,
    this.width = 160,
    required this.backgroundColor,
    this.borderColor = ColorStyles.tmnBlue,
    required this.onTap,
    required this.text,
    this.textColor = ColorStyles.tmnBlue,
    this.fontWeight = FontWeight.w500,
    this.fontSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      ),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          primary: Colors.transparent,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontFamily: 'Jost',
            fontSize: fontSize.sp,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
