import 'package:appotype_test_app/app_routes.dart';
import 'package:appotype_test_app/presentation/views/widgets/full_name.dart';
import 'package:appotype_test_app/presentation/views/widgets/main_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/user_entity.dart';
import '../blocs/users/users_bloc.dart';

class UsersView extends StatefulWidget {
  const UsersView({super.key});

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  final ScrollController _scrollController = ScrollController();
  List<UserEntity> _users = [];
  List<String> _favoriteUsers = [];
  bool _isDarkTheme = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<UsersBloc>(context).add(const GetFavoriteUsers());
    _fetchUsers();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchUsers();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UsersBloc, UsersState>(
      listener: (context, state) {
        if (state is ShowUsers) {
          _favoriteUsers = state.favoriteUsers;
        }
      },
      child: MainScaffold(
        title: 'Users',
        child: BlocBuilder<UsersBloc, UsersState>(
          builder: (context, state) {
            if (state is ShowUsers) {
              _users = state.users;
            }

            return Column(
              children: [
                _users.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                            controller: _scrollController,
                            itemCount: _users.length,
                            itemBuilder: (_, index) {
                              final UserEntity user = _users[index];
                              return InkWell(
                                onTap: () => _navigateToUserDetails(user),
                                child: SizedBox(
                                  height: 80,
                                  child: ListTile(
                                    trailing: IconButton(
                                        onPressed: () =>
                                            _selectUser(user.id.toString()),
                                        icon: Icon(_favoriteUsers
                                                .contains(user.id.toString())
                                            ? Icons.star
                                            : Icons.star_border)),
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(user.avatar),
                                    ),
                                    title: FullName(
                                        firstName: user.firstName,
                                        lastName: user.lastName),
                                    subtitle: Text(user.email),
                                  ),
                                ),
                              );
                            }))
                    : const SizedBox(),
                (state is LoadingUsers)
                    ? const Center(child: CircularProgressIndicator())
                    : const SizedBox()
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _fetchUsers() {
    BlocProvider.of<UsersBloc>(context).add(const FetchUsers());
  }

  void _selectUser(String id) {
    setState(() {
      if (_favoriteUsers.contains(id)) {
        _favoriteUsers.remove(id);
      } else {
        _favoriteUsers.add(id);
      }
    });
    BlocProvider.of<UsersBloc>(context).add(SetFavoriteUsers(_favoriteUsers));
  }

  void _navigateToUserDetails(UserEntity user) {
    Navigator.pushNamed(context, AppRoutes.USER_DETAILS_VIEW, arguments: user);
  }
}
