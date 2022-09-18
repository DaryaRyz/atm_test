import 'package:atm_test/domain/models/settings.dart';
import 'package:atm_test/presentation/styles/color_styles.dart';
import 'package:atm_test/presentation/styles/strings.dart';
import 'package:atm_test/presentation/styles/ui_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNotification extends StatelessWidget {
  final ShowNotification notificationState;
  final DateTime? time;

  const CustomNotification({
    Key? key,
    required this.notificationState,
    this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.ease,
      duration: const Duration(milliseconds: 300),
      width: double.maxFinite,
      height: notificationState == ShowNotification.unknown ? 0 : 80.h,
      margin: notificationState == ShowNotification.unknown
          ? EdgeInsets.symmetric(vertical: 5.h)
          : EdgeInsets.symmetric(vertical: 24.h),
      decoration: BoxDecoration(
        color: _getColor(),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: Row(
          children: [
            if (notificationState == ShowNotification.positive)
              SvgPicture.asset('assets/icons/check_icon.svg'),
            if (notificationState == ShowNotification.positive)
              SizedBox(width: 8.w),
            Text(
              _getText(),
              style: TextStyle(
                color: ColorStyles.tmnDarkBlue,
                fontFamily: 'Roboto',
                fontSize: 16.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColor() {
    switch (notificationState) {
      case ShowNotification.positive:
        return ColorStyles.tmnGreen.withOpacity(0.08);
      case ShowNotification.negative:
        return ColorStyles.tmnRed.withOpacity(0.8);
      default:
        return Colors.transparent;
    }
  }

  String _getText() {
    switch (notificationState) {
      case ShowNotification.positive:
        return UiUtil.fromSuccessSaveTime(time!);
      case ShowNotification.negative:
        return Strings.notificationErrorText;
      default:
        return '';
    }
  }
}
