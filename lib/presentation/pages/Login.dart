import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mnotes/logic/cubit/authentication_cubit.dart';
import 'package:mnotes/presentation/widgets/snackbar/custom_snackbar.dart';
import 'package:mnotes/settings/app_settings.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // set some controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // retrieve an instance of the snackbar
  final CustomSnackbar _customSnackbar = CustomSnackbar();

  // errors flag
  bool _error = false;

  // check all the form credentials
  Map<String, String>? checkCredentials() {
    
    // retrieve the credentials
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    // check if one of the credentials are empty
    if (email.isEmpty || password.isEmpty) return null;

    // check if the given email is valid
    if (!EmailValidator.validate(email)) return null;

    // check password strenght
    if (password.length < 8) return null;

    return {"email": email, "password": password};
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationSuccess) {
          // send notification
          _customSnackbar.success(context, state.title, state.message);

          // navigate to homepage
          Navigator.of(context).pushNamedAndRemoveUntil(
              appRoutes["home"] ?? "/error", (route) => false);
        } else if (state is AuthenticationError) {
          // send notification
          _customSnackbar.error(context, state.title, state.message);

          // set the error
          setState(() {
            _error = true;
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFF019F95),
          body: Center(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Visibility(
                      visible: state is AuthenticationLoading ? true : false,
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 5.0,
                      ),
                    ),
                    Opacity(
                      opacity: state is AuthenticationLoading ? 0.2 : 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          //? title
                          Text(
                            "Bentornato!",
                            style: Theme.of(context).textTheme.titleLarge,
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
                                      top: 26.0,
                                      bottom: 13.0,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.16),
                                            spreadRadius: 0.4,
                                            blurRadius: 8,
                                            offset: const Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: TextFormField(
                                        controller: _emailController,
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
                                          border: _error
                                              ? Theme.of(context)
                                                  .inputDecorationTheme
                                                  .errorBorder
                                              : Theme.of(context)
                                                  .inputDecorationTheme
                                                  .border,
                                          enabledBorder: _error
                                              ? Theme.of(context)
                                                  .inputDecorationTheme
                                                  .errorBorder
                                              : Theme.of(context)
                                                  .inputDecorationTheme
                                                  .border,
                                          focusedBorder: _error
                                              ? Theme.of(context)
                                                  .inputDecorationTheme
                                                  .focusedErrorBorder
                                              : Theme.of(context)
                                                  .inputDecorationTheme
                                                  .focusedBorder,
                                        ),
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                        cursorColor: Theme.of(context)
                                            .textSelectionTheme
                                            .cursorColor,
                                      ),
                                    ),
                                  ),

                                  //? password field
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
                                            color:
                                                Colors.black.withOpacity(0.16),
                                            spreadRadius: 0.4,
                                            blurRadius: 8,
                                            offset: const Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: TextFormField(
                                        controller: _passwordController,
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
                                          border: _error
                                              ? Theme.of(context)
                                                  .inputDecorationTheme
                                                  .errorBorder
                                              : Theme.of(context)
                                                  .inputDecorationTheme
                                                  .border,
                                          enabledBorder: _error
                                              ? Theme.of(context)
                                                  .inputDecorationTheme
                                                  .errorBorder
                                              : Theme.of(context)
                                                  .inputDecorationTheme
                                                  .border,
                                          focusedBorder: _error
                                              ? Theme.of(context)
                                                  .inputDecorationTheme
                                                  .focusedErrorBorder
                                              : Theme.of(context)
                                                  .inputDecorationTheme
                                                  .focusedBorder,
                                        ),
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                        cursorColor: Theme.of(context)
                                            .textSelectionTheme
                                            .cursorColor,
                                        obscureText: true,
                                      ),
                                    ),
                                  ),

                                  //? forgot password label
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                      onPressed: null,
                                      child: Text(
                                        "Hai dimenticato la password?",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ),
                                    ),
                                  ),

                                  //? login button
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
                                          // retrieve the credentials
                                          Map<String, String>? credentials =
                                              checkCredentials();

                                          // check if the credentials returned from the validation are a valid type
                                          if (credentials is Map &&
                                              credentials != null) {
                                            // if previously there was an error then remove it
                                            if (_error == true) {
                                              setState(() {
                                                _error = false;
                                              });
                                            }

                                            BlocProvider.of<
                                                        AuthenticationCubit>(
                                                    context)
                                                .logIn(credentials);
                                          } else {
                                            _customSnackbar.warning(
                                                context,
                                                "Attenzione",
                                                "Controlla le credenziali inserite!");
                                          }
                                        },
                                        child: Text(
                                          "Accedi",
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
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 23.0,
                                              right: 23.0,
                                            ),
                                            child: Text(
                                              "Continua con",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
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
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        //? google Logo
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.16),
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
                                                      Theme.of(context)
                                                          .primaryColor,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(16),
                                                    ),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  print("Google logo");
                                                },
                                                child: SvgPicture.asset(
                                                  "assets/icons/google_icon.svg",
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
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.16),
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Theme.of(context)
                                                            .primaryColor,
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(16),
                                                      ),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    print("Facebook logo");
                                                  },
                                                  child: SvgPicture.asset(
                                                    "assets/icons/facebook_icon.svg",
                                                    semanticsLabel:
                                                        "Facebook Logo",
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
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.16),
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
                                                    Theme.of(context)
                                                        .primaryColor,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(16),
                                                  ),
                                                ),
                                              ),
                                              onPressed: () {
                                                print("Apple logo");
                                              },
                                              child: SvgPicture.asset(
                                                "assets/icons/apple_icon.svg",
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
                                        Navigator.of(context)
                                            .pushNamedAndRemoveUntil(
                                                appRoutes["signup_1"] ?? "",
                                                (route) => false);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Non hai un account?",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium,
                                          ),
                                          const Text(" "),
                                          Text(
                                            "Registrati",
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
