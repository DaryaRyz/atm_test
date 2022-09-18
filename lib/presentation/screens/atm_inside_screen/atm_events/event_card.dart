import 'package:atm_test/presentation/styles/color_styles.dart';
import 'package:atm_test/presentation/styles/ui_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventCard extends StatelessWidget {
  final DateTime time;
  final String title;
  final String? extraInfo;
  final VoidCallback onTap;

  const EventCard({
    Key? key,
    required this.time,
    required this.title,
    this.extraInfo,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 48.h,
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        color: ColorStyles.tmnWhite,
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(
            color: ColorStyles.atmShadow,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          primary: Colors.black26,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 2.w,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(4),
                ),
                color: ColorStyles.tmnRed,
              ),
            ),
            SizedBox(width: 14.w),
            Text(
              UiUtil.fromTime(time),
              style: TextStyle(
                color: ColorStyles.tmnDarkBlue.withOpacity(0.16),
                fontFamily: 'Jost',
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 18.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: ColorStyles.tmnDarkBlue,
                    fontFamily: 'Jost',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                extraInfo != null
                    ? Text(
                  extraInfo!,
                  style: TextStyle(
                    color: ColorStyles.tmnLightGrey,
                    fontFamily: 'Jost',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.33,
                  ),
                )
                    : const SizedBox(),
              ],
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 15.w),
              child: SvgPicture.asset(
                'assets/icons/event_arrow.svg',
                height: 10.h,
                width: 6.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
