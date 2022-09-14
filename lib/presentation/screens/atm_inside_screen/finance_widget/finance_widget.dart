import 'package:atm_test/domain/models/finance_model.dart';
import 'package:atm_test/presentation/screens/atm_inside_screen/finance_widget/widgets/finance_card.dart';
import 'package:atm_test/presentation/styles/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinanceWidget extends StatelessWidget {
  final List<FinanceModel> financeList;

  const FinanceWidget({
    Key? key,
    required this.financeList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            Strings.atmFinanceTitle,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 14.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              for (var element in financeList) FinanceCard(finance: element),
            ],
          ),
        ),
      ],
    );
  }
}
