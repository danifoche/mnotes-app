import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mnotes/settings/app_settings.dart';
import 'package:mnotes/settings/app_utils.dart';

class SignUpStep1 extends StatefulWidget {
  const SignUpStep1({super.key});

  @override
  State<SignUpStep1> createState() => _SignUpStep1State();
}

class _SignUpStep1State extends State<SignUpStep1> {

  final _formKey = GlobalKey<FormState>();

  final Map<String, String> _validatorFields = {
    "nameField": "nome",
    "lastnameField": "cognome"
  };

  //? dismiss the keyboard when tapped outside it
  void dismissKeyboard() {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if(!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF019F95),
        body: GestureDetector(
          onTap: dismissKeyboard,
          child: Center(
            child: SingleChildScrollView(
              child: SafeArea(
                  child: Column(
                    children: [
                      //? title
                      Text(
                        "Benvenuto!",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 31.0,
                          horizontal: 47.0
                        ),
                        child: Text(
                          "Prima di cominciare MNotes ha bisogno di sapere alcune tue informazioni",
                          style: TextStyle(
                            fontSize: Theme.of(context).textTheme.labelLarge!.fontSize,
                            color: Theme.of(context).textTheme.labelMedium!.color,
                            fontWeight: Theme.of(context).textTheme.labelMedium!.fontWeight,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                  
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 18.0,
                          right: 18.0,
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 5.0,
                                  bottom: 13.0,
                                ),
                                child: TextFormField(
                                  validator: (value) => validateField(value, _validatorFields["nameField"]),
                                  decoration: InputDecoration(
                                      hintText: "Nome",
                                      hintStyle: Theme.of(context)
                                          .inputDecorationTheme
                                          .hintStyle,
                                      filled: true,
                                      fillColor: Theme.of(context)
                                          .inputDecorationTheme
                                          .fillColor,
                                      contentPadding: Theme.of(context)
                                          .inputDecorationTheme
                                          .contentPadding,
                                      border: Theme.of(context)
                                          .inputDecorationTheme
                                          .border,
                                      focusedBorder: Theme.of(context)
                                          .inputDecorationTheme
                                          .focusedBorder),
                                  style: Theme.of(context).textTheme.labelLarge,
                                  cursorColor: Theme.of(context)
                                      .textSelectionTheme
                                      .cursorColor,
                                ),
                              ),
                                        
                              //? password field
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 13.0,
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
                                    validator: (value) => validateField(value, _validatorFields["lastnameField"]),
                                    decoration: InputDecoration(
                                      hintText: "Cognome",
                                      hintStyle: Theme.of(context)
                                          .inputDecorationTheme
                                          .hintStyle,
                                      filled: true,
                                      fillColor: Theme.of(context)
                                          .inputDecorationTheme
                                          .fillColor,
                                      contentPadding: Theme.of(context)
                                          .inputDecorationTheme
                                          .contentPadding,
                                      border:
                                          Theme.of(context).inputDecorationTheme.border,
                                    ),
                                    style: Theme.of(context).textTheme.labelLarge,
                                    cursorColor: Theme.of(context)
                                        .textSelectionTheme
                                        .cursorColor,
                                  ),
                                ),
                              ),
                                        
                              //? login button
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 13.0,
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
                                          vertical: 22.0,
                                          horizontal: 28.0
                                        ),
                                      ),
                                      onPressed: () {
                                        
                                        //? validate the form
                                        if(_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();

                                          Navigator.of(context).pushNamed(
                                            appRoutes["signup_2"] ?? ""
                                          );
                                        }

                                      },
                                      child: Text(
                                        "Continua",
                                        style: TextStyle(
                                          fontSize: Theme.of(context)
                                              .textTheme
                                              .labelLarge!
                                              .fontSize,
                                          fontWeight: Theme.of(context)
                                              .textTheme
                                              .labelLarge!
                                              .fontWeight,
                                          color: const Color(0xFF019F95),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                                        
                              //? separator
                              Padding(
                                  padding: const EdgeInsets.only(
                                    top: 44,
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          height: 5,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context).primaryColor,
                                            borderRadius: BorderRadius.circular(5.0),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 23.0,
                                          right: 23.0,
                                        ),
                                        child: Text(
                                          "Registrati con",
                                          style: TextStyle(
                                              color: Theme.of(context).primaryColor,
                                              fontSize: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium!
                                                  .fontSize,
                                              fontWeight: FontWeight.w200),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 5,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context).primaryColor,
                                            borderRadius: BorderRadius.circular(5.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                                        
                              //? other login buttons
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 44.0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    //? google Logo
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
                                        width: 50,
                                        height: 50,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Theme.of(context).primaryColor,
                                              shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(16),
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              print("Google logo");
                                            },
                                            child: SvgPicture.asset(
                                              "images/google_icon.svg",
                                              semanticsLabel: "Google Logo",
                                              width: 32,
                                              height: 32,
                                              fit: BoxFit.cover,
                                              clipBehavior: Clip.none,
                                            )),
                                      ),
                                    ),
                                        
                                    //? facebook Logo
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 45.0, right: 45.0),
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
                                          width: 50,
                                          height: 50,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Theme.of(context).primaryColor,
                                                shape: const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(16),
                                                  ),
                                                ),
                                              ),
                                              onPressed: () {
                                                print("Facebook logo");
                                              },
                                              child: SvgPicture.asset(
                                                "images/facebook_icon.svg",
                                                semanticsLabel: "Facebook Logo",
                                                width: 32,
                                                height: 32,
                                                fit: BoxFit.cover,
                                                clipBehavior: Clip.none,
                                              )),
                                        ),
                                      ),
                                    ),
                                        
                                    //? apple Logo
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
                                        width: 50,
                                        height: 50,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Theme.of(context).primaryColor,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(16),
                                              ),
                                            ),
                                          ),
                                          onPressed: () {
                                            print("Apple logo");
                                          },
                                          child: SvgPicture.asset(
                                            "images/apple_icon.svg",
                                            semanticsLabel: "Apple Logo",
                                            width: 32,
                                            height: 32,
                                            fit: BoxFit.cover,
                                            clipBehavior: Clip.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                                        
                              //? register link
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 35.0,
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamedAndRemoveUntil(
                                      appRoutes["login"] ?? "",
                                      (route) => false
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Hai già un account?",
                                        style:
                                            Theme.of(context).textTheme.labelMedium,
                                      ),
                                      const Text(" "),
                                      Text(
                                        "Accedi",
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: Theme.of(context)
                                              .textTheme
                                              .labelMedium!
                                              .fontSize,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          ),
        ));
  }
}
