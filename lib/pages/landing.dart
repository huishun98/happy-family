import 'package:flutter/material.dart';
import 'package:happyfamily/pages/auth.dart';
import 'package:happyfamily/pages/login.dart';
import 'package:happyfamily/pages/home.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {

  Map<String, dynamic> _profile;
  bool _loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authService.profile
      .listen((state) => setState(() => _profile = state));
    authService.loading
        .listen((state) => setState(() => _loading = state));
  }

  @override
  Widget build(BuildContext context) {
    return Home()
  }
}
