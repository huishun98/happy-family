import 'package:flutter/material.dart';
import 'package:happyfamily/pages/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Text('Login with Google'),
          ),
        ],
      )
    );
  }
}



