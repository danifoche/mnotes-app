import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mnotes/presentation/widgets/home/contacts_item.dart';

Future<void> showContactsList(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    builder: (context) {
      return FractionallySizedBox(
        heightFactor: 0.8,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 14.0,
          ),
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(
                  bottom: 12.0,
                ),
                width: 60,
                height: 5,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(150, 80, 81, 79),
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 18.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.16),
                        spreadRadius: 0.4,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Cerca un contatto",
                      hintStyle:
                          Theme.of(context).inputDecorationTheme.hintStyle,
                      filled: true,
                      fillColor:
                          Theme.of(context).inputDecorationTheme.fillColor,
                      contentPadding:
                          Theme.of(context).inputDecorationTheme.contentPadding,
                      border: Theme.of(context).inputDecorationTheme.border,
                    ),
                    style: Theme.of(context).textTheme.labelLarge,
                    cursorColor:
                        Theme.of(context).textSelectionTheme.cursorColor,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        ContactsItem(
                          onClick: () {},
                        ),
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: Color.fromARGB(50, 80, 81, 79),
                        ),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}

List<Widget>? buildSettingsMenu(
    BuildContext context, List<Map> settings, bool logoutButton) {
  if (settings.isEmpty) return null;

  List<Widget> list = [];

  print(settings);

  for (var i = 0; i < settings.length; i++) {
    list.add(
      Column(
        children: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFF9E9E9E),
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
                vertical: 15.0,
              ),
            ),
            onPressed: settings[i]["onPressed"],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    SizedBox(
                      child: settings[i]["icon"],
                      width: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10.0,
                      ),
                      child: Text(
                        settings[i]["label"] ?? "",
                        style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.labelMedium!.fontSize,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SvgPicture.asset(
                  "assets/icons/settings_go_icon.svg",
                ),
              ],
            ),
          ),
          if(i < (settings.length - 1) || logoutButton)
            const Divider(
              height: 1,
              thickness: 1,
              color: Color.fromARGB(50, 80, 81, 79),
            ),
        ],
      ),
    );
  }

  if (logoutButton) {
    list.add(
      TextButton(
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFF9E9E9E),
          padding: const EdgeInsets.symmetric(
            horizontal: 25.0,
            vertical: 15.0,
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Disconnetti",
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.labelMedium!.fontSize,
                fontWeight: FontWeight.normal,
                color: const Color.fromARGB(255, 246, 81, 81),
              ),
            ),
          ],
        ),
      ),
    );
  }

  return list;
}
