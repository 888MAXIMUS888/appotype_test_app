part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}

class ShowUsers extends UsersState {
  final List<UserEntity> users;
  final List<String> favoriteUsers;

  const ShowUsers(this.users, this.favoriteUsers);

  @override
  List<Object> get props => [users, favoriteUsers];
}

class LoadingUsers extends UsersState {
  const LoadingUsers();
}
