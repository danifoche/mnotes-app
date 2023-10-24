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

  print(routeSettings);

  //? route arguments
  Map? arguments = routeSettings.arguments as Map?;

  switch (routeSettings.name) {

    //? login page
    case '/login':
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
            create: (_) => AuthenticationCubit(),
            child: const Login()
        ),
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
        builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<ContactBloc>(
                create: (context) => ContactBloc(),
              ),
            ],
            child: const HomePage()
        ),
      );
    case '/settings/submenu':
      return MaterialPageRoute(
        builder: (context) => SettingsSubMenu(
          headerTitle: arguments?["headerTitle"] ?? "",
          settingsList: arguments?["settingsList"] ?? [],
        ),
      );
    default:
      return null;
  }
}