import 'package:atm_test/presentation/styles/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class CustomBottomSheet {
  static dialog({
    required BuildContext context,
    required String title,
    required Widget body,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (dialogContext) => SizedBox(
        height: 720.h,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 16.h,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: ColorStyles.tmnDarkBlue,
                      fontFamily: 'Roboto',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(dialogContext);
                    },
                    icon: Icon(
                      Icons.close,
                      size: 25.r,
                      color: ColorStyles.tmnDarkBlue,
                    ),
                  ),
                ],
              ),
              body
            ],
          ),
        ),
      ),
    );
  }
}
