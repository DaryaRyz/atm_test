import 'dart:async';

import 'package:atm_test/data/repository/storage_repository.dart';
import 'package:atm_test/domain/models/settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class SettingsBloc extends Bloc<SettingsBlocEvent, SettingsBlocState> {
  final StorageRepository repository;

  SettingsBloc({required this.repository}) : super(SettingsBlocLoadingState()) {
    on<SettingsBlocLoadEvent>(_loadHandler);
    on<SettingsBlocSaveEvent>(_saveHandler);
  }

  Future<void> _loadHandler(SettingsBlocLoadEvent event, emit) async {
    emit(SettingsBlocLoadingState());
    try {
      final result = await repository.loadSettings();
      emit(SettingsBlocReadyState(settings: result));
    } catch (error) {
      Logger().e(error);
      emit(SettingsBlocErrorState());
    }
  }

  Future<void> _saveHandler(SettingsBlocSaveEvent event, emit) async {
    await repository.saveSettings(settings: event.settings);
  }
}

abstract class SettingsBlocEvent {}

class SettingsBlocLoadEvent implements SettingsBlocEvent {}

class SettingsBlocSaveEvent implements SettingsBlocEvent {
  final Settings settings;

  SettingsBlocSaveEvent({required this.settings});
}

abstract class SettingsBlocState {}

class SettingsBlocLoadingState implements SettingsBlocState {}

class SettingsBlocReadyState implements SettingsBlocState {
  final Settings settings;

  SettingsBlocReadyState({required this.settings});
}

class SettingsBlocErrorState implements SettingsBlocState {}
