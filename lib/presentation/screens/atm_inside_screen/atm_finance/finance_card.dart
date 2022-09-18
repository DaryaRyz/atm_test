import 'package:atm_test/domain/models/finance.dart';
import 'package:atm_test/presentation/styles/color_styles.dart';
import 'package:atm_test/presentation/styles/strings.dart';
import 'package:atm_test/presentation/styles/ui_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FinanceCard extends StatelessWidget {
  final Finance finance;

  const FinanceCard({
    Key? key,
    required this.finance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 153.w,
      height: 72.h,
      padding: EdgeInsets.only(left: 16.w),
      margin: EdgeInsets.only(right: 8.w),
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
        onPressed: () {},
        style: TextButton.styleFrom(
          primary: Colors.black26,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 40.r,
              height: 40.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: ColorStyles.tmnBlue.withOpacity(0.08),
              ),
              child: Center(
                child: SvgPicture.asset(
                  finance.type == CashType.cash
                      ? 'assets/icons/cash_icon.svg'
                      : 'assets/icons/cashback_icon.svg',
                  width: 25.w,
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UiUtil.fromCash(finance.cash),
                Text(
                  finance.type == CashType.cash
                      ? Strings.atmFinanceCash
                      : Strings.atmFinanceCashBack,
                  style: TextStyle(
                    color: ColorStyles.tmnDarkBlue,
                    fontFamily: 'Jost',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
