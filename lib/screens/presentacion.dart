import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PresentacionPage extends StatefulWidget {
  const PresentacionPage({super.key});

  @override
  State<PresentacionPage> createState() => _PresentacionPageState();
}

class _PresentacionPageState extends State<PresentacionPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navegacionToLogin();
  }

  Future<void> _navegacionToLogin() async {
    await Future.delayed(const Duration(seconds: 4));
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    final sizeW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/fondo1.png"),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "NASA - IMAGENES",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: sizeH * 0.4,
              width: sizeW * 0.9,
              child: Lottie.asset('assets/images/loadin.json'),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text("Cargando......"),
          ],
        ),
      ),
    );
  }
}
