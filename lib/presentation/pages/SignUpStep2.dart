import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_shadow/simple_shadow.dart';

class SignUpStep2 extends StatefulWidget {
  const SignUpStep2({super.key});

  @override
  State<SignUpStep2> createState() => _SignUpStep2State();
}

class _SignUpStep2State extends State<SignUpStep2> {
  //? dismiss the keyboard when tapped outside it
  void dismissKeyboard() {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => print("back"),
          icon: SimpleShadow(
            opacity: 0.4,
            color: Colors.black,
            offset: const Offset(0, 2),
            sigma: 5,
            child: SvgPicture.asset(
              "images/back_icon.svg",
              semanticsLabel: "Apple Logo",
              width: 32,
              height: 32,
              fit: BoxFit.cover,
              clipBehavior: Clip.none,
            ),
          ),
        )
      ),
      backgroundColor: const Color(0xFF019F95),
      body: GestureDetector(
        onTap: dismissKeyboard,
        child: Align(
          alignment: const FractionalOffset(0.5, 0.3),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: <Widget> [
                  //? title
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: Text(
                      "Abbiamo\nquasi finito!",
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
              
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 18.0,
                      right: 18.0,
                    ),
                    child: Form(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 13.0,
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
                                    hintText: "Email",
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
                                decoration: InputDecoration(
                                  hintText: "Password",
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
                                ),
                                style: Theme.of(context).textTheme.labelLarge,
                                cursorColor: Theme.of(context)
                                    .textSelectionTheme
                                    .cursorColor,
                                obscureText: true,
                              ),
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
                                decoration: InputDecoration(
                                  hintText: "Conferma password",
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
                                ),
                                style: Theme.of(context).textTheme.labelLarge,
                                cursorColor: Theme.of(context)
                                    .textSelectionTheme
                                    .cursorColor,
                                obscureText: true,
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
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
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
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
