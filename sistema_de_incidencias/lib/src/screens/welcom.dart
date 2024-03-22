import 'dart:async';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  //final BuildContext context;
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double _opacity = 0.0;
  final double _containerHeight = 200.0;
  final double _containerWidth = 200.0;

  @override
  void initState() {
    super.initState();
    // Animación de entrada
    Timer(const Duration(microseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    // Animación de salida y navegación a la siguiente pantalla
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _opacity = 0.0;
      });
      Timer(const Duration(milliseconds: 800), () {
        Navigator.pushNamed(context, '/');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        opacity: _opacity,
        duration: const Duration(milliseconds: 800),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF02A9DA),
                Color(0xFF069BDF),
                Color(0xFF0F84D1),
                Color(0xFF186DDE),
              ],
            ),
          ),
          child: Center(
            child: AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(milliseconds: 800),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 1000),
                height: _containerHeight,
                width: _containerWidth,
                curve: Curves.easeOutQuad,
                child: Image.asset(
                  'assets/svg/logo2.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
