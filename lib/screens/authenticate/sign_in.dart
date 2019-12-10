import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign In to Brew Crew'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: Text(
              'Sign Up',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                validator: (value) =>
                    value.isEmpty ? 'Enter an email address' : null,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                validator: (value) => value.length < 6
                    ? 'Password should be more then 6 chars'
                    : null,
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                color: Colors.brown[700],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () async {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }
                  var result = await _auth.signIn(email, password);
                  if (result == null) {
                    setState(() {
                      error = 'Could not sign in with these credentials';
                    });
                  }
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                error,
                style: TextStyle(
                  color: Colors.red[400],
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
