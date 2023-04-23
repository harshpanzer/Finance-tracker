import 'package:flutter/material.dart';
import 'package:money_manager/features/auth/screens/sign_in.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SignInScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const SignInScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text(
              'Screen doesn\'t exist!',
            ),
          ),
        ),
      );
  }
}
