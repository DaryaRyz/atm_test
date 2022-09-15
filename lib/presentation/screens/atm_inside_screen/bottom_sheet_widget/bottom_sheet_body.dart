import 'package:atm_test/presentation/screens/atm_inside_screen/bottom_sheet_widget/widgets/custom_checkbox.dart';
import 'package:atm_test/presentation/screens/atm_inside_screen/bottom_sheet_widget/widgets/custom_inputs.dart';
import 'package:atm_test/presentation/screens/atm_inside_screen/bottom_sheet_widget/widgets/custom_notification.dart';
import 'package:atm_test/presentation/screens/atm_inside_screen/bottom_sheet_widget/widgets/master_mode.dart';
import 'package:atm_test/presentation/screens/atm_inside_screen/bottom_sheet_widget/widgets/price_lists.dart';
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
  final _decimalPositionCashController = TextEditingController();
  final _decimalPositionCashlessController = TextEditingController();
  final _scaleFactorCashController = TextEditingController();
  final _scaleFactorCashlessController = TextEditingController();
  bool _soundOn = true;
  bool _isUsing = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SizedBox(
        height: 635.h,
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const CustomNotification(),
                  CustomInputs(
                    title: Strings.decimalPosition,
                    cashController: _decimalPositionCashController,
                    cashlessController: _decimalPositionCashlessController,
                  ),
                  CustomInputs(
                    title: Strings.scaleFactor,
                    cashController: _scaleFactorCashController,
                    cashlessController: _scaleFactorCashlessController,
                  ),
                  CustomCheckbox(
                    title: Strings.onSound,
                    value: _soundOn,
                    onChange: (value) {
                      setState(() {
                        _soundOn = value;
                      });
                    },
                  ),
                  MasterMode(
                    isUsing: _isUsing,
                    onChange: (value) {
                      setState(() {
                        _isUsing = value;
                      });
                    },
                  ),
                  const PriceLists(),
                  SizedBox(height: 90.h)
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
      ),
    );
  }
}
