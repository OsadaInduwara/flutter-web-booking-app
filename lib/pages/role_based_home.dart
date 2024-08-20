import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth services/firestore_service.dart';
import 'AdminHomePage.dart';
import 'PrimaryUserHomePage.dart';

class RoleBasedHome extends StatelessWidget {
  final User user;

  const RoleBasedHome({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: FirestoreService().getUserRole(user),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        final role = snapshot.data;
        if (role == 'admin') {
          return AdminHomePage();
        } else {
          return PrimaryUserHomePage();
        }
      },
    );
  }
}



