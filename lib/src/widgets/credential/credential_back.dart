import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';

/// [buildCardBack] - Método que construye la tarjeta back de credenciales del maestro.
Widget buildCardBack(BuildContext context, databaseUser, double pi) {
  /// [size] - Es el tamaño de la pantalla que se obtiene del dispositivo.
  final size = MediaQuery.of(context).size;

  /// [maxWidthScreenCard] - Evaluamos la anchura de la pantalla para saber si
  /// nuestra credencial tendrá un ancho maximo de 700 pixeles o si sigue con
  /// el valor por defecto de 0.95.
  final maxWidthScreenCard =
      (size.width > 800.0) ? (800.0) : (size.width * 0.95);

  /// [relacionCredentialCardAspecto12] - Calculamos la relacion entre el ancho de la pantalla.
  final relacionCredentialCardAspecto12 = maxWidthScreenCard; //Equivalente a 12

  /// [relacionCredentialCardAspecto8] - Calculamos la relacion entre el alto de la pantalla.
  final relacionCredentialCardAspecto8 =
      relacionCredentialCardAspecto12 / 12 * 8; // Equivale a 8

  Map<String, String> semestre = {
    '1': 'PRIMER SEMESTRE',
    '2': 'SEGUNDO SEMESTRE',
    '3': 'TERCER SEMESTRE',
    '4': 'CUARTO SEMESTRE',
    '5': 'QUINTO SEMESTRE',
    '6': 'SEXTO SEMESTRE',
  };

  /// [typeSystem] - Tipo de sistema
  String typeSystem = databaseUser.typeSystem;

  /// [turn] - Turno
  String turn = databaseUser.turn;

  /// [dateEmition] - Fecha de emision
  String dateEmition = databaseUser.dateEmition;

  /// [schoolCycle] - Ciclo escolar
  String schoolCycle = databaseUser.schoolCycle;
  return Card(
    //color: cAplication.colorDeFondoCredenciales,
    elevation: 6,
    semanticContainer: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: SizedBox(
      width: relacionCredentialCardAspecto12,
      height: relacionCredentialCardAspecto8,
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Flex(
                  direction: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Aqui va el tipo de sistema y el turno
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 8,
                      child: Flex(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        direction: Axis.vertical,
                        children: [
                          AutoSizeText(
                            typeSystem,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                            maxLines: 1,
                            minFontSize: 2,
                          ),
                          AutoSizeText(
                            turn,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                            maxLines: 1,
                            minFontSize: 2,
                          )
                        ],
                      ),
                    ),

                    // Aqui va la fecha de emision y ciclo escolar
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 4,
                      child: Flex(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        direction: Axis.vertical,
                        children: [
                          //Aqui va la fecha de emision
                          Flexible(
                            fit: FlexFit.loose,
                            flex: 1,
                            child: Flex(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                direction: Axis.vertical,
                                children: [
                                  const AutoSizeText(
                                    "FECHA DE EMISION",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 8,
                                    ),
                                    maxLines: 1,
                                    minFontSize: 5,
                                  ),
                                  AutoSizeText(
                                    dateEmition,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 7,
                                    ),
                                    maxLines: 1,
                                    minFontSize: 4,
                                  ),
                                ]),
                          ),

                          //Aqui va el ciclo escolar
                          Flexible(
                            fit: FlexFit.loose,
                            flex: 1,
                            child: Flex(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                direction: Axis.vertical,
                                children: [
                                  const AutoSizeText(
                                    "CICLO ESCOLAR",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 8,
                                    ),
                                    maxLines: 1,
                                    minFontSize: 5,
                                  ),
                                  AutoSizeText(
                                    schoolCycle,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 7,
                                    ),
                                    maxLines: 1,
                                    minFontSize: 2,
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Flex(
                        direction: Axis.vertical,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: SizedBox.expand(
                              child: Image.asset(
                                'assets/backgrounds/credential/logoDGTI.png',
                                scale: .1,
                                alignment: Alignment.centerLeft,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Flex(
                              direction: Axis.horizontal,
                              children: <Widget>[
                                Text(
                                  '${semestre[databaseUser.semestre]}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xFF0F84D1)),
                                color: Colors.white,
                              ),
                              child: SizedBox.expand(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text('Firma del Alumno'.toUpperCase())
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: QrImageView(
                      key: const Key('QrImage'),
                      gapless: true,
                      padding: const EdgeInsets.all(20.0),
                      data: databaseUser.numControl.toString(),
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: relacionCredentialCardAspecto12 * 0.9,
              decoration: BoxDecoration(
                border: Border.merge(
                  const Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(0, 254, 254, 255),
                    ),
                  ),
                  const Border(
                    top: BorderSide(
                      color: Color.fromARGB(255, 208, 223, 156),
                      width: 3,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
              child:
                  const Flex(direction: Axis.vertical, children: <AutoSizeText>[
                AutoSizeText(
                  'DIRECCION DEL PLANTEL',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 8),
                  minFontSize: 4,
                ),
                AutoSizeText(
                  'Fernando Hernández Carrasco S/N, Santa María Yancuitlalpan, 90500 Huamantla, Tlax.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 6),
                  maxLines: 1,
                  minFontSize: 3,
                ),
              ]),
            ),
          ),
        ],
      ),
    ),
  );
}
