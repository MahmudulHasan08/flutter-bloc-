import 'package:equatable/equatable.dart';
import 'package:internetconnectivityusingbloc/repos/user_model.dart';

abstract class UserState extends Equatable {}

class UserLoadingState extends UserState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserLoadedState extends UserState {
  final List<UserModel> users;

  UserLoadedState(this.users);

  @override
  // TODO: implement props
  List<Object?> get props => [users];
}

class UserErrorState extends UserState {
  String error;

  UserErrorState(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
