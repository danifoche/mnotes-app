import 'package:flutter/material.dart';
import 'package:mnotes/presentation/pages/Login.dart';
import 'package:mnotes/presentation/pages/SignUpStep1.dart';
import 'package:mnotes/presentation/pages/SignUpStep2.dart';

Route? onGenerateRoute(RouteSettings routeSettings) {

  //? route arguments
  Map? arguments = routeSettings.arguments as Map?;

  switch (routeSettings.name) {

    //? login page
    case '/login':
      return MaterialPageRoute(
        builder: (context) => const Login()
      );
    case '/signup/1':
      return MaterialPageRoute(
        builder: (context) => const SignUpStep1()
      );
    case '/signup/2':
      return MaterialPageRoute(
        builder: (context) => const SignUpStep2()
      );

    default:
      return null;
  }
}