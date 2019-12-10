import 'package:brew_crew/screens/authenticate/register.dart';
import 'package:brew_crew/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool doShowSignInWidget = true;

  void toggleView() {
    setState(() {
      doShowSignInWidget = !doShowSignInWidget;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (doShowSignInWidget) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
