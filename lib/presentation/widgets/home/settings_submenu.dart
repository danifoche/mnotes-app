import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mnotes/utils/app_utils.dart';

class SettingsSubMenu extends StatefulWidget {
  final String headerTitle;
  final List<Map> settingsList;

  const SettingsSubMenu({
    super.key,
    required this.headerTitle,
    required this.settingsList,
  });

  @override
  State<SettingsSubMenu> createState() => _SettingsSubMenuState();
}

class _SettingsSubMenuState extends State<SettingsSubMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF019F95),
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              header(context),
              body(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset(
              "assets/icons/back_icon.svg",
              width: 25.0,
              height: 25.0,
            ),
          ),
          Text(
            widget.headerTitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),

          // trick to move the title in the middle of the header without having an end element
          Visibility(
            visible: false,
            maintainState: true,
            maintainAnimation: true,
            maintainSize: true,
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () => Navigator.pop(context),
              icon: SvgPicture.asset(
                "assets/icons/back_icon.svg",
                width: 25.0,
                height: 25.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget body(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 21.0,
          vertical: 35.0,
        ),
        color: Theme.of(context).primaryColor,
        child: Column(
          children: <Widget>[
            Container(
              constraints: const BoxConstraints(
                maxWidth: 500,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Color.fromARGB(25, 80, 81, 79),
              ),
              child: Column(
                children:
                    buildSettingsMenu(context, widget.settingsList, false) ??
                        [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
