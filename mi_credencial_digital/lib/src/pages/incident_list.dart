import 'package:flutter/material.dart';
import 'package:mi_credencial_digital/src/widgets/menu/menu.dart';

class IncidentListPage extends StatelessWidget {
  const IncidentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: const Center(
        child: Text('Este es incident list'),
      ),
    );
  }
}
