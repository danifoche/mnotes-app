import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mnotes/logic/bloc/contact_bloc.dart';
import 'package:mnotes/logic/cubit/authentication_cubit.dart';
import 'package:mnotes/presentation/pages/contacts_details.dart';
import 'package:mnotes/presentation/pages/contacts_permission.dart';
import 'package:mnotes/presentation/pages/home_page.dart';
import 'package:mnotes/presentation/pages/lets_start.dart';
import 'package:mnotes/presentation/pages/login.dart';
import 'package:mnotes/presentation/pages/sign_up_step_1.dart';
import 'package:mnotes/presentation/pages/sign_up_step_2.dart';
import 'package:mnotes/presentation/widgets/home/settings_submenu.dart';

Route? onGenerateRoute(RouteSettings routeSettings) {
  //? route arguments
  Map? arguments = routeSettings.arguments as Map?;

  switch (routeSettings.name) {
    //? login page
    case '/login':
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
          create: (_) => AuthenticationCubit(),
          child: const Login(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(
              curve: curve,
            ),
          );

          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 6000),
        reverseTransitionDuration: const Duration(milliseconds: 6000),
      );
    case '/signup/1':
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const SignUpStep1(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(
              curve: curve,
            ),
          );

          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 6000),
        reverseTransitionDuration: const Duration(milliseconds: 6000),
      );
    case '/signup/2':
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const SignUpStep2(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(
              curve: curve,
            ),
          );

          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 6000),
        reverseTransitionDuration: const Duration(milliseconds: 6000),
      );
    case '/lets-start':
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const LetsStart(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(
              curve: curve,
            ),
          );

          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 6000),
        reverseTransitionDuration: const Duration(milliseconds: 6000),
      );
    case '/permission/contacts':
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const ContactsPermission(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(
              curve: curve,
            ),
          );

          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 6000),
        reverseTransitionDuration: const Duration(milliseconds: 6000),
      );
    case '/contact':
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const ContactsDetails(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(
              curve: curve,
            ),
          );

          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 6000),
        reverseTransitionDuration: const Duration(milliseconds: 6000),
      );
    case '/home':
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            MultiBlocProvider(
          providers: [
            BlocProvider<ContactBloc>(
              create: (context) => ContactBloc(),
            ),
          ],
          child: const HomePage(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(
              curve: curve,
            ),
          );

          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 6000),
        reverseTransitionDuration: const Duration(milliseconds: 6000),
      );
    case '/settings/submenu':
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            SettingsSubMenu(
          headerTitle: arguments?["headerTitle"] ?? "",
          settingsList: arguments?["settingsList"] ?? [],
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(
              curve: curve,
            ),
          );

          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 6000),
        reverseTransitionDuration: const Duration(milliseconds: 6000),
      );
    default:
      return null;
  }
}
