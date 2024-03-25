import 'dart:async';

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:mi_credencial_digital/src/providers/user.dart';
import 'package:mi_credencial_digital/src/util/colors_aplication/colores.dart';
import 'package:mi_credencial_digital/src/widgets/credential/camera_credential.dart';
import 'package:mi_credencial_digital/src/widgets/credential/credential_back.dart';
import 'package:mi_credencial_digital/src/widgets/credential/credential_front.dart';
import 'package:mi_credencial_digital/src/widgets/credential/send_image_picker.dart';
import 'package:mi_credencial_digital/src/widgets/menu/menu.dart';
import 'package:mi_credencial_digital/src/widgets/pie_pagina/pie_pagina.dart';
import 'package:provider/provider.dart';

class MyCredentialPage extends StatefulWidget {
  const MyCredentialPage({super.key});

  @override
  State<MyCredentialPage> createState() => _MyCredentialPageState();
}

class _MyCredentialPageState extends State<MyCredentialPage> {
  ColoresApp cAplication = ColoresApp();
  String result = '';

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
        backgroundColor: cAplication.colorDelAppBar,
        title: const Text('Credencial Digital'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : SingleChildScrollView(
              //padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildDataContent(
                        context, _user!, _controllerGestureFlipCardCredential),
                    const PiePagina()
                  ],
                ),
              ),
            ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancela el timer cuando el widget se desecha
    super.dispose();
    loadStudentData(context);
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

  Widget buildDataContent(BuildContext context, databaseUser,
      GestureFlipCardController controllerGestureFlipCardCredential) {
    const double pi = math.pi;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: GestureFlipCard(
              controller: controllerGestureFlipCardCredential,
              axis: FlipAxis.vertical,
              enableController: true,
              animationDuration: const Duration(milliseconds: 1800),
              frontWidget: buildCardFront(context, databaseUser, pi),
              backWidget: buildCardBack(context, databaseUser, pi),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const Expanded(
                flex: 1,
                child: SizedBox(width: 20),
              ),
              Expanded(
                flex: 3,
                child: TextButton.icon(
                  icon: const Icon(Icons.flip_to_back),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      elevation: 2,
                      minimumSize: const Size(120, 50)),
                  label: const Text('Voltear Credencial'),
                  onPressed: () {
                    // Flip the card programmatically

                    controllerGestureFlipCardCredential.flipcard();
                  },
                ),
              ),
              Expanded(flex: 3, child: CameraCredential()),
              const Expanded(
                flex: 1,
                child: SizedBox(width: 20),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SendImagePicker(),
        ],
      ),
    );
  }
}
