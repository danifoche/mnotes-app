import 'package:flutter/material.dart';

class ContactsPermission extends StatefulWidget {
  const ContactsPermission({super.key});

  @override
  State<ContactsPermission> createState() => _ContactsPermissionState();
}

class _ContactsPermissionState extends State<ContactsPermission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF019F95),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/backgrounds/contacts_permission.png"),
              Text(
                "Abbiamo bisogno di accedere ai contatti per procedere",
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 63.0,
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
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 22.0, horizontal: 28.0),
                      ),
                      onPressed: () {
                        print("tmp");
                      },
                      child: Text(
                        "Consenti",
                        style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.labelLarge!.fontSize,
                          fontWeight:
                              Theme.of(context).textTheme.labelLarge!.fontWeight,
                          color: const Color(0xFF019F95),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 37.0,
                ),
                child: Text(
                  "Non ora",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: Theme.of(context).textTheme.labelMedium!.fontSize,
                    fontWeight: FontWeight.w200,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ));
  }
}
