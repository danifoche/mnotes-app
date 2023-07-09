import 'package:flutter/material.dart';

class NotesItem extends StatefulWidget {
  const NotesItem({super.key});

  @override
  State<NotesItem> createState() => _NotesItemState();
}

class _NotesItemState extends State<NotesItem> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF9E9E9E),
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 16.0,
        ),
      ),
      child: Row(
        children: <Widget>[
          
          const Padding(
            padding: EdgeInsets.only(
              right: 15.0,
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                "assets/icons/home_notes_icon.png"
              ),
            ),
          ),
          
          Flexible(
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        "Lincoln Bergson",
                        style: Theme.of(context).textTheme.labelLarge,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 6.0,
                      ),
                      child: const Text(
                        "2 giorni fa",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(127, 80, 81, 79),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "La presentazione è andata e ho firmato per iniziare la prima fase del progetto",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.labelSmall!.fontSize,
                    fontWeight: Theme.of(context).textTheme.labelSmall!.fontWeight,
                    color: const Color.fromARGB(127, 80, 81, 79)
                  ),
                  maxLines: 2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}