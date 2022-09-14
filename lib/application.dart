
import 'package:atm_test/presentation/screens/atm_inside_screen/atm_inside_screen.dart';
import 'package:atm_test/presentation/styles/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: ColorStyles.tmnDarkBlue,
          backgroundColor: ColorStyles.tmnUltralightBlue,
        ),
        home:  const AtmInsideScreen(),
      ),
    );
  }
}