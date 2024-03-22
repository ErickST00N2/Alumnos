import 'package:flutter/material.dart';
import 'package:mi_credencial_digital/src/widgets/menu/menu.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      appBar: AppBar(
        title: const Text('About Page'),
      ),
      body: const Center(
        child: Text('AboutPage'),
      ),
    );
  }
}
