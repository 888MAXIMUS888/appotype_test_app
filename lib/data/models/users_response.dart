class UsersResponse {
  static const String _fieldPage = 'page';
  static const String _fieldTotalPage = 'total_pages';
  static const String _fieldTotalUsers = 'data';

  final int page;
  final int totalPage;
  final List<UserResponse> users;

  const UsersResponse(
      {required this.page, required this.totalPage, required this.users});

  factory UsersResponse.fromJson(Map<String, dynamic> json) {
    return UsersResponse(
        page: json[_fieldPage],
        totalPage: json[_fieldTotalPage],
        users: (json[_fieldTotalUsers] as List)
            .map((e) => UserResponse.fromJson(e))
            .toList());
  }
}

class UserResponse {
  static const String _fieldId = 'id';
  static const String _fieldEmail = 'email';
  static const String _fieldFirstName = 'first_name';
  static const String _fieldLastName = 'last_name';
  static const String _fieldAvatar = 'avatar';

  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  const UserResponse(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.avatar});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
        id: json[_fieldId],
        email: json[_fieldEmail],
        firstName: json[_fieldFirstName],
        lastName: json[_fieldLastName],
        avatar: json[_fieldAvatar]);
  }
}
