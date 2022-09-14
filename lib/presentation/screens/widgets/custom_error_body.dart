import 'package:atm_test/presentation/styles/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomErrorBody extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const CustomErrorBody({
    Key? key,
    this.text = 'An error has occurred.\nClick to repeat the request.',
    this.icon = Icons.warning,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 100.r,
                color: ColorStyles.tmnRed,
              ),
              SizedBox(height: 20.h),
              Text(
                text,
                style: TextStyle(
                  color: ColorStyles.tmnDarkBlue,
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
