import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mnotes/settings/app_settings.dart';
import 'package:mnotes/utils/app_utils.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          header(context),
          body(context),
        ],
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
          Text(
            "Impostazioni",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  Widget body(BuildContext context) {
    Object accountManagement = {
      "headerTitle": "Gestione account",
      "settingsList": [
        {
          "onPressed": () {},
          "icon": SvgPicture.asset(
            "assets/icons/settings_password_icon.svg",
          ),
          "label": "Cambia password"
        },
        {
          "onPressed": () {},
          "icon": SvgPicture.asset(
            "assets/icons/settings_email_icon.svg",
          ),
          "label": "Cambia email"
        }
      ]
    };

    Object permissions = {
      "headerTitle": "Permessi",
      "settingsList": [
        {
          "onPressed": () {},
          "icon": SvgPicture.asset(
            "assets/icons/settings_contact_icon.svg",
          ),
          "label": "Accesso ai contatti"
        },
        {
          "onPressed": () {},
          "icon": SvgPicture.asset(
            "assets/icons/settings_microphone_icon.svg",
          ),
          "label": "Accesso al microfono"
        },
        {
          "onPressed": () {},
          "icon": SvgPicture.asset(
            "assets/icons/settings_camera_icon.svg",
          ),
          "label": "Accesso alla fotocamera"
        }
      ]
    };

    List<Map> settingsList = [
      {
        "onPressed": () {
          Navigator.of(context).pushNamed(
            appRoutes["settings_submenu"] ?? "",
            arguments: accountManagement,
          );
        },
        "icon": SvgPicture.asset(
          "assets/icons/settings_person_icon.svg",
        ),
        "label": "Gestione account"
      },
      {
        "onPressed": () {
          Navigator.of(context).pushNamed(
            appRoutes["settings_submenu"] ?? "",
            arguments: permissions,
          );
        },
        "icon": SvgPicture.asset(
          "assets/icons/settings_lock_icon.svg",
        ),
        "label": "Permessi"
      }
    ];

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 21.0,
        ),
        color: Theme.of(context).primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            avatar(),
            userInfo(context, "Daniele Fochesato", "test@memora.net"),
            Align(
              child: Container(
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
                      buildSettingsMenu(context, settingsList, true) ?? [],
                ),
              ),
            ),
            appVersion("1.0.0"),
          ],
        ),
      ),
    );
  }

  Widget avatar() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 45.0,
        bottom: 32.0,
      ),
      child: Column(
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(100),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    spreadRadius: 0,
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ],
                color: const Color(0xFFEEEEEE),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/icons/home_notes_icon.png"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget userInfo(BuildContext context, String fullName, String email) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 35.0,
      ),
      child: Column(
        children: <Widget>[
          Text(
            fullName,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
              fontWeight: Theme.of(context).textTheme.titleMedium!.fontWeight,
            ),
          ),
          Text(
            email,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.labelMedium!.fontSize,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget appVersion(String version) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20.0,
      ),
      child: Text(
        "Versione $version",
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.labelMedium!.fontSize,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
