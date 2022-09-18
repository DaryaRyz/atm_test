import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

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