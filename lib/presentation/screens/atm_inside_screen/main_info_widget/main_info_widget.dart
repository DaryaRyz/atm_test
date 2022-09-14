import 'package:atm_test/domain/models/atm_model.dart';
import 'package:atm_test/presentation/styles/color_styles.dart';
import 'package:atm_test/presentation/styles/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AtmMainInfoWidget extends StatelessWidget {
  final AtmModel atm;

  const AtmMainInfoWidget({
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
                    _AtmStatus(isWorking: atm.isWorking),
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
                    _AtmInfoWidget(
                      title: Strings.atmBusTypeTitle,
                      value: atm.busType,
                    ),
                    _AtmInfoWidget(
                      title: Strings.atmSignalLevelTitle,
                      value: atm.signalLevel,
                    ),
                    _AtmInfoWidget(
                      title: Strings.atmIdTitle,
                      value: atm.id,
                    ),
                    _AtmInfoWidget(
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

class _AtmInfoWidget extends StatelessWidget {
  final String title;
  final String value;

  const _AtmInfoWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: ColorStyles.tmnDarkBlue,
              fontFamily: 'Roboto',
              fontSize: 14.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            value,
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

class _AtmStatus extends StatelessWidget {
  final bool isWorking;

  const _AtmStatus({
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
