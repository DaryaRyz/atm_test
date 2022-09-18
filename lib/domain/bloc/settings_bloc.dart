import 'dart:async';

import 'package:atm_test/data/repository/storage_repository.dart';
import 'package:atm_test/domain/models/price.dart';
import 'package:atm_test/domain/models/settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class SettingsBloc extends Bloc<SettingsBlocEvent, SettingsBlocState> {
  final StorageRepository repository;

  SettingsBloc({required this.repository}) : super(SettingsBlocLoadingState()) {
    on<SettingsBlocLoadEvent>(_loadHandler);
    on<SettingsBlocSaveEvent>(_saveHandler);
    on<SettingsBlocPriceListChangeEvent>(_priceListChangeHandler);
  }

  List<Price> priceList = [];

  Future<void> _loadHandler(SettingsBlocLoadEvent event, emit) async {
    emit(SettingsBlocLoadingState());
    try {
      final result = await repository.loadSettings();
      priceList = result.priceList;
      emit(SettingsBlocReadyState(settings: result));
    } catch (error) {
      Logger().e(error);
      emit(SettingsBlocErrorState());
    }
  }

  Future<void> _saveHandler(SettingsBlocSaveEvent event, emit) async {
    emit(SettingsBlocSaveResultState(success: ShowNotification.unknown));
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      await repository.saveSettings(
        settings: Settings(
          decimalCashless: event.settings.decimalCashless,
          decimalCash: event.settings.decimalCash,
          scaleCashless: event.settings.scaleCashless,
          scaleCash: event.settings.scaleCash,
          soundOn: event.settings.soundOn,
          isUsing: event.settings.isUsing,
          priceList: priceList,
        ),
      );
      emit(SettingsBlocSaveResultState(
        time: DateTime.now(),
        success: ShowNotification.positive,
      ));
    } catch (error) {
      Logger().e(error);
      emit(SettingsBlocSaveResultState(success: ShowNotification.negative));
    }
  }

  void _priceListChangeHandler(SettingsBlocPriceListChangeEvent event, emit) {
    priceList = event.priceList;
  }
}

abstract class SettingsBlocEvent {}

class SettingsBlocLoadEvent extends SettingsBlocEvent {}
class SettingsBlocPriceListChangeEvent extends SettingsBlocEvent{
  final List<Price> priceList;

  SettingsBlocPriceListChangeEvent({required this.priceList});
}
class SettingsBlocSaveEvent extends SettingsBlocEvent {
  final Settings settings;

  SettingsBlocSaveEvent({required this.settings});
}

abstract class SettingsBlocState {}
class SettingsBlocLoadingState extends SettingsBlocState {}
class SettingsBlocReadyState extends SettingsBlocState {
  final Settings settings;

  SettingsBlocReadyState({required this.settings});
}
class SettingsBlocSaveResultState extends SettingsBlocState {
  final DateTime? time;
  final ShowNotification success;

  SettingsBlocSaveResultState({
    this.time,
    required this.success,
  });
}
class SettingsBlocErrorState extends SettingsBlocState {}
