import 'package:appotype_test_app/presentation/views/user_details.dart';
import 'package:appotype_test_app/presentation/views/users_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  // screens
  static const USERS_VIEW = 'usersView';
  static const USER_DETAILS_VIEW = 'userDetails';

  static Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case USERS_VIEW:
        return _materialRoute(const UsersView(), routeSettings: routeSettings);
      case USER_DETAILS_VIEW:
        return _materialRoute(const UserDetailsView(),
            routeSettings: routeSettings);
      default:
    }
  }

  static Route<dynamic> _materialRoute(Widget view,
      {RouteSettings? routeSettings}) {
    return MaterialPageRoute(
        builder: (_) => Builder(
            builder: (BuildContext context) => MediaQuery(
                child: view,
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0))),
        settings: routeSettings);
  }
}
