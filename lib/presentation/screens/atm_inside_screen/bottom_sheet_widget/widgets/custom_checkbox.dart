import 'package:atm_test/presentation/styles/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckbox extends StatefulWidget {
  final String title;
  final bool value;
  final Function(bool) onChange;

  const CustomCheckbox({
    Key? key,
    required this.title,
    required this.value,
    required this.onChange,
  }) : super(key: key);

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool isChecked;

  @override
  void initState() {
    isChecked = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Transform.scale(
            scale: 1.1,
            child: Checkbox(
              value: isChecked,
              activeColor: ColorStyles.tmnWhite,
              checkColor: ColorStyles.tmnDarkBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              side: MaterialStateBorderSide.resolveWith(
                (states) => const BorderSide(
                  width: 1.0,
                  color: ColorStyles.tmnLightBlue,
                ),
              ),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onChanged: (bool? value) {
                widget.onChange(value!);
                setState(() {
                  isChecked = value;
                });
              },
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Text(
          widget.title,
          style: TextStyle(
            color: ColorStyles.tmnDarkBlue,
            fontFamily: 'Roboto',
            fontSize: 16.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
