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

  static fromCash(int sum) {
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

  static fromSuccessSaveTime(DateTime time) {
    String result = 'Изменения от ';
    result += time.day < 10 ? '0${time.day}.' : '${time.day}.';
    result += time.month < 10 ? '0${time.month}.' : '${time.month}.';
    result += '${time.year}, ';
    result += time.hour < 10 ? '0${time.hour}:' : '${time.hour}:';
    result += time.minute < 10 ? '0${time.minute}' : '${time.minute}';
    result += '\nприменены успешно';
    return result;
  }
}
