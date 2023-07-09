import 'package:flutter/material.dart';
import 'package:mnotes/settings/app_settings.dart';

class LetsStart extends StatefulWidget {
  const LetsStart({super.key});

  @override
  State<LetsStart> createState() => _LetsStartState();
}

class _LetsStartState extends State<LetsStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF019F95),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // SvgPicture.asset(
              //   "assets/backgrounds/lets_start.svg",
              //   semanticsLabel: "Lets Start",

              //   // width: 32,
              //   // height: 32,
              // ),

              Text(
                "Cominciamo",
                style: Theme.of(context).textTheme.titleLarge,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6.0,
                  vertical: 24.0,
                ),
                child: Text(
                  "Migliora la tua produttività e organizza al meglio i tuoi pensieri con MNotes",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: Theme.of(context).textTheme.labelMedium!.fontSize,
                    fontWeight: FontWeight.w200,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              Container(
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
                      "Registrati",
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

              Padding(
                padding: const EdgeInsets.only(
                  top: 35.0,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        appRoutes["login"] ?? "", (route) => false);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Hai già un account?",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const Text(" "),
                      Text(
                        "Accedi",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize:
                              Theme.of(context).textTheme.labelMedium!.fontSize,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
