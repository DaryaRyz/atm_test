import 'dart:async';

import 'package:atm_test/presentation/screens/atm_inside_screen/loading_widget/widgets/progress_wave.dart';
import 'package:atm_test/presentation/screens/widgets/custom_button.dart';
import 'package:atm_test/presentation/styles/color_styles.dart';
import 'package:atm_test/presentation/styles/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingWidget extends StatefulWidget {
  final double fullnessLevel;

  const LoadingWidget({
    Key? key,
    required this.fullnessLevel,
  }) : super(key: key);

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  double _progress = 0;

  @override
  void initState() {
    _updateProgress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Container(
            width: 160.w,
            height: 160.h,
            color: ColorStyles.tmnWhite,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ProgressWave(
                    progress: _progress,
                    color: ColorStyles.tmnBlue.withOpacity(0.48),
                  ),
                ),
                _AnimatedCount(progress: _progress),
              ],
            ),
          ),
        ),
        Column(
          children: [
            CustomButton(
              backgroundColor: Colors.transparent,
              onTap: () {},
              text: Strings.atmLoadingTitle,
            ),
            SizedBox(height: 16.h),
            CustomButton(
              backgroundColor: Colors.transparent,
              onTap: () {},
              text: Strings.atmInventoryTitle,
            ),
          ],
        ),
      ],
    );
  }

  void _updateProgress() {
    const duration = Duration(milliseconds: 30);
    Timer.periodic(duration, (Timer t) {
      if (_progress >= widget.fullnessLevel / 100) {
        t.cancel();
        return;
      }
      if (!mounted) return;
      setState(() {
        _progress += 0.01;
      });
    });
  }
}

class _AnimatedCount extends StatelessWidget {
  final double progress;

  const _AnimatedCount({
    Key? key,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${(progress * 100).toStringAsFixed(0)}%',
            style: TextStyle(
              color: ColorStyles.tmnDarkBlue,
              fontFamily: 'Jost',
              fontSize: 40.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          Align(
            child: Text(
              Strings.atmCurrentLoadingLevelTitle,
              style: TextStyle(
                color: ColorStyles.tmnDarkBlue,
                fontFamily: 'Jost',
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                height: 1.14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
