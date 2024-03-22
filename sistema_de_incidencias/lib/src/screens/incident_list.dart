import 'package:flutter/material.dart';
import 'package:sistema_de_incidencias/src/widgets/menu_lateral.dart';
import '../widgets/list_item.dart'; // Importa el widget de elemento de lista personalizado

class IncidentList extends StatelessWidget {
  const IncidentList({super.key}); // Constructor de la clase IncidentList

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Devuelve un Scaffold que contiene la estructura de la pantalla
      appBar: AppBar(
        // AppBar de la pantalla
        title: const Text(
          // Título de la AppBar
          "Lista de Incidencias", // Texto del título
          style: TextStyle(
              // Estilo del texto del título
              fontFamily: AutofillHints.jobTitle, // Fuente del texto
              color: Color.fromARGB(255, 255, 255, 255)), // Color del texto
        ),
        backgroundColor:
            const Color.fromRGBO(2, 169, 218, 1), // Color de fondo de la AppBar
      ),
      drawer: const MenuLateral(), // Menú lateral de la pantalla
      body: ListView(
        // Cuerpo de la pantalla, una columna con elementos de lista
        children: const <Widget>[
          ListItem(
            // Primer elemento de lista
            nameAlumn: "TSU. Erick Gonzalez Cortes", // Nombre del alumno
            especialidad: "Programacion", // Especialidad del alumno
            grupo: "A", // Grupo del alumno
            semestre: "6", // Semestre del alumno
            description:
                "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Inventore, impedit dolore. Placeat reprehenderit laboriosam provident, nihil quidem tempore, a sapiente veritatis natus eligendi aut eos incidunt dolorum aperiam rem fugit!", // Descripción del elemento de lista
          ),
          ListItem(
            // Segundo elemento de lista
            nameAlumn:
                "ING. Jose Alejandro Hernandez Rivera", // Nombre del alumno
            especialidad: "Programacion", // Especialidad del alumno
            grupo: "A", // Grupo del alumno
            semestre: "6", // Semestre del alumno
            description:
                "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Inventore, impedit dolore. Placeat reprehenderit laboriosam provident, nihil quidem tempore, a sapiente veritatis natus eligendi aut eos incidunt dolorum aperiam rem fugit!", // Descripción del elemento de lista
          ),
          ListItem(
            // Primer elemento de lista
            nameAlumn: "TSU. Erick Gonzalez Cortes", // Nombre del alumno
            especialidad: "Programacion", // Especialidad del alumno
            grupo: "A", // Grupo del alumno
            semestre: "6", // Semestre del alumno
            description:
                "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Inventore, impedit dolore. Placeat reprehenderit laboriosam provident, nihil quidem tempore, a sapiente veritatis natus eligendi aut eos incidunt dolorum aperiam rem fugit!", // Descripción del elemento de lista
          ),
          ListItem(
            // Segundo elemento de lista
            nameAlumn:
                "ING. Jose Alejandro Hernandez Rivera", // Nombre del alumno
            especialidad: "Programacion", // Especialidad del alumno
            grupo: "A", // Grupo del alumno
            semestre: "6", // Semestre del alumno
            description:
                "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Inventore, impedit dolore. Placeat reprehenderit laboriosam provident, nihil quidem tempore, a sapiente veritatis natus eligendi aut eos incidunt dolorum aperiam rem fugit!", // Descripción del elemento de lista
          ),
        ],
      ),
    );
  }
}
