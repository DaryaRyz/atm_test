import 'package:atm_test/presentation/screens/atm_inside_screen/bottom_sheet_widget/widgets/custom_checkbox.dart';
import 'package:atm_test/presentation/screens/atm_inside_screen/bottom_sheet_widget/widgets/custom_inputs.dart';
import 'package:atm_test/presentation/screens/atm_inside_screen/bottom_sheet_widget/widgets/custom_notification.dart';
import 'package:atm_test/presentation/styles/color_styles.dart';
import 'package:atm_test/presentation/styles/strings.dart';
import 'package:atm_test/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetBody extends StatefulWidget {
  const BottomSheetBody({Key? key}) : super(key: key);

  @override
  State<BottomSheetBody> createState() => _BottomSheetBodyState();
}

class _BottomSheetBodyState extends State<BottomSheetBody> {
  bool _soundOn = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 635.h,
      child: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const CustomNotification(),
                const CustomInputs(title: Strings.decimalPosition),
                const CustomInputs(title: Strings.scaleFactor),
                CustomCheckbox(
                  title: Strings.onSound,
                  value: _soundOn,
                  onChange: (value) {
                    setState(() {
                      _soundOn = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomButton(
              width: double.maxFinite,
              height: 56.h,
              backgroundColor: ColorStyles.tmnBlue,
              onTap: () {},
              text: Strings.saveChanges,
              textColor: ColorStyles.tmnWhite,
            ),
          ),
        ],
      ),
    );
  }
}
