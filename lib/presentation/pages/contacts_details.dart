import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class ContactsDetails extends StatefulWidget {
  const ContactsDetails({super.key});

  @override
  State<ContactsDetails> createState() => _ContactsDetailsState();
}

class _ContactsDetailsState extends State<ContactsDetails> {

  bool editMode = false;

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
        crossAxisAlignment: CrossAxisAlignment.center,
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
            "Dettaglio contatto",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          (
            editMode ? IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () => setState(() {
                editMode = false;
              }),
              icon: SvgPicture.asset(
                "assets/icons/save_icon.svg",
                height: 25.0, 
                width: 25.0,
                fit: BoxFit.cover
              ),
            ) : IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () => setState(() {
                editMode = true;
              }),
              icon: Icon(
                Icons.create_outlined,
                size: 27.0,
                color: Theme.of(context).primaryColor,
              ),
            )
          ),
        ],
      ),
    );
  }

  Widget body(BuildContext context) {
    //? used double containers in order to get white background and use a transparent one after
    //? because the main background color is the same and the transparency wouldn't work
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 37.0,
          ),
          color: const Color.fromARGB(50, 1, 159, 149),
          child: ListView(
            children: [
              Column(
                children: <Widget>[
                  avatar(),
                  editMode ? infoEdit(context) : infoDetails(context),
                ],
              ),
            ],
          ),
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

          if(editMode) 
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
              ),
              child: Text(
                "Aggiungi foto",
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.labelSmall!.fontSize,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF019F95),
                ),
              ),
            ), 
        ],
      ),
    );
  }

  Widget infoDetails(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(
                  right: 15.0,
                ),
                child: Text(
                  "Adam",
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
                    fontWeight:
                        Theme.of(context).textTheme.titleMedium!.fontWeight,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SvgPicture.asset(
              "assets/icons/home_mnotes_icon.svg",
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 32.0,
          ),
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
            color: Theme.of(context).primaryColor,
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 18.0,
                  horizontal: 15.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Cellulare",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "+39 333 352 1812",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                        "assets/icons/contacts_details_phone_icon.svg"),
                  ],
                ),
              ),
              const Divider(
                height: 1,
                thickness: 1,
                color: Color.fromARGB(50, 80, 81, 79),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 18.0,
                  horizontal: 15.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "adam@memora.net",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget infoEdit(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 32.0,
          ),
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
            color: Theme.of(context).primaryColor,
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 18.0,
                  horizontal: 15.0,
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 0, 
                      vertical: 0
                    ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                  ),
                  autocorrect: false,
                  autofocus: true,
                  initialValue: "Adam",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              const Divider(
                height: 1,
                thickness: 1,
                color: Color.fromARGB(50, 80, 81, 79),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 18.0,
                  horizontal: 15.0,
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 0, 
                      vertical: 0
                    ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                  ),
                  autocorrect: false,
                  initialValue: "adam@memora.net",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              const Divider(
                height: 1,
                thickness: 1,
                color: Color.fromARGB(50, 80, 81, 79),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 18.0,
                  horizontal: 15.0,
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 0, 
                      vertical: 0
                    ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                  ),
                  autocorrect: false,
                  initialValue: "+39 333 352 1812",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
