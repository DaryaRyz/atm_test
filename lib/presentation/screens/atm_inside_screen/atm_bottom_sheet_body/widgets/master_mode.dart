import 'package:atm_test/presentation/styles/color_styles.dart';
import 'package:atm_test/presentation/styles/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MasterMode extends StatefulWidget {
  final bool isUsing;
  final Function(bool) onChange;

  const MasterMode({
    Key? key,
    required this.isUsing,
    required this.onChange,
  }) : super(key: key);

  @override
  State<MasterMode> createState() => _MasterModeState();
}

class _MasterModeState extends State<MasterMode> {
  late bool _isUsing;

  @override
  void initState() {
    _isUsing = widget.isUsing;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.masterMode,
            style: TextStyle(
              color: ColorStyles.tmnDarkBlue,
              fontFamily: 'Roboto',
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            width: double.maxFinite,
            height: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: ColorStyles.tmnBlue),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isUsing = true;
                      });
                      widget.onChange(_isUsing);
                    },
                    child: Container(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(7),
                        ),
                        color: _isUsing
                            ? ColorStyles.tmnBlue
                            : ColorStyles.tmnWhite,
                      ),
                      child: Center(
                        child: Text(
                          Strings.usageMode,
                          style: TextStyle(
                            color: _isUsing
                                ? ColorStyles.tmnWhite
                                : ColorStyles.tmnBlue,
                            fontFamily: 'Jost',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isUsing = false;
                      });
                      widget.onChange(_isUsing);
                    },
                    child: Container(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(7),
                        ),
                        color: _isUsing
                            ? ColorStyles.tmnWhite
                            : ColorStyles.tmnBlue,
                      ),
                      child: Center(
                        child: Text(
                          Strings.nonUsageMode,
                          style: TextStyle(
                            color: _isUsing
                                ? ColorStyles.tmnBlue
                                : ColorStyles.tmnWhite,
                            fontFamily: 'Jost',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
