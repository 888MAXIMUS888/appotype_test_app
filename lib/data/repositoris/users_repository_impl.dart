import 'dart:convert';
import 'package:appotype_test_app/domain/entity/user_entity.dart';
import 'package:appotype_test_app/core/data_state.dart';
import '../../domain/entity/users_data_entity.dart';
import '../../domain/repositories/users_repository.dart';
import 'package:http/http.dart' as http;

import '../models/users_response.dart';

class UsersRepositoryImpl extends UsersRepository {
  @override
  Future<DataState<UsersDataEntity>> fetchUsers(int page) async {
    var url = Uri.parse('https://reqres.in/api/users?page=$page&per_page=10');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = UsersResponse.fromJson(jsonDecode(response.body));
      return DataSuccess(UsersMapper.listFromApi(jsonResponse));
    } else {
      return DataFailed(response.statusCode.toString());
    }
  }
}

class UsersMapper {
  static UsersDataEntity listFromApi(UsersResponse usersResponse) {
    return UsersDataEntity(
        page: usersResponse.page,
        totalPages: usersResponse.totalPage,
        users: (usersResponse.users)
            .map((e) => UserEntity(
                id: e.id,
                email: e.email,
                firstName: e.firstName,
                lastName: e.lastName,
                avatar: e.avatar))
            .toList());
  }
}
