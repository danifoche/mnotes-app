import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mnotes/presentation/widgets/home/notes_item.dart';

class NotesList extends StatefulWidget {
  const NotesList({super.key});

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
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
          "Note",
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
      child: (
        ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              children: const <Widget>[
                NotesItem(),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: Color.fromARGB(50, 80, 81, 79),
                ),
              ],
            );
          },
        )
      ),
    ),
  );
}