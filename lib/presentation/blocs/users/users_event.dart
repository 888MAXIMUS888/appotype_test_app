part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}

class FetchUsers extends UsersEvent {
  final bool isRefresh;
  const FetchUsers({this.isRefresh = false});

  @override
  List<Object> get props => [isRefresh];
}

class GetFavoriteUsers extends UsersEvent {
  const GetFavoriteUsers();
}

class SetFavoriteUsers extends UsersEvent {
  final List<String> favoriteUsers;
  const SetFavoriteUsers(this.favoriteUsers);

  @override
  List<Object> get props => [favoriteUsers];
}
