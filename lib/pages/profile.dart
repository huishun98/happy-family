import 'package:flutter/material.dart';
import 'package:happyfamily/pages/auth.dart';

class Profile extends StatelessWidget {

  final String email;
  final String username;

  Profile({this.username, this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: Text('Home'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: <Widget>[
            
            MaterialButton(
              onPressed: () => authService.signOut(),
              color: Colors.grey[700],
              textColor: Colors.white,
              child: Text('Logout'),
            ),
          ],
        )
    );
  }
}
