import 'dart:async';

import 'package:atm_test/data/repository/atm_repository.dart';
import 'package:atm_test/domain/models/atm_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class AtmBloc extends Bloc<AtmBlocEvent, AtmBlocState> {
  final AtmRepository repository;

  AtmBloc({required this.repository}) : super(AtmBlocLoadingState()) {
    on<AtmBlocLoadEvent>(_loadHandler);
  }

  FutureOr<void> _loadHandler(AtmBlocLoadEvent event, emit) async {
    emit(AtmBlocLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    try {
      final atm = await repository.getAtm();
      emit(AtmBlocReadyState(atm: atm));
    } catch (error) {
      Logger().e(error);
      emit(AtmBlocErrorState());
    }
  }
}

abstract class AtmBlocEvent {}

class AtmBlocLoadEvent extends AtmBlocEvent {}

abstract class AtmBlocState {}

class AtmBlocLoadingState extends AtmBlocState {}

class AtmBlocReadyState extends AtmBlocState {
  final AtmModel atm;

  AtmBlocReadyState({required this.atm});
}

class AtmBlocErrorState extends AtmBlocState {}
