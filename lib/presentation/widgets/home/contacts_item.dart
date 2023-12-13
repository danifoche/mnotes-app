import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContactsItem extends StatefulWidget {
  final VoidCallback onClick;

  const ContactsItem({super.key, required this.onClick});

  @override
  State<ContactsItem> createState() => _ContactsItemState();
}

class _ContactsItemState extends State<ContactsItem> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF9E9E9E),
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 20.0,
        ),
      ),
      onPressed: widget.onClick,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            child: Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(
                    right: 15.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.16),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        AssetImage("assets/icons/home_notes_icon.png"),
                  ),
                ),
                Flexible(
                  child: Text(
                    "Adam",
                    style: Theme.of(context).textTheme.labelLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: SvgPicture.asset(
              "assets/icons/home_mnotes_icon.svg",
            ),
          ),
        ],
      ),
    );
  }
}
