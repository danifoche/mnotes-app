import 'package:flutter/material.dart';
import 'package:mnotes/presentation/pages/contacts_details.dart';
import 'package:mnotes/presentation/pages/contacts_permission.dart';
import 'package:mnotes/presentation/pages/home_page.dart';
import 'package:mnotes/presentation/pages/lets_start.dart';
import 'package:mnotes/presentation/pages/login.dart';
import 'package:mnotes/presentation/pages/sign_up_step_1.dart';
import 'package:mnotes/presentation/pages/sign_up_step_2.dart';

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
    case '/lets-start':
      return MaterialPageRoute(
        builder: (context) => const LetsStart()
      );
    case '/permission/contacts':
      return MaterialPageRoute(
        builder: (context) => const ContactsPermission()
      );
    case '/contact':
      return MaterialPageRoute(
        builder: (context) => const ContactsDetails()
      );
    case '/home':
      return MaterialPageRoute(
        builder: (context) => const HomePage()
      );
    default:
      return null;
  }
}