// // import 'package:flutter/material.dart';
// // import 'package:google_sign_in/google_sign_in.dart';
// // import '../../auth services/auth_service.dart';
// // import 'register_page.dart';
// // import 'reset_password_page.dart';
// //
// // class LoginPage extends StatefulWidget {
// //   const LoginPage({Key? key}) : super(key: key);
// //
// //   @override
// //   _LoginPageState createState() => _LoginPageState();
// // }
// //
// // class _LoginPageState extends State<LoginPage> {
// //   final TextEditingController _emailController = TextEditingController();
// //   final TextEditingController _passwordController = TextEditingController();
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _initializeGoogleSignIn();
// //   }
// //
// //   Future<void> _initializeGoogleSignIn() async {
// //     try {
// //       await GoogleSignIn().signInSilently();
// //     } catch (error) {
// //       print('Google Sign-In Initialization Failed: $error');
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text("Login")),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             TextField(
// //               controller: _emailController,
// //               decoration: const InputDecoration(labelText: 'Email'),
// //             ),
// //             TextField(
// //               controller: _passwordController,
// //               decoration: const InputDecoration(labelText: 'Password'),
// //               obscureText: true,
// //             ),
// //             ElevatedButton(
// //               onPressed: () async {
// //                 await AuthService().signInWithEmail(
// //                   _emailController.text.trim(),
// //                   _passwordController.text.trim(),
// //                 );
// //               },
// //               child: const Text("Login"),
// //             ),
// //             TextButton(
// //               onPressed: () {
// //                 Navigator.of(context).push(MaterialPageRoute(
// //                     builder: (context) => const ResetPasswordPage()));
// //               },
// //               child: const Text("Forgot Password?"),
// //             ),
// //             TextButton(
// //               onPressed: () {
// //                 Navigator.of(context).push(MaterialPageRoute(
// //                     builder: (context) => const RegisterPage()));
// //               },
// //               child: const Text("Create an Account"),
// //             ),
// //             ElevatedButton(
// //               onPressed: () async {
// //                 try {
// //                   await AuthService().signInWithGoogle();
// //                 } catch (error) {
// //                   print('Google Sign-In Failed: $error');
// //                 }
// //               },
// //               child: const Text("Login with Google"),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import '../../auth services/auth_service.dart';
// import 'register_page.dart';
// import 'reset_password_page.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Login")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: const InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: _passwordController,
//               decoration: const InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 await AuthService().signInWithEmail(
//                   _emailController.text.trim(),
//                   _passwordController.text.trim(),
//                 );
//               },
//               child: const Text("Login"),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => const ResetPasswordPage()));
//               },
//               child: const Text("Forgot Password?"),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => const RegisterPage()));
//               },
//               child: const Text("Create an Account"),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 await AuthService().signInWithGoogle();
//               },
//               child: const Text("Login with Google"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//
// }
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../auth services/auth_service.dart';
import 'register_page.dart';
import 'reset_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String error = '';

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isLargeScreen = screenWidth > 600;

    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          constraints: BoxConstraints(
            maxWidth: isLargeScreen ? 400.0 : screenWidth * 0.8,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
                style: TextStyle(color: Colors.black),
                obscureText: true,
              ),
              SizedBox(height: 10.0),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.orange),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ResetPasswordPage()));
                  },
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 15.0),
                ),
                child: Text('Login'),
                onPressed: () async {
                  try {
                    await AuthService().signInWithEmail(
                      _emailController.text.trim(),
                      _passwordController.text.trim(),
                    );
                    Navigator.pushReplacementNamed(context, '/home');
                  } catch (error) {
                    setState(() => this.error = 'Login failed');
                  }
                },
              ),
              SizedBox(height: 12.0),
              TextButton(
                child: Text(
                  'Need an account? Register',
                  style: TextStyle(color: Colors.orange),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const RegisterPage()));
                },
              ),
              SizedBox(height: 12.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 15.0),
                ),
                child: Text('Login with Google'),
                onPressed: () async {
                  try {
                    await AuthService().signInWithGoogle();
                    Navigator.pushReplacementNamed(context, '/home');
                  } catch (error) {
                    setState(() => this.error = 'Google Sign-In failed');
                  }
                },
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
