import 'dart:async';
import 'package:atm_test/presentation/screens/atm_inside_screen/atm_loading/widgets/atm_count.dart';
import 'package:atm_test/presentation/screens/atm_inside_screen/atm_loading/widgets/progress_wave.dart';
import 'package:atm_test/presentation/styles/color_styles.dart';
import 'package:atm_test/presentation/styles/strings.dart';
import 'package:atm_test/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

class AtmLoading extends StatefulWidget {
  final double fullnessLevel;

  const AtmLoading({
    Key? key,
    required this.fullnessLevel,
  }) : super(key: key);

  @override
  State<AtmLoading> createState() => _AtmLoadingState();
}

class _AtmLoadingState extends State<AtmLoading> {
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
                AnimatedCount(progress: _progress),
              ],
            ),
          ),
        ),
        Column(
          children: [
            CustomButton(
              backgroundColor: Colors.transparent,
              onTap: () {
                Logger().i('Pressing the button "Loading"');
              },
              text: Strings.atmLoadingTitle,
            ),
            SizedBox(height: 16.h),
            CustomButton(
              backgroundColor: Colors.transparent,
              onTap: () {
                Logger().i('Pressing the button "Inventory"');
              },
              text: Strings.atmInventoryTitle,
            ),
          ],
        ),
      ],
    );
  }

  void _updateProgress() {
    const percentageConverter = 100;
    const loadingStep = 0.01;
    const duration = Duration(milliseconds: 30);
    Timer.periodic(duration, (Timer t) {
      if (_progress >= widget.fullnessLevel / percentageConverter) {
        t.cancel();
        return;
      }
      if (!mounted) return;
      setState(() {
        _progress += loadingStep;
      });
    });
  }
}

