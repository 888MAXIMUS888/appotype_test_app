import 'package:appotype_test_app/core/data_state.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/user_entity.dart';
import '../../../domain/entity/users_data_entity.dart';
import '../../../domain/usercases/fetch_users_usecase.dart';
import '../../../domain/usercases/get_favorite_users_usecase.dart';
import '../../../domain/usercases/set_favorite_users_usecase.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final FetchUsersUseCase _fetchUsersUseCase;
  final SetFavoriteUsersUseCase _setFavoriteUsersUseCase;
  final GetFavoriteUsersUseCase _getFavoriteUsersUseCase;

  UsersBloc(this._fetchUsersUseCase, this._setFavoriteUsersUseCase,
      this._getFavoriteUsersUseCase)
      : super(UsersInitial()) {
    int _page = 0;
    int _totalPages = 0;
    List<UserEntity> _users = [];
    List<String> _favoriteUsers = [];

    on<UsersEvent>((event, emit) async {
      if (event is FetchUsers) {
        if (event.isRefresh) {
          _page = 0;
          _totalPages = 0;
          _users.clear();
        }
        _page++;
        if (_totalPages <= _page) {
          emit(const LoadingUsers());
          final dataState = await _fetchUsersUseCase(params: _page);
          if (dataState is DataSuccess<UsersDataEntity>) {
            _totalPages = dataState.data.totalPages;
            _users.addAll(dataState.data.users);
            emit(ShowUsers(_users, _favoriteUsers));
          } else if (dataState is DataFailed<UsersDataEntity>) {}
        }
      } else if (event is GetFavoriteUsers) {
        List<String> favoriteUsers = await _getFavoriteUsersUseCase();
        _favoriteUsers = favoriteUsers;
      } else if (event is SetFavoriteUsers) {
        await _setFavoriteUsersUseCase(params: event.favoriteUsers);
      }
    });
  }
}
