import 'package:atm_test/presentation/styles/color_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class UiUtil {
  static fromTime(DateTime time) {
    String result = '';
    result += '${time.hour}:';
    result += time.minute == 0 ? '00' : time.minute.toString();
    return result;
  }

  static fromCash(int sum){
    return RichText(
      text: TextSpan(
        text: '$sum ',
        style: TextStyle(
          color: ColorStyles.tmnDarkBlue,
          fontFamily: 'Jost',
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        children: const [
          TextSpan(
            text: 'P',
            style: TextStyle(decoration: TextDecoration.lineThrough),
          ),
        ],
      ),
    );
  }
}
