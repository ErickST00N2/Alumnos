import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:mi_credencial_digital/src/widgets/menu/menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        title: const Text('Credencial QR'),
      ),
      body: const Center(
        child: Text('HomePage'),
      ),
    );
  }
}
