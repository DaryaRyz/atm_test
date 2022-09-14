import 'package:atm_test/presentation/styles/color_styles.dart';
import 'package:flutter/material.dart';

class CustomLoadingBody extends StatelessWidget {
  const CustomLoadingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorStyles.tmnDarkBlue,
      ),
    );
  }
}
