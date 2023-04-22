import 'package:appotype_test_app/domain/repositories/users_repository.dart';
import 'package:appotype_test_app/domain/usercases/usercase.dart';

import '../../core/data_state.dart';
import '../entity/users_data_entity.dart';

class FetchUsersUseCase implements UseCase<DataState<UsersDataEntity>, int> {
  final UsersRepository _userRepository;

  FetchUsersUseCase(this._userRepository);

  @override
  Future<DataState<UsersDataEntity>> call({required int params}) async {
    return await _userRepository.fetchUsers(params);
  }
}
