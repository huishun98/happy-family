import 'package:flutter/material.dart';
import 'package:happyfamily/pages/auth.dart';
import 'package:happyfamily/pages/profile.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {

  Map<String, dynamic> _profile;
//  bool _loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authService.profile
      .listen((state) => setState(() => _profile = state));
//    authService.loading
//        .listen((state) => setState(() => _loading = state));
  }

  @override
  Widget build(BuildContext context) {
    if (_profile?.isEmpty ?? true) {
      return Login();
    }
    return Profile(
      username: _profile['displayName'],
      email: _profile['email'],
    );
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  onPressed: () => authService.googleSignIn(),
                  color: Colors.grey[700],
                  textColor: Colors.white,
                  child: Text('Login with Google'),
                ),
              ],
            )
        )
    );
  }
}
