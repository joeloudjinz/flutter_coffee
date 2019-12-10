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
    doShowSignInWidget = !doShowSignInWidget;
  }

  @override
  Widget build(BuildContext context) {
    return doShowSignInWidget
        ? SignIn(toggleView: toggleView)
        : Register(toggleView: toggleView);
  }
}
