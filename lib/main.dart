import 'package:flutter/material.dart';
import 'package:happyfamily/pages/loading.dart';
import 'package:happyfamily/pages/landing.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Landing(),
    '/loading': (context) => Loading(),
  },

));

