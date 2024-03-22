import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String nameAlumn; // Nombre del alumno
  final String description; // Descripción del incidente
  final String linkFotoPerfil; // Enlace a la foto de perfil del alumno
  final String especialidad; // Especialidad del alumno
  final String grupo; // Grupo del alumno
  final String semestre; // Semestre del alumno

  const ListItem({
    super.key,
    // Valores predeterminados para los parámetros opcionales
    this.linkFotoPerfil = "assets/backgrounds/IMG-20230817-WA0073.jpg",
    this.description = "Aquí se coloca la descripción del Incidente",
    this.nameAlumn = '<Nombre del Alumno>',
    this.especialidad = "<Especialidad>",
    this.grupo = '<Grupo del Alumno>',
    this.semestre = '<Semestre del Alumno>',
  });

  @override
  Widget build(BuildContext context) {
    return _buildPanel();
  }

  _buildPanel() {
    return GestureDetector(
      onTap: _onTap, // Callback que se llama cuando se toca el elemento
      child: Card(
        child: ListTile(
          leading: Image.asset(linkFotoPerfil), // Imagen de perfil del alumno
          title: Text(
              "$nameAlumn // $semestre$grupo // $especialidad"), // Título del elemento
          subtitle: Text(description), // Subtítulo del elemento
          trailing: PopupMenuButton<int>(
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.view_comfy_rounded,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Ver mas...",
                    ),
                  ],
                ),
              ),
            ],
          ),
          //const Icon(Icons.more_vert_sharp), // Icono al final del elemento
          isThreeLine:
              true, // Indica si el elemento tiene tres líneas de contenido
        ),
      ),
    );
  }

  void _onTap() {
    // Manejo de la acción al tocar el elemento
  }
}
