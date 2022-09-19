import 'package:atm_test/domain/bloc/settings_bloc.dart';
import 'package:atm_test/domain/models/price.dart';
import 'package:atm_test/domain/models/settings.dart';
import 'package:atm_test/presentation/screens/atm_inside_screen/atm_bottom_sheet_body/widgets/custom_checkbox.dart';
import 'package:atm_test/presentation/screens/atm_inside_screen/atm_bottom_sheet_body/widgets/custom_inputs.dart';
import 'package:atm_test/presentation/screens/atm_inside_screen/atm_bottom_sheet_body/widgets/custom_notification.dart';
import 'package:atm_test/presentation/screens/atm_inside_screen/atm_bottom_sheet_body/widgets/master_mode.dart';
import 'package:atm_test/presentation/screens/atm_inside_screen/atm_bottom_sheet_body/widgets/price_lists.dart';
import 'package:atm_test/presentation/styles/color_styles.dart';
import 'package:atm_test/presentation/styles/strings.dart';
import 'package:atm_test/presentation/widgets/custom_button.dart';
import 'package:atm_test/presentation/widgets/custom_error_body.dart';
import 'package:atm_test/presentation/widgets/custom_loading_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class AtmBottomSheetBody extends StatefulWidget {
  const AtmBottomSheetBody({Key? key}) : super(key: key);

  @override
  State<AtmBottomSheetBody> createState() => _AtmBottomSheetBodyState();
}

class _AtmBottomSheetBodyState extends State<AtmBottomSheetBody> {
  final _settingsBloc = GetIt.I<SettingsBloc>();
  final _decimalCashController = TextEditingController();
  final _decimalCashlessController = TextEditingController();
  final _scaleCashController = TextEditingController();
  final _scaleCashlessController = TextEditingController();
  final _priceListController = PriceListController();
  late bool _soundOn;
  late bool _isUsing;
  final _scrollController = ScrollController();

  @override
  void initState() {
    _settingsBloc.add(SettingsBlocLoadEvent());
    super.initState();
  }

  @override
  void dispose() {
    _settingsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: _settingsBloc,
      listener: (context, state) {
        if (state is SettingsBlocReadyState) {
          _decimalCashController.text = state.settings.decimalCash;
          _decimalCashlessController.text = state.settings.decimalCashless;
          _scaleCashController.text = state.settings.scaleCash;
          _scaleCashlessController.text = state.settings.scaleCashless;
          _soundOn = state.settings.soundOn;
          _isUsing = state.settings.isUsing;
          _priceListController.value = state.settings.priceList;
        }
      },
      buildWhen: (context, state) => state is! SettingsBlocSaveResultState,
      builder: (context, state) {
        if (state is SettingsBlocLoadingState) {
          return const CustomLoadingBody();
        } else if (state is SettingsBlocErrorState) {
          return CustomErrorBody(
            onTap: () {
              _settingsBloc.add(SettingsBlocLoadEvent());
            },
          );
        } else if (state is SettingsBlocReadyState) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SizedBox(
              height: 610.h,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        BlocBuilder(
                            bloc: _settingsBloc,
                            builder: (_, state) {
                              if (state is SettingsBlocSaveResultState) {
                                return CustomNotification(
                                  notificationState: state.success,
                                  time: state.time,
                                );
                              } else {
                                return const CustomNotification(
                                  notificationState: ShowNotification.unknown,
                                );
                              }
                            }),
                        CustomInputs(
                          title: Strings.decimalPosition,
                          cashController: _decimalCashController,
                          cashlessController: _decimalCashlessController,
                        ),
                        CustomInputs(
                          title: Strings.scaleFactor,
                          cashController: _scaleCashController,
                          cashlessController: _scaleCashlessController,
                        ),
                        CustomCheckbox(
                          title: Strings.onSound,
                          value: _soundOn,
                          onChange: (value) {
                            setState(() {
                              _soundOn = value;
                            });
                          },
                        ),
                        MasterMode(
                          isUsing: _isUsing,
                          onChange: (value) {
                            setState(() {
                              _isUsing = value;
                            });
                          },
                        ),
                        PriceLists(priceListController: _priceListController),
                        SizedBox(height: 90.h)
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                      width: double.maxFinite,
                      height: 50,
                      backgroundColor: ColorStyles.tmnBlue,
                      text: Strings.saveChanges,
                      textColor: ColorStyles.tmnWhite,
                      onTap: () {
                        _scrollController.animateTo(
                          0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                        _settingsBloc.add(
                          SettingsBlocSaveEvent(
                            settings: Settings(
                              scaleCashless: _scaleCashlessController.text,
                              scaleCash: _scaleCashController.text,
                              decimalCash: _decimalCashController.text,
                              decimalCashless: _decimalCashlessController.text,
                              isUsing: _isUsing,
                              soundOn: _soundOn,
                              priceList: _priceListController.value,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class PriceListController extends ChangeNotifier{
  List<Price> _priceList = [];

  List<Price> get value{
    return _priceList;
  }

  set value (List<Price> value){
    _priceList = value;
    notifyListeners();
  }

}
