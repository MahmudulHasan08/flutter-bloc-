import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:internetconnectivityusingbloc/bloc/counterbloc/event.dart';
import 'package:internetconnectivityusingbloc/bloc/counterbloc/state.dart';

// class CounterBloc extends Bloc<CounterEvent, CounterState> {
//   CounterBloc() : super(CounterState(counter: 0));

//   // @override
// Stream<CounterState> mapEventToState(CounterEvent event) async* {
//   if (state is IncrementEvent) {
//     yield CounterState(counter: state.counter + 1);
//   } else if (state is DecrementEvent) {
//     yield CounterState(counter: state.counter - 1);
//   }
// }
//}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counter: 0)) {
    on<IncrementEvent>((event, emit) {
      emit(CounterState(counter: state.counter + 1));
      // TODO: implement event handler
    });
    on<DecrementEvent>((event, emit) {
      emit(CounterState(counter: state.counter - 1));
      // TODO: implement event handler
    });
  }
}
