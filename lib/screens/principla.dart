import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nasaimagen/screens/login.dart';

class PrinciplaScreen extends StatelessWidget {
  User? user;
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;

  PrinciplaScreen(
      {super.key, this.user, required this.auth, required this.googleSignIn});

  @override
  Widget build(BuildContext context) {
    Future cerrarSecion() async {
      try {
        await auth.signOut();
        if (await googleSignIn.isSignedIn()) {
          await googleSignIn.signOut();
          user = null;
          // ignore: use_build_context_synchronously
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const LoginScreen()));
        }
      } catch (e) {
        return null;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('IMAGENES DE LA NASA')),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Gmil: "),
            Text(user!.email ?? 'no tiene email'),
            const Text('Nombre:'),
            Text(user!.displayName ?? 'no tiene nombre'),
            ElevatedButton(
                onPressed: () {
                  cerrarSecion();
                },
                child: const Text('Cerrar secion'))
          ],
        ),
      ),
    );
  }
}
