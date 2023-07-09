import 'package:flutter/material.dart';
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
                      contentPadding: Theme.of(context)
                          .inputDecorationTheme
                          .contentPadding,
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