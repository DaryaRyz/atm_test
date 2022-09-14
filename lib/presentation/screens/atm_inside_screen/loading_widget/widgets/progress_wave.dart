import 'package:atm_test/presentation/styles/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

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

class Wave extends StatelessWidget {
  final Color color;
  final Duration duration;
  final double progress;


  const Wave({
    Key? key,
    required this.color,
    required this.duration,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WaveWidget(
      config: CustomConfig(
        colors: [progress == 0 ? Colors.transparent : color],
        heightPercentages: [-0.15],
        durations: [duration.inMilliseconds],
      ),
      size: const Size(
        double.infinity,
        double.infinity,
      ),
      waveAmplitude: 0,
    );
  }
}
