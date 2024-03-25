import 'package:flutter/material.dart';
import 'package:mi_credencial_digital/src/pages/about.dart';
import 'package:mi_credencial_digital/src/pages/home.dart';
import 'package:mi_credencial_digital/src/pages/incident_list.dart';
import 'package:mi_credencial_digital/src/pages/login.dart';
import 'package:mi_credencial_digital/src/pages/my_credential.dart';
import 'package:mi_credencial_digital/src/pages/tutorial.dart';
import 'package:mi_credencial_digital/src/pages/welcom.dart';
import 'package:mi_credencial_digital/src/services/auth.dart';

import 'package:provider/provider.dart';

class Routes {
// [Routes] - Clase que contiene las rutas de la aplicación
//Llena todo de comentarios para saber sobre cada una de las rutas

  static const String initialRoute = '/';
  // static const String aboutRoute = 'about';
  // static const String viewIncidentsRoute = '/view_incidents';
  // static const String loginRoute = '/login';
  // static const String tutorialRoute = '/tutorial';
  // static const String welcomeRoute = '/welcome';
  // static const String viewDataStudentsRoute = '/view_data_students';

  static Route<dynamic> unknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('Error 404'),
              ),
              body: Center(
                child: Text('Ruta no encontrada: ${settings.name}'),
              ),
            ));
  }

  static final routes = {
    '/': (context) => HomePage(),
    '/about': (context) => AboutPage(),
    '/login': (context) => const Login(),
    '/tutorial': (context) => const TutorialPage(),
    '/welcome': (context) => const Welcom(),
    'Error404': (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Error 404'),
          ),
          body: const Center(
            child: Text('Ruta no encontrada'),
          ),
        )
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    debugPrint('La ruta de generateRoute es: ${settings.name}');
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());

      case '/about':
        return MaterialPageRoute(builder: (_) => AboutPage());

      case '/view_incidents':
        return _checkAuthAndNavigate(
          settings,
          const IncidentListPage(),
        );
      case '/login':
        return _checkAuthAndNavigate(settings, const Login());

      case '/tutorial':
        return _checkAuthAndNavigate(
          settings,
          const TutorialPage(),
        );
      case '/welcome':
        return MaterialPageRoute(
          builder: (_) => WelcomeScreen(context: _),
        );
      case '/view_data_students':
        return _checkAuthAndNavigate(
          settings,
          const MyCredentialPage(),
        );
      case '/error404':
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  appBar: AppBar(
                    title: const Text('Error 404'),
                  ),
                  body: Center(
                    child: Text('Ruta no encontrada: ${settings.name}'),
                  ),
                ));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text('Error 404'),
            ),
            body: Center(
              child: Text('Ruta no encontrada: ${settings.name}'),
            ),
          ),
        );
    }
  }

  static void showScreen(BuildContext context, String routeName) {
    /*if (routeName == '/login') {
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const Login(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(31.0, -3.0);
            var end = Offset.zero;
            var curve = Curves.easeInOutCubicEmphasized;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        ),
      );
    } else {*/
    Navigator.of(context).pushNamed('/$routeName');
    //}
  }

  static Route<dynamic> _checkAuthAndNavigate(
    RouteSettings settings,
    Widget page,
  ) {
    return MaterialPageRoute(
      builder: (context) {
        final authService = Provider.of<AuthService>(context, listen: true);
        switch (authService.status) {
          case AuthStatus.Uninitialized:
            return const Welcom();
          case AuthStatus.Authenticating:
            // Muestra un indicador de carga mientras se determina el estado de autenticación
            return _buildLoadingScreen();
          case AuthStatus.Authenticated:
            // Si el usuario está autenticado, muestra la página solicitada
            return page;
          case AuthStatus.Unauthenticated:
            // Si el usuario no está autenticado, redirige a la página de inicio de sesión
            return const Login();
          default:
            // En caso de un estado no válido, muestra un mensaje de error
            return _buildErrorScreen();
        }
      },
    );
  }

  static Widget _buildLoadingScreen() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  static Widget _buildErrorScreen() {
    return const Scaffold(
      body: Center(
        child: Text('Error: Estado de autenticación no válido'),
      ),
    );
  }
}
