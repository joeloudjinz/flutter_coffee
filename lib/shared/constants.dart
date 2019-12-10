import 'package:flutter/material.dart';

InputDecoration textInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 2.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.brown[700],
      width: 2.0,
    ),
  ),
);
