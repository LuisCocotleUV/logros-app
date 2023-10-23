import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logros_app/pages/home_page.dart';
import 'package:logros_app/pages/login_or_register_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // Si el usuario está logeado
          if (snapshot.hasData) {
            return HomePage();
          }

          // Si el usuario NO está logeado
          else {
            return LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
