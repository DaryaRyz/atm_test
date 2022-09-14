import 'package:atm_test/data/repository/atm_repository.dart';
import 'package:atm_test/domain/bloc/atm_bloc.dart';
import 'package:atm_test/domain/models/atm_model.dart';
import 'package:atm_test/presentation/screens/atm_inside_screen/bottom_sheet_widget/bottom_sheet_body.dart';
import 'package:atm_test/presentation/screens/atm_inside_screen/events_widget/events_widget.dart';
import 'package:atm_test/presentation/screens/atm_inside_screen/finance_widget/finance_widget.dart';
import 'package:atm_test/presentation/screens/atm_inside_screen/loading_widget/loading_widget.dart';
import 'package:atm_test/presentation/screens/atm_inside_screen/main_info_widget/main_info_widget.dart';
import 'package:atm_test/presentation/styles/color_styles.dart';
import 'package:atm_test/presentation/widgets/custom_app_bar.dart';
import 'package:atm_test/presentation/widgets/custom_bottom_sheet.dart';
import 'package:atm_test/presentation/widgets/custom_error_body.dart';
import 'package:atm_test/presentation/widgets/custom_loading_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AtmInsideScreen extends StatefulWidget {
  const AtmInsideScreen({Key? key}) : super(key: key);

  @override
  State<AtmInsideScreen> createState() => _AtmInsideScreenState();
}

class _AtmInsideScreenState extends State<AtmInsideScreen> {
  final _atmBloc = AtmBloc(repository: MockAtmRepository());

  @override
  void initState() {
    _atmBloc.add(AtmBlocLoadEvent());
    super.initState();
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
            body: const BottomSheetBody(),
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
  final AtmModel atm;

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
                AtmMainInfoWidget(atm: atm),
                LoadingWidget(fullnessLevel: atm.fullnessLevel),
                EventsWidget(eventList: atm.eventList),
              ],
            ),
          ),
          FinanceWidget(financeList: atm.financeList),
        ],
      ),
    );
  }
}
