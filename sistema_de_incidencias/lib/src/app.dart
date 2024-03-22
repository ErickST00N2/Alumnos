import 'package:flutter/material.dart';
import 'package:sistema_de_incidencias/src/screens/about.dart';
import 'package:sistema_de_incidencias/src/screens/add_incidents.dart';
import 'package:sistema_de_incidencias/src/screens/alum_incident.dart';
import 'package:sistema_de_incidencias/src/screens/data_teacher.dart';
import 'package:sistema_de_incidencias/src/screens/incident_list.dart';
import 'package:sistema_de_incidencias/src/screens/login.dart';
import 'package:sistema_de_incidencias/src/screens/my_home_page.dart';
import 'package:sistema_de_incidencias/src/screens/register.dart';
import 'package:sistema_de_incidencias/src/screens/tutorial.dart';
import 'package:sistema_de_incidencias/src/screens/welcom.dart';
//Screens

// Definición de constantes para valores de colores utilizados en la aplicación
const int fuerte = 0xFF186DDE;
const int fuerteMedio = 0xFF0F84D1;
const int medio = 0xFF069BDF;
const int bajo = 0xFF02A9DA;
const int error = 0xF99F0000;

const Color colorDelAppBar = Color.fromRGBO(2, 169, 218, 1);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String nameApp = 'Sistema de reportes de incidencias';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: nameApp, // Título de la aplicación
      //debugShowCheckedModeBanner: false,

      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(medio),
        primaryColorLight: const Color(bajo),
        colorScheme: const ColorScheme.light(
          //Normals colors
          primary: Color(fuerte),
          onPrimary: Color(fuerteMedio),
          secondary: Color(fuerteMedio),
          onSecondary: Color(fuerteMedio),
          tertiary: Color(medio),
          //onTertiary: Color(bajo),

          //Container Colors
          primaryContainer: Colors.white,
          //onPrimaryContainer: Colors.white10,
          secondaryContainer: Colors.white,

          errorContainer: Color(error),

          //Errors Colors
          error: Color(error),
          onError: Color.fromARGB(255, 255, 0, 0),
        ),
        buttonTheme: const ButtonThemeData(
            colorScheme: ColorScheme.light(), buttonColor: Colors.white),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(color: Colors.white),
            foregroundColor: const Color(bajo),
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),

      color: const Color(fuerteMedio),
      initialRoute: '/Welcome',
      //  onGenerateRoute: (settings) {
      //    if (settings.name == '/MyHomePage') {
      //      return MaterialPageRoute(builder: (context) => const MyHomePage());
      //    }
      //    if (settings.name == '/List_Incidents') {
      //      return MaterialPageRoute(builder: (context) => const IncidentList());
      //    }
      //    if (settings.name == '/About') {
      //      return MaterialPageRoute(builder: (context) => const About());
      //    }
      //    return null;
      //    // Otros casos
      //  },
      //onUnknownRoute: (settings) {
      //        return MaterialPageRoute(
      //          builder: (context) => Scaffold(
      //            appBar: AppBar(
      //              title: const Text('Error 404'),
      //            ),
      //            body: Center(
      //              child: Text('Ruta no encontrada: ${settings.name}'),
      //            ),
      //          ),
      //        );
      //      },
      routes: {
        /**La primera ruta será a la que abrirá el home, pero lo que realmente 
         * abrirá es un Splash Screen que estará por unos segundos y pasará a
         * Login y Register*/

        '/': (BuildContext context) => const MyHomePage(),
        '/About': (BuildContext context) => const About(),
        '/Add_Incidents': (BuildContext context) => const AddIncidents(),
        '/Alumn_Incident': (BuildContext context) => const AlumnIncident(),
        '/List_Incidents': (BuildContext context) => const IncidentList(),
        '/Login': (BuildContext context) => const Login(),
        '/Register': (BuildContext context) => const Register(),
        '/Tutorial': (BuildContext context) => const Tutorial(),
        '/Welcome': (BuildContext context) => const WelcomeScreen(),
        '/View_Data_Teacher': (BuildContext context) => const DataTeacher(),
      },
      //onGenerateInitialRoutes: (RouteSettings settings){
      //        return MaterialPageRoute(builder: (BuildContext context){
      //          switch(settings.name){
      //            case '/'
      //              return Loginpage();
      //          }
      //        });
      //      },
    );
  }
}
