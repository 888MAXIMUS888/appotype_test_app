import 'package:appotype_test_app/presentation/blocs/theme/theme_bloc.dart';
import 'package:appotype_test_app/presentation/blocs/users/users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_routes.dart';
import 'data/local/shared_preferences_service.dart';
import 'injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies(await SharedPreferences.getInstance());

  bool isDarkTheme = await injector.get<SharedPreferencesService>().getTheme();

  runApp(MyApp(isDarkTheme: isDarkTheme));
}

class MyApp extends StatefulWidget {
  final bool isDarkTheme;
  const MyApp({required this.isDarkTheme, super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool _isDarkTheme;

  @override
  void initState() {
    super.initState();
    _isDarkTheme = widget.isDarkTheme;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => injector<UsersBloc>()),
        BlocProvider(create: (context) => injector<ThemeBloc>()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is GetThemeState) {
            _isDarkTheme = state.isDarkTheme;
          }
          return MaterialApp(
              onGenerateRoute: AppRoutes.generateRoute,
              initialRoute: AppRoutes.USERS_VIEW,
              theme: _isDarkTheme ? ThemeData.dark() : ThemeData.light());
        },
      ),
    );
  }
}
