import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:mi_credencial_digital/src/widgets/credential/camera_credential.dart';
import 'package:mi_credencial_digital/src/widgets/credential/credential_back.dart';
import 'package:mi_credencial_digital/src/widgets/credential/credential_front.dart';

///@ErickST00N
///[buildDataContent] En la función buildDataTeacherContent es la CredentialCard
///que se muestra en la pantalla.
///Esta card es la responsable de unir los contenidos de los dos widget back y front.
///[context] - recibe el contexto de la aplicación cuando se llama a esta funcion.
///[progressIndicator] - Indica que se debe mostrar un indicador de carga.
///[databaseUser] - Los datos del usuario almacenados en la base de datos.
///[controllerGestureFlipCardCredential] - El controlador de la card.
///La card es flippable.
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
            const Expanded(
              flex: 1,
              child: SizedBox(width: 20),
            ),
            Expanded(
              flex: 3,
              child: TextButton.icon(
                  onPressed: () => onSubmitCameraPhoto(context, '/camera'),
                  icon: const Icon(Icons.camera),
                  label: const Text('Tomar Foto')),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(width: 20),
            ),
          ],
        ),
      ],
    ),
  );
}

void onSubmitCameraPhoto(BuildContext context, String routeName) async {
  //TODO: implement onPressed para tomar la foto en el cual cambiará la foto

  var res = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraCredential(),
      ));
}
