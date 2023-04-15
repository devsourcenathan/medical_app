import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medical_app/widgets/my_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sign in as " + user.email!),
            MyButton(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
                text: "Sign out"),
          ],
        ),
      ),
    );
  }
}
