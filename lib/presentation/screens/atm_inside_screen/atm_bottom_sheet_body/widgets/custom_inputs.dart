import 'package:atm_test/presentation/styles/color_styles.dart';
import 'package:atm_test/presentation/styles/strings.dart';
import 'package:atm_test/presentation/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInputs extends StatelessWidget {
  final String title;
  final TextEditingController cashController;
  final TextEditingController cashlessController;

  const CustomInputs({
    Key? key,
    required this.title,
    required this.cashController,
    required this.cashlessController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: ColorStyles.tmnDarkBlue,
                fontFamily: 'Roboto',
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextField(
                  hintText: Strings.leftInputHintText,
                  controller: cashController,
                ),
                CustomTextField(
                  hintText: Strings.rightInputHintText,
                  controller: cashlessController,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
