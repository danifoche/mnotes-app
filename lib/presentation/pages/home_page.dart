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

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int index = 0;
  late PageController _pageController;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: index,
      keepPage: true,
    );
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 7000),
    );
  }

  void changeScreen(dynamic newIndex) {
    setState(() {
      index = newIndex;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        // in the initial state check for the user token
        if (state is AuthenticationInitial) {
          BlocProvider.of<AuthenticationCubit>(context).checkAccessToken();
        }

        // if the token validation failed, return to the login
        if (state is AuthenticationCheckAccessTokenError) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            appRoutes["login"] ?? "/error",
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            color: const Color(0xFF019F95),
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: const <Widget>[
                NotesList(),
                ContactsList(),
                SettingsPage()
              ],
            ),
          ),
          floatingActionButton: Visibility(
            visible: index != 2,
            child: FloatingActionButton(
              onPressed: () => showContactsList(context, _animationController),
              backgroundColor: const Color(0xFF019F95),
              shape: const CircleBorder(),
              child: const Icon(
                Icons.add,
                size: 35.0,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
          bottomNavigationBar: CustomBottomNavigationBar(
            index: index,
            function: changeScreen,
          ),
        );
      },
    );
  }
}
