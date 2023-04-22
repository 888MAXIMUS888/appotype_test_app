import 'package:appotype_test_app/core/data_state.dart';
import '../entity/user_entity.dart';
import '../entity/users_data_entity.dart';

abstract class UsersRepository {
  Future<DataState<UsersDataEntity>> fetchUsers(int page);
}
