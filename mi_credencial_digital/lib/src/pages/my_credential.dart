import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:mi_credencial_digital/src/providers/user.dart';
import 'package:mi_credencial_digital/src/util/colors_aplication/colores.dart';
import 'package:mi_credencial_digital/src/widgets/credential/credential_users.dart';
import 'package:mi_credencial_digital/src/widgets/menu/menu.dart';
import 'package:provider/provider.dart';

class MyCredentialPage extends StatefulWidget {
  const MyCredentialPage({super.key});

  @override
  State<MyCredentialPage> createState() => _MyCredentialPageState();
}

class _MyCredentialPageState extends State<MyCredentialPage> {
  ColoresApp cAplication = ColoresApp();
  Users? _user;
  Timer? _timer;
  bool _hasError = false;
  bool _isLoading = true; // Nuevo estado para controlar la carga de datos

  final _controllerGestureFlipCardCredential = GestureFlipCardController();

  @override
  Widget build(BuildContext context) {
    Users user = context.watch<Users>();
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        title: const Text('Credencial Digital'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : buildDataContent(
              context, _user!, _controllerGestureFlipCardCredential),
    );
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancela el timer cuando el widget se desecha
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    loadStudentData(context); // Llama a loadStudentData en initState

    _timer = Timer(const Duration(seconds: 10), () {
      // Si los datos no se han cargado después de 10 segundos, muestra un mensaje de error
      if (mounted) {
        setState(() {
          _hasError = true; // Aquí puedes manejar el estado de error
        });
      }
    });
  }

  Future<void> loadStudentData(BuildContext context) async {
    _user = context.read<Users>();
    await _user!.getUserData(_user!.authService.firebaseUser);

    // Actualiza el estado para indicar que la carga ha finalizado
    setState(() {
      _isLoading = false;
    });
  }
}
