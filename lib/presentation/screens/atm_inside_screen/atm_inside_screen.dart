import 'package:atm_test/presentation/screens/widgets/custom_app_bar.dart';
import 'package:atm_test/presentation/styles/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AtmInsideScreen extends StatefulWidget {
  const AtmInsideScreen({Key? key}) : super(key: key);

  @override
  State<AtmInsideScreen> createState() => _AtmInsideScreenState();
}

class _AtmInsideScreenState extends State<AtmInsideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: Icon(
          Icons.arrow_back,
          color: ColorStyles.tmnDarkBlue,
          size: 25.r,
        ),
        icon: 'assets/icons/settings_icon.svg',
        color: ColorStyles.tmnDarkBlue,
        onTap: () {},
      ),
      backgroundColor: ColorStyles.tmnUltralightBlue,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: _AtmInsideBody(),
      ),
    );
  }
}

class _AtmInsideBody extends StatelessWidget {
  const _AtmInsideBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [],
          ),
        ),
      ],
    );
  }
}
