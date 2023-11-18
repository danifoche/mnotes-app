import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mnotes/logic/bloc/contact_bloc.dart';
import 'package:mnotes/presentation/widgets/home/notes_item.dart';
import 'package:mnotes/utils/app_utils.dart';

class NotesList extends StatefulWidget {
  const NotesList({super.key});

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactBloc, ContactState>(
      listener: (context, state) {

      },
      builder: (context, state) {

        // retrieve the list in the initial state
        if(state is ContactInitial) {
          BlocProvider.of<ContactBloc>(context).add(ContactGetList());
        }
        
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              header(context, state),
              body(context, state),
            ],
          ),
        );
      }, 
    );
  }
}

Widget header(BuildContext context, ContactState state) {
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

Widget body(BuildContext context, ContactState state) {

  return Expanded(
    child: Container(
      color: Theme.of(context).primaryColor,
      child: (state is ContactLoading) ? (
        Center(
          child: loadingCircle(),
        )
      ) : (state is ContactList) ? (
        ListView.builder(
          itemCount: state.list.length,
          itemBuilder: (context, index) {
            return Column(
              children:  <Widget>[
                NotesItem(
                  firstName: state.list[index].firstName ?? "",
                  lastName: state.list[index].lastName ?? "",
                  image: state.list[index].image ?? "",
                  lastNoteAt: "",
                  lastNoteMessage: "Test message",
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: Color.fromARGB(50, 80, 81, 79),
                ),
              ],
            );
          },
        )
      ) : (state is ContactListEmpty) ? (
        Center(
          child: Text(
            "Nessuna nota trovata, creane una!",
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
              fontWeight: Theme.of(context).textTheme.titleMedium!.fontWeight,
            )
          ),
        )
      ) : Container()
    ),
  );
}