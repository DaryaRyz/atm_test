import 'package:atm_test/domain/models/atm.dart';
import 'package:atm_test/presentation/screens/atm_inside_screen/atm_main_info/widgets/atm_info_line.dart';
import 'package:atm_test/presentation/screens/atm_inside_screen/atm_main_info/widgets/atm_status.dart';
import 'package:atm_test/presentation/styles/color_styles.dart';
import 'package:atm_test/presentation/styles/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AtmMainInfo extends StatelessWidget {
  final Atm atm;

  const AtmMainInfo({
    Key? key,
    required this.atm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.atmInsideTitle,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        Container(
          width: double.maxFinite,
          margin: EdgeInsets.symmetric(vertical: 24.h),
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
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 16.w,
                  top: 8.h,
                  right: 8.w,
                  bottom: 15.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        atm.type,
                        style: TextStyle(
                          color: ColorStyles.tmnMidGrey,
                          fontFamily: 'Roboto',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Text(
                      atm.atmNumber,
                      style: TextStyle(
                        color: ColorStyles.tmnDarkBlue,
                        fontFamily: 'Roboto',
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    AtmStatus(isWorking: atm.isWorking),
                    Text(
                      atm.location,
                      style: TextStyle(
                        color: ColorStyles.tmnMidGrey,
                        fontFamily: 'Roboto',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 1,
                color: ColorStyles.tmnUltralightBlue,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 12.h,
                ),
                child: Column(
                  children: [
                    AtmInfoLine(
                      title: Strings.atmBusTypeTitle,
                      value: atm.busType,
                    ),
                    AtmInfoLine(
                      title: Strings.atmSignalLevelTitle,
                      value: atm.signalLevel,
                    ),
                    AtmInfoLine(
                      title: Strings.atmIdTitle,
                      value: atm.id,
                    ),
                    AtmInfoLine(
                      title: Strings.atmModemTitle,
                      value: atm.modem,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


