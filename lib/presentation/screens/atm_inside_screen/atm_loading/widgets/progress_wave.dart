import 'package:atm_test/presentation/screens/atm_inside_screen/atm_loading/widgets/wave.dart';
import 'package:atm_test/presentation/styles/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressWave extends StatelessWidget {
  final double progress;
  final Color color;
  final Duration duration;

  const ProgressWave({
    Key? key,
    required this.progress,
    required this.color,
    this.duration = const Duration(seconds: 20),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: progress * 160.h,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
      decoration: const BoxDecoration(
        color: ColorStyles.tmnWhite,
        boxShadow: [
          BoxShadow(
            color: ColorStyles.atmShadow,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Wave(
        color: color,
        duration: duration,
        progress: progress,
      ),
    );
  }

}

