import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'internet_event.dart';
import 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  Connectivity connectivity = Connectivity();
  StreamSubscription? connectivitySubcrip;

  InternetBloc() : super(InternetInitial()) {
    on<InternetLostEvent>((event, emit) {
      emit(InternetLostState());
    });

    on<InternetGainedEvent>((event, emit) {
      emit(InternetGainedState());
    });
    connectivitySubcrip = connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }
  @override
  Future<void> close() {
    connectivitySubcrip?.cancel();
    return super.close();
  }
}
