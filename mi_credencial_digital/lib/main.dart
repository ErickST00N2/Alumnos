import 'package:flutter/material.dart';
import 'package:mi_credencial_digital/src/app.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

//Librerias de firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

@override

///@ErickST00N
///@lexisdez@gmail.com
///[main] En la función principal estamos inicializando a firebase
///para poder conectar a la base de datos de la API
///Sistema de Reportes e incidencias
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (kIsWeb) {
    // Habilita la depuración remota en modo web
    // Esto permite que el navegador Edge se conecte al servidor de depuración de Flutter
    // Puedes encontrar la dirección URL en la consola cuando ejecutas `flutter run`
    // Por ejemplo, "http://localhost:XXXXX"
  }
  runApp(MyApp());
}
