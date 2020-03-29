import 'package:flutter/material.dart';
import 'package:happyfamily/pages/auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
//                Container(
//                    padding: EdgeInsets.all(20),
//                    child: Text(_profile.toString())
//                ),
//                Text(_loading.toString())
              ],
            )
        )
    );
  }
}

