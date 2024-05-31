import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackathon2024/auth/auth.dart';
import 'package:hackathon2024/main.dart';
import 'package:hackathon2024/pages/login_page.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree>  {
  @override
  Widget build(BuildContext context)  {
    return StreamBuilder(
      stream: Auth(FirebaseAuth.instance).authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData)  {
          return const MyHomePage(title: 'Flutter Demo Home Page');
        } else {
          return const LoginPage();
        }
      },
    );
  }
}