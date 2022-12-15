
import 'package:flutter/material.dart';
import 'package:notes_application/app/screens/auth_screens/sign_in_page.dart';
import 'package:notes_application/app/screens/notes_home_screen/notes_home_screen.dart';

import 'authWidget.dart';

// ignore: must_be_immutable
class AuthCheck extends StatefulWidget {

  const AuthCheck({Key? key})
      : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthWidget(
        signedInBuilder: (context) => NotesHomeScreen(),
        nonSignedInBuilder: (_) => const SignInPage(),
      ),
    );
  }
}
