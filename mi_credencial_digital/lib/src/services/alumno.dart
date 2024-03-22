import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:mi_credencial_digital/src/services/auth.dart';

class Maestro extends ChangeNotifier {
  static final Maestro _instancia = Maestro._private();

  final AuthService authService = AuthService();
  //late DocumentSnapshot _userDoc;

  /// Coleccion: Maestros
  /// @param [idmaestros] - Identificador y referencia de la coleccion Maestros. Ej: de uso.
  /// podemos utilizar el id de la coleccion o referencia para acceder a la informacion de la coleccion.
  DocumentReference? idmaestros;
  String uid = '';
  String claveMaestro = '';
  String nombre = 'Cargando...';
  String curp = '';
  String photoURL = 'assets/webp/blank-profile-picture-973460_960_720.webp';
  String correo = '';
  String password = '';
  String direccion = '';
  String especialidad = '';
  int numTel = 0;

  /// Coleccion: ModificationOfCchoolCredential
  String typeSystem = '';
  String turn = '';
  String dateEmition = '';
  String schoolCycle = '';

  String nivelEducativo = '';

  factory Maestro() {
    return _instancia;
  }

  Maestro._private();

  Future<void> getMaestroData(User? firebaseUser) async {
    try {
      if (firebaseUser == null) {
        throw Exception("El usuario de Firebase es nulo.");
      }
      //Maestros
      DocumentSnapshot maestroSnapshot = await authService.db
          .collection('Alumnos')
          .doc(firebaseUser.uid)
          .get();

      // ModificationOfCchoolCredential
      DocumentSnapshot modificationOfCchoolCredentialSnapshot =
          await authService.db
              .collection('ModificationOfCchoolCredential')
              .doc('jf7Pdk4pcks2DBufia5U')
              .get();

      if (!maestroSnapshot.exists) {
        throw Exception("El documento del maestro no existe.");
      }

      Map<String, dynamic> data =
          maestroSnapshot.data() as Map<String, dynamic>;

      idmaestros = maestroSnapshot.reference;
      uid = data['uid'];
      claveMaestro = data['ClaveMaestro'];
      curp = data['CURP'];
      nombre = data['Nombre'];
      correo = data['Correo'];
      password = data['Password'];
      direccion = data['Direccion'];
      especialidad = data['Especialidad'];
      numTel = data['NumeroTel'];
      nivelEducativo = data['NivelEducativo'];

      //ModificationOfCchoolCredential
      typeSystem = modificationOfCchoolCredentialSnapshot['TypeSystem'];
      turn = modificationOfCchoolCredentialSnapshot['Turn'];

      dateEmition = DateFormat('dd/MM/yyyy').format(
          modificationOfCchoolCredentialSnapshot['DateEmition'].toDate());

      schoolCycle = modificationOfCchoolCredentialSnapshot['SchoolCycle'];
      if (kDebugMode) {
        print(
            'el tipo de sistema es $typeSystem, el turno es $turn, la fecha de emisión es $dateEmition, el ciclo escolar es $schoolCycle');
      }
      notifyListeners();
    } catch (e) {
      // TODO: (DEBUG) Retirar el print despues al subirlo a producción.
      if (kDebugMode) {
        print('Ocurrió un error al obtener los datos del maestro: $e');
      }
      // Puedes manejar el error de acuerdo a tus necesidades
    }
  }

  ImageProvider getPhotoURL() {
    if (photoURL.isNotEmpty &&
        photoURL != 'assets/webp/blank-profile-picture-973460_960_720.webp') {
      return NetworkImage(photoURL);
    } else {
      return const AssetImage(
          'assets/webp/blank-profile-picture-973460_960_720.webp');
    }
  }

  Image getPhotoURL2() {
    if (photoURL.isNotEmpty &&
        photoURL != 'assets/webp/blank-profile-picture-973460_960_720.webp') {
      return Image.network(photoURL);
    } else {
      return Image.asset(
          'assets/webp/blank-profile-picture-973460_960_720.webp');
    }
  }

  void setPhotoURL(String url) {
    photoURL = url;
    notifyListeners();
  }
}
