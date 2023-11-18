import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mnotes/logic/cubit/authentication_cubit.dart';
import 'package:mnotes/presentation/widgets/home/contacts_list.dart';
import 'package:mnotes/presentation/widgets/home/custom_bottom_navigation_bar.dart';
import 'package:mnotes/presentation/widgets/home/notes_list.dart';
import 'package:mnotes/presentation/widgets/home/settings_page.dart';
import 'package:mnotes/settings/app_settings.dart';
import 'package:mnotes/utils/app_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  void changeScreen(dynamic newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {

        // in the initial state check for the user token
        if(state is AuthenticationInitial) {
          BlocProvider.of<AuthenticationCubit>(context).checkAccessToken();
        }

        // if the token validation failed, return to the login
        if(state is AuthenticationCheckAccessTokenError) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            appRoutes["login"] ?? "/error", 
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            body: Container(
              color: const Color(0xFF019F95),
              child: IndexedStack(
                index: index,
                children: const <Widget>[
                  NotesList(),
                  ContactsList(),
                  SettingsPage(),
                ],
              ),
            ),
            floatingActionButton: Visibility(
              visible: index != 2,
              child: FloatingActionButton(
                onPressed: () => showContactsList(context),
                backgroundColor: const Color(0xFF019F95),
                child: const Icon(
                  Icons.add,
                  size: 35.0,
                ),
              ),
            ),
            bottomNavigationBar: CustomBottomNavigationBar(
              index: index,
              function: changeScreen,
            ),
          ),
        );
      },
    );
  }
}
