import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'firestore_service.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signInWithEmail(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      // Handle errors here
    }
  }

  Future<void> registerWithEmail(String name, String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;
      if (user != null) {
        await FirestoreService().saveUser(user, name);
      }
    } catch (e) {
      // Handle errors here
    }
  }
  Future<void> sendPasswordReset(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      // Handle errors here
    }
  }
  Future<void> signInWithGoogle() async {
    try {
      // Create a new provider
      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      // Add additional scope (optional)
      googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');

      // Set custom parameters (optional)
      googleProvider.setCustomParameters({
        'login_hint': 'user@example.com'
      });

      // Trigger the authentication flow
      UserCredential userCredential = await FirebaseAuth.instance.signInWithPopup(googleProvider);

      // Get the user information from the UserCredential
      User? user = userCredential.user;

      if (user != null) {
        // Check if the user exists in Firestore
        DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

        if (!userDoc.exists) {
          // Save the user data to Firestore
          await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
            'name': user.displayName,
            'email': user.email,
            'photoURL': user.photoURL,
            'role': 'primary_user',  // Default role
            // Add any additional fields you need
          });
        }
      }
    } catch (error) {
      print('Google Sign-In Failed: $error');
      // Handle error accordingly
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
