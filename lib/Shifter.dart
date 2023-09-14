import 'package:flutter/material.dart';

import 'Auth/Auth.dart';
import 'Auth/AuthPage.dart';
import 'Pages/Navigation.dart';

class Shifter extends StatelessWidget {
  const Shifter({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Navigation();
          } else {
            return const AuthPage();
          }
        });
  }
}
