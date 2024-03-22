import 'package:flutter/material.dart';

import 'package:sistema_de_incidencias/src/widgets/menu_lateral.dart';

class AddIncidents extends StatefulWidget {
  const AddIncidents({super.key});

  @override
  State<AddIncidents> createState() => _AddIncidentsState();
}

class _AddIncidentsState extends State<AddIncidents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Añadir Incidencia",
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
