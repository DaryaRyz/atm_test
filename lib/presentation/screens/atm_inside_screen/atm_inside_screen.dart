import 'package:atm_test/domain/bloc/atm_bloc.dart';
import 'package:atm_test/domain/models/atm.dart';
import 'package:atm_test/presentation/screens/atm_inside_screen/atm_bottom_sheet_body/atm_bottom_sheet_body.dart';
import 'package:atm_test/presentation/screens/atm_inside_screen/atm_events/atm_events.dart';
import 'package:atm_test/presentation/screens/atm_inside_screen/atm_finance/atm_finance.dart';
import 'package:atm_test/presentation/screens/atm_inside_screen/atm_loading/atm_loading.dart';
import 'package:atm_test/presentation/styles/color_styles.dart';
import 'package:atm_test/presentation/widgets/custom_app_bar.dart';
import 'package:atm_test/presentation/widgets/custom_bottom_sheet.dart';
import 'package:atm_test/presentation/widgets/custom_error_body.dart';
import 'package:atm_test/presentation/widgets/custom_loading_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import 'atm_main_info/atm_main_info.dart';

class AtmInsideScreen extends StatefulWidget {
  const AtmInsideScreen({Key? key}) : super(key: key);

  @override
  State<AtmInsideScreen> createState() => _AtmInsideScreenState();
}

class _AtmInsideScreenState extends State<AtmInsideScreen> {
  final _atmBloc = GetIt.I<AtmBloc>();

  @override
  void initState() {
    _atmBloc.add(AtmBlocLoadEvent());
    super.initState();
  }

  @override
  void dispose() {
    _atmBloc.close();
    super.dispose();
  }

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
        onTap: () {
          CustomBottomSheet.dialog(
            context: context,
            title: 'Загрузка',
            body: const AtmBottomSheetBody(),
          );
        },
      ),
      backgroundColor: ColorStyles.tmnUltralightBlue,
      body: BlocBuilder(
        bloc: _atmBloc,
        builder: (context, state) {
          if (state is AtmBlocLoadingState) {
            return const CustomLoadingBody();
          } else if (state is AtmBlocErrorState) {
            return CustomErrorBody(
              onTap: () {
                _atmBloc.add(AtmBlocLoadEvent());
              },
            );
          } else if (state is AtmBlocReadyState) {
            return _AtmInsideBody(atm: state.atm);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class _AtmInsideBody extends StatelessWidget {
  final Atm atm;

  const _AtmInsideBody({
    Key? key,
    required this.atm,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AtmMainInfo(atm: atm),
                AtmLoading(fullnessLevel: atm.fullnessLevel),
                AtmEvents(eventList: atm.eventList),
              ],
            ),
          ),
          AtmFinance(financeList: atm.financeList),
        ],
      ),
    );
  }
}
