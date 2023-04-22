import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/theme/theme_bloc.dart';
import '../../blocs/users/users_bloc.dart';

class MainScaffold extends StatefulWidget {
  final Widget child;
  final String title;
  final bool inNeedLeading;
  const MainScaffold(
      {required this.child,
      this.inNeedLeading = true,
      required this.title,
      super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  bool _isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: widget.inNeedLeading
            ? IconButton(
                onPressed: () => BlocProvider.of<UsersBloc>(context)
                    .add(const FetchUsers(isRefresh: true)),
                icon: const Icon(Icons.refresh))
            : const BackButton(),
        actions: [
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              if (state is GetThemeState) {
                _isDarkTheme = state.isDarkTheme;
              }
              return IconButton(
                  onPressed: () {
                    BlocProvider.of<ThemeBloc>(context).add(const SetTheme());
                    BlocProvider.of<ThemeBloc>(context).add(const GetTheme());
                  },
                  icon: Icon(
                    Icons.light_mode_sharp,
                    color: _isDarkTheme ? Colors.white : Colors.black,
                  ));
            },
          ),
        ],
      ),
      body: widget.child,
    );
  }
}
