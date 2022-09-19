
import 'package:atm_test/application.dart';
import 'package:atm_test/data/repository/atm_repository.dart';
import 'package:atm_test/data/repository/storage_repository.dart';
import 'package:atm_test/data/storage_util.dart';
import 'package:atm_test/domain/bloc/atm_bloc.dart';
import 'package:atm_test/domain/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  _registerDependencies();
  runApp(const Application());
}

void _registerDependencies(){
  GetIt.I.registerSingleton<StorageUtil>(StorageUtil());

  GetIt.I.registerSingleton<AtmRepository>(MockAtmRepository());
  GetIt.I.registerSingleton<StorageRepository>(StorageDataRepository(storage: GetIt.I<StorageUtil>()));

  GetIt.I.registerFactory<AtmBloc>(() => AtmBloc(repository: GetIt.I<AtmRepository>()));
  GetIt.I.registerFactory<SettingsBloc>(() => SettingsBloc(repository: GetIt.I<StorageRepository>()));
}