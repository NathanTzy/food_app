part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

final class UserLoaded extends UserState {
  final User user;

  UserLoaded(this.user);
  @override
  List<Object> get props => [User];
}

final class FailedUserLoaded extends UserState {
  final String message;

  FailedUserLoaded(this.message);

  @override
  List<Object> get props => [message];
}
