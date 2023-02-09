import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/model.dart';
import '../screen/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('The route name is ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case MatchesScreen.routeName:
        return MatchesScreen.route();
      case OnboardingScreen.routeName:
        return OnboardingScreen.route();
      case UserScreen.routeName:
        return UserScreen.route(user: settings.arguments as User);
      case ChatScreen.routeName:
        return ChatScreen.route(userMatch: settings.arguments as UserMatch);
      case ProfileScreen.routeName:
        return ProfileScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text('error')),
      ),
      settings: RouteSettings(name: '/error'),
    );
  }
}
