import 'package:atm_test/presentation/styles/color_styles.dart';
import 'package:atm_test/presentation/styles/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNotification extends StatelessWidget {
  const CustomNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 80.h,
      margin: EdgeInsets.symmetric(vertical: 24.h),
      decoration: BoxDecoration(
        color: ColorStyles.tmnGreen.withOpacity(0.08),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 8.w),
            child: SvgPicture.asset('assets/icons/check_icon.svg'),
          ),
          Text(
            Strings.notificationText,
            style: TextStyle(
              color: ColorStyles.tmnDarkBlue,
              fontFamily: 'Roboto',
              fontSize: 16.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
