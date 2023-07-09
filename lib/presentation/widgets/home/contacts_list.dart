import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mnotes/presentation/widgets/home/contacts_item.dart';
import 'package:mnotes/settings/app_settings.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({super.key});

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          header(context),
          body(context),
        ],
      ),
    );
  }
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
          "Contatti",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/home_search_icon.svg",
            width: 25.0,
            height: 25.0,
          ),
        ),
      ],
    ),
  );
}

Widget body(BuildContext context) {
  return Expanded(
    child: Container(
      color: Theme.of(context).primaryColor,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              letter(context, "A"),
              ContactsItem(
                onClick: () {
                  Navigator.of(context).pushNamed(
                    appRoutes["contact_details"] ?? ""
                  );
                }
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
    ),
  );
}

Widget letter(BuildContext context, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 29.0,
      vertical: 10.0,
    ),
    child: Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 7.0,
          vertical: 4.0,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          color: const Color.fromARGB(50, 80, 81, 79),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.10),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Text(
          value,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    ),
  );
}
