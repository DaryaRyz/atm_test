import 'package:atm_test/presentation/styles/color_styles.dart';
import 'package:atm_test/presentation/styles/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AtmStatus extends StatelessWidget {
  final bool isWorking;

  const AtmStatus({
    Key? key,
    required this.isWorking,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Container(
            width: 8.r,
            height: 8.r,
            decoration: BoxDecoration(
              color: isWorking ? ColorStyles.tmnGreen : ColorStyles.tmnRed,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            isWorking ? Strings.atmWorkingStatus : Strings.atmNonWorkingStatus,
            style: TextStyle(
              color: ColorStyles.tmnDarkBlue,
              fontFamily: 'Roboto',
              fontSize: 14.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}