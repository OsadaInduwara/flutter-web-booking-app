import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUser(User user, String name) async {
    await _db.collection('users').doc(user.uid).set({
      'name': name,
      'email': user.email,
      'role': 'primary_user',  // Default role
    });
  }

  Future<String?> getUserRole(User user) async {
    DocumentSnapshot doc = await _db.collection('users').doc(user.uid).get();
    return doc['role'] as String?;
  }
}
