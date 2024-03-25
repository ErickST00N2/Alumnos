import 'package:flutter/material.dart';

class IncidentListProvider with ChangeNotifier {
  static final IncidentListProvider _instancia =
      IncidentListProvider._private();
  factory IncidentListProvider() {
    return _instancia;
  }
  IncidentListProvider._private();
  String _title = 'Cargando...';
  String get title => _title;
  set title(String value) => _title = value;
  String _subtitle = 'Cargando...';
  String get subtitle => _subtitle;
  set subtitle(String value) => _subtitle = value;
  String _image = 'assets/webp/blank-profile-picture-973460_960_720.webp';
  String get image => _image;
  set image(String value) => _image = value;
  String _description = 'Cargando...';
  String get description => _description;
  set description(String value) => _description = value;
  String _status = 'Cargando...';
  String get status => _status;
  set status(String value) => _status = value;
  String _time = 'Cargando...';
  String get time => _time;
  set time(String value) => _time = value;
  String _type = 'Cargando...';
  String get type => _type;
  set type(String value) => _type = value;
  String _place = 'Cargando...';
  String get place => _place;
  set place(String value) => _place = value;
  String _location = 'Cargando...';
  String get location => _location;
  set location(String value) => _location = value;
  String _image2 = 'assets/webp/blank-profile-picture-973460_960_720.webp';
  String get image2 => _image2;
  set image2(String value) => _image2 = value;
  String _image3 = 'assets/webp/blank-profile-picture-973460_960_720.webp';
  String get image3 => _image3;
  set image3(String value) => _image3 = value;
  String _image4 = 'assets/webp/blank-profile-picture-973460_960_720.webp';
  String get image4 => _image4;
  set image4(String value) => _image4 = value;
}
