import 'package:appotype_test_app/domain/entity/user_entity.dart';

class UsersDataEntity {
  final int page;
  final int totalPages;
  final List<UserEntity> users;

  UsersDataEntity(
      {required this.page, required this.totalPages, required this.users});
}
