import 'package:flutter/material.dart';
import 'package:happyfamily/pages/auth.dart';
import 'package:happyfamily/pages/home.dart';
import 'package:happyfamily/pages/loading.dart';
import 'package:happyfamily/pages/profile.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {

  Map<String, dynamic> _profile;

  int _currentIndex = 0;
  final List<Widget> _children = [
    Home(),
    Profile()
  ];
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    authService.profile
      .listen((state) => setState(() => _profile = state));
    authService.loading
        .listen((state) => setState(() => _loading = state));
  }

  @override
  Widget build(BuildContext context) {
    if(_loading) {
      return Loading();
    }
    if (_profile?.isEmpty ?? true) {
      return Login();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text('Happy Family'),
        centerTitle: true,
        elevation: 0,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        backgroundColor: Colors.grey[900],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          )
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
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
                SignInButton(
                  Buttons.Google,
                  onPressed: () => authService.googleSignIn(),
                )
              ],
            )
        )
    );
  }
}
