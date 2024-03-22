import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sistema_de_incidencias/src/widgets/menu_lateral.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _opacity = 0.0;
  double _containerHeight = 200.0;
  double _containerWidth = 200.0;

  @override
  void initState() {
    super.initState();
    // Animación de entrada
    Timer(const Duration(microseconds: 100), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    // Animación de salida y navegación a la siguiente pantalla
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _containerHeight = 0;
        _containerWidth = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: const Duration(milliseconds: 800),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        height: _containerHeight,
        width: _containerWidth,
        curve: Curves.easeInOutExpo,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Sistema de Incidencias",
              style: TextStyle(
                  fontFamily: AutofillHints.jobTitle,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
            backgroundColor: const Color.fromRGBO(2, 169, 218, 1),
          ),
          drawer: const MenuLateral(),
          //drawerScrimColor: const Color.fromARGB(141, 126, 126, 126),
          body: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/svg/logo.png', // Ruta de la imagen del logo
                  scale: 1,
                  fit: BoxFit.fill,
                ),
                Container(
                    padding: const EdgeInsets.all(20),
                    child: ListView(
                      children: const <Widget>[],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
