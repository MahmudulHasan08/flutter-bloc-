import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internetconnectivityusingbloc/repos/repositories.dart';

import 'apievent.dart';
import 'apistate.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepositories _userRepositories;
  UserBloc(this._userRepositories) : super(UserLoadingState()) {
    on<UserLoadingEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final users = await _userRepositories.getUsers();
        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
        print("something goes wrong");
      }
    });
  }
}
