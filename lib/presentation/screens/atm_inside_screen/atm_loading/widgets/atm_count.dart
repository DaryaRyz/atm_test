import 'package:atm_test/presentation/styles/color_styles.dart';
import 'package:atm_test/presentation/styles/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedCount extends StatelessWidget {
  final double progress;

  const AnimatedCount({
    Key? key,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${(progress * 100).toStringAsFixed(0)}%',
            style: TextStyle(
              color: ColorStyles.tmnDarkBlue,
              fontFamily: 'Jost',
              fontSize: 40.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            Strings.atmCurrentLoadingLevelTitle,
            style: TextStyle(
              color: ColorStyles.tmnDarkBlue,
              fontFamily: 'Jost',
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              height: 1.14,
            ),
          ),
        ],
      ),
    );
  }
}