import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mi_credencial_digital/src/services/auth.dart';

class Users with ChangeNotifier {
  static final Users _instancia = Users._private();
  final AuthService authService = AuthService();

  DocumentReference? carreras_idCarreras;
  String _uid = '';

  String _curp = 'Cargando...';

  String _semestre = 'Cargando...';

  String _grupo = 'Cargando...';

  /// Coleccion: ModificationOfCchoolCredential
  String _typeSystem = 'Cargando...';

  String _turn = 'Cargando...';

  String _dateEmition = 'Cargando...';

  String _schoolCycle = 'Cargando...';

  int _numControl = 0;

  String _nombre = 'Cargando...';

  String _photoURL = 'assets/webp/blank-profile-picture-973460_960_720.webp';

  String _correo = 'Cargando...';

  String _password = 'Cargando...';

  //String direccion = 'Cargando...';
  String _especialidad = 'Cargando...';

  int _numTel = 0;

  int _numTelPF1 = 0;

  int _numTelPF2 = 0;

  String _blooType = 'Cargando...';

  factory Users() {
    _instancia.getUserData(_instancia.authService.firebaseUser);
    return _instancia;
  }

  //String nivelEducativo = 'Cargando...';

  Users._private();

  String get blooType => _blooType;

  set blooType(String value) {
    _blooType = value;
    notifyListeners();
  }

  String get correo => _correo;

  set correo(String value) {
    _correo = value;
    notifyListeners();
  }

  String get curp => _curp;

  set curp(String value) {
    _curp = value;
    notifyListeners();
  }

  String get dateEmition => _dateEmition;

  set dateEmition(String value) {
    _dateEmition = value;
    notifyListeners();
  }

  String get especialidad => _especialidad;

  set especialidad(String value) {
    _especialidad = value;
    notifyListeners();
  }

  String get grupo => _grupo;

  set grupo(String value) {
    _grupo = value;
  }

  String get nombre => _nombre;

  set nombre(String value) {
    _nombre = value;
    notifyListeners();
  }

  int get numControl => _numControl;

  set numControl(int value) {
    _numControl = value;
    notifyListeners();
  }

  int get numTel => _numTel;

  set numTel(int value) {
    _numTel = value;
    notifyListeners();
  }

  int get numTelPF1 => _numTelPF1;

  set numTelPF1(int value) {
    _numTelPF1 = value;
    notifyListeners();
  }

  int get numTelPF2 => _numTelPF2;

  set numTelPF2(int value) {
    _numTelPF2 = value;
    notifyListeners();
  }

  String get password => _password;

  set password(String value) {
    _password = value;
    notifyListeners();
  }

  String get photoURL => _photoURL;

  //[String value] - [photoURL]
  set photoURL(String value) {
    _photoURL = value;
    notifyListeners();
  }

  Future setPhotoURL(String url, File file) async {
    Reference ref = FirebaseStorage.instance.ref(url);

    ref.putFile(file);
    photoURL = url;
    notifyListeners();
  }

  String get schoolCycle => _schoolCycle;

  set schoolCycle(String value) {
    _schoolCycle = value;
    notifyListeners();
  }

  String get semestre => _semestre;

  set semestre(String value) {
    _semestre = value;
  }

  String get turn => _turn;

  set turn(String value) {
    _turn = value;
    notifyListeners();
  }

  /// Coleccion: ModificationOfCchoolCredential
  String get typeSystem => _typeSystem;

  /// Coleccion: ModificationOfCchoolCredential
  set typeSystem(String value) {
    _typeSystem = value;
    notifyListeners();
  }

  String get uid => _uid;

  set uid(String value) {
    _uid = value;
    notifyListeners();
  }

  /// Obtiene la URL de descarga para un archivo en Firebase Cloud Storage.
  ///
  /// Esta función toma un [filePath] como parámetro, que representa
  /// la ruta del archivo en Firebase Cloud Storage. Devuelve un [Future]
  /// que se completa con la URL de descarga del archivo. Si ocurre algún
  /// error durante el proceso, lo captura y lanza una excepción con un
  /// mensaje descriptivo.
  ///
  /// El parámetro [filePath] es de tipo [String] y representa la ruta
  /// del archivo en Firebase Cloud Storage.
  ///
  /// Devuelve un [Future] que se completa con una [String] representando
  /// la URL de descarga del archivo.
  Future<String> getDownloadUrl(String filePath) async {
    try {
      // Obtiene una referencia al archivo en Firebase Cloud Storage
      Reference ref = FirebaseStorage.instance.ref(filePath);

      // Obtiene la URL de descarga del archivo
      String downloadURL = await ref.getDownloadURL();

      return downloadURL;
    } catch (error) {
      // Maneja cualquier error que pueda ocurrir durante el proceso
      debugPrint('Error al obtener la URL de descarga: $error');
      // Lanza una excepción con un mensaje descriptivo
      return throw Exception(
          "Error al obtener la URL de descarga del archivo $filePath: $error");
    }
  }

  ImageProvider getPhotoURL() {
    if (AuthService().status == AuthStatus.Authenticated &&
        photoURL.isNotEmpty &&
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

  Future<void> getUserData(User? firebaseUser) async {
    try {
      if (firebaseUser == null) {
        throw Exception("El usuario de Firebase es nulo.");
      }

      //Alumnos
      DocumentSnapshot studentSnapshot = await authService.db
          .collection('Alumnos')
          .doc(firebaseUser.uid)
          .get();

      // ModificationOfCchoolCredential
      DocumentSnapshot modificationOfCchoolCredentialSnapshot =
          await authService.db
              .collection('ModificationOfCchoolCredential')
              .doc('jf7Pdk4pcks2DBufia5U')
              .get();

      if (!studentSnapshot.exists) {
        throw Exception("El documento del Alumno no existe.");
      } else if (!modificationOfCchoolCredentialSnapshot.exists) {
        throw Exception("El documento de la credencial no existe.");
      }
      _instancia.setFromFireStore(studentSnapshot);
      //ModificationOfCchoolCredential
      typeSystem = modificationOfCchoolCredentialSnapshot['TypeSystem'];
      turn = modificationOfCchoolCredentialSnapshot['Turn'];

      dateEmition = DateFormat('dd/MM/yyyy').format(
          modificationOfCchoolCredentialSnapshot['DateEmition'].toDate());

      schoolCycle = modificationOfCchoolCredentialSnapshot['SchoolCycle'];
      notifyListeners();
      debugPrint(
          'el tipo de sistema es $typeSystem, el turno es $turn, la fecha de emisión es $dateEmition, el ciclo escolar es $schoolCycle');
    } catch (e) {
      debugPrint('Ocurrió un error al obtener los datos del Alumno: $e');
    }
  }

  void setFromFireStore(DocumentSnapshot userDoc) async {
    Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
    carreras_idCarreras = userDoc['Carreras_idCarreras'];
    nombre = userData['Nombre'];
    photoURL = await _instancia.getDownloadUrl(userData['photoURL']);
    correo = userData['Correo'];
    password = userData['Password'];
    //direccion = userData['Direccion'];
    especialidad = userData['Especialidad'];
    numTel = userData['TelAlumn'];
    numTelPF1 = userData['TelPadreF1'];
    numTelPF2 = userData['TelPadreF2'];
    numControl = userData['NumControl'];
    curp = userData['Curp'];
    semestre = userData['Semestre'];
    grupo = userData['Grupo'];

    //nivelEducativo = userData['nivelEducativo'];

    notifyListeners();
  }
}
