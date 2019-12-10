import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constants.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formkey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];
  String _currentName;
  String _currentSugar;
  int _currentStrength;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          Text(
            'Update your brew settings',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Name'),
            validator: (value) => value.isEmpty ? 'Name is required' : null,
            onChanged: (value) => setState(() => _currentName = value),
          ),
          SizedBox(
            height: 10.0,
          ),
          DropdownButtonFormField(
            value: _currentSugar ?? '0',
            items: sugars
                .map(
                  (s) => DropdownMenuItem(
                    value: s,
                    child: Text('$s sugars'),
                  ),
                )
                .toList(),
            onChanged: (value) => setState(() => _currentSugar = value),
            decoration: textInputDecoration,
          ),
          SizedBox(
            height: 10.0,
          ),
          Slider(
            value: (_currentStrength ?? 100).toDouble(),
            activeColor: Colors.brown[_currentStrength ?? 100],
            inactiveColor: Colors.brown[_currentStrength ?? 100],
            min: 100,
            max: 900,
            divisions: 8,
            onChanged: (value) => setState(() => _currentStrength = value.round()),
          ),
          SizedBox(
            height: 10.0,
          ),
          FlatButton(
            color: Colors.brown[700],
            child: Text(
              'Update',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
