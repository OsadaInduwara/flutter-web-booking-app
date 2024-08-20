import 'package:flutter/material.dart';

import '../auth services/auth_service.dart';

class AdminHomePage extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
        actions: <Widget>[
          TextButton(
            child: Text('Logout', style: TextStyle(color: Colors.white)),
            onPressed: () async {
              await _auth.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          )
        ],
      ),
      body: Center(
        child: Text('Welcome to the Admin Panel'),
      ),
    );
  }
}