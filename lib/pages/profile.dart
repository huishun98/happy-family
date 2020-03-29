import 'package:flutter/material.dart';
import 'package:happyfamily/pages/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

//TODO - save data to local storage when loaded so it doens't refresh everytime.

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  String photo;
  String username = 'Loading...';
  String email = 'Loading...';

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    setState(() {
      username = user.displayName;
      email = user.email;
      photo = user.photoUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.grey[800],
                  backgroundImage: NetworkImage('$photo'),
                  radius: 40.0,
                ),
              ),
              Divider(
                height: 40.0,
                color: Colors.grey[800],
              ),
              Text(
                'NAME',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 1.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                '$username',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30.0),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.email,
                    color: Colors.grey[400],
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    '$email',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              MaterialButton(
                onPressed: () => authService.signOut(),
                color: Colors.grey[700],
                textColor: Colors.white,
                child: Text('Logout'),
              ),
            ],
          ),
        )
    );
  }
}
