import 'package:flutter/material.dart';

class NotesItem extends StatefulWidget {

  final String image;
  final String firstName;
  final String lastName;
  final String lastNoteAt;
  final String lastNoteMessage;

  const NotesItem({super.key, required this.image, required this.firstName, required this.lastName, required this.lastNoteAt, required this.lastNoteMessage});

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
          
          Padding(
            padding: const EdgeInsets.only(
              right: 15.0,
            ),
            child: CircleAvatar(
              radius: 30,
              child: ClipOval(
                  child: Image.network(
                    widget.image,
                  ),
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
                        (widget.firstName + widget.lastName),
                        style: Theme.of(context).textTheme.labelLarge,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 6.0,
                      ),
                      child: Text(
                        widget.lastNoteAt,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(127, 80, 81, 79),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  widget.lastNoteMessage,
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