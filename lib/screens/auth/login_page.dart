import 'package:flutter/material.dart';
import 'package:medical_app/screens/auth/signup_page.dart';
import 'package:medical_app/utils/color.dart';

import '../../widgets/my_button.dart';
import '../../widgets/my_text_field.dart';
import '../../widgets/square_tile.dart';

import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //sign in method
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void goTo(context, page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Icon(
                  Icons.medical_services_outlined,
                  size: 80,
                  color: primary,
                ),

                const SizedBox(
                  height: 20,
                ),
                //welcome

                Text(
                  "Bienvenue, se connecter",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //username

                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                ),

                const SizedBox(
                  height: 20,
                ),
                //password
                MyTextField(
                  controller: passwordController,
                  hintText: "Mot de passe",
                  obscureText: true,
                ),

                const SizedBox(
                  height: 20,
                ),

                //forgot password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Mot de passe oublié ?",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                //Sign in Button
                MyButton(onTap: () => signIn(), text: "Se connecter"),

                const SizedBox(
                  height: 20,
                ),

                //continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "Ou continuer avec ",
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 17),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                //icons buttons
                const SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SquareTile(imagePath: 'lib/images/google.png'),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),

                //register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Pas encore inscrit ?",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () => goTo(context, SignupPage()),
                      child: const Text(
                        "S'inscrire maintenant",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
