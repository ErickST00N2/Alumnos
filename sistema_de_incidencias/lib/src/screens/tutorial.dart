import 'package:flutter/material.dart';
import 'package:sistema_de_incidencias/src/widgets/menu_lateral.dart';

class Tutorial extends StatefulWidget {
  const Tutorial({super.key});

  @override
  State<Tutorial> createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Datos del Maestro",
          style: TextStyle(
              fontFamily: AutofillHints.jobTitle,
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: const Color.fromRGBO(2, 169, 218, 1),
      ),
      drawer: const MenuLateral(),
    );
  }
}
