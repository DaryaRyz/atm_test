import 'package:atm_test/presentation/styles/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String icon;
  final Color color;
  final VoidCallback onTap;
  final Widget? leading;

  const CustomAppBar({
    Key? key,
    this.leading,
    required this.icon,
    required this.onTap,
    required this.color,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.only(left: 20.w, top: 18.h, bottom: 18.h),
        child: leading,
      ),
      backgroundColor: ColorStyles.tmnUltralightBlue,
      elevation: 0,
      actions: [
        Container(
          width: 35.w,
          height: 35.h,
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 5, right: 20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          child: TextButton(
            onPressed: onTap,
            style: TextButton.styleFrom(
              primary: Colors.black26,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: SvgPicture.asset(
              icon,
              color: color,
              width: 20.w,
              height: 20.h,
            ),
          ),
        ),
      ],
    );
  }
}
