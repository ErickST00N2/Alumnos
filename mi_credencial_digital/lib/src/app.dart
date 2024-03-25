import 'package:flutter/material.dart';
import 'package:mi_credencial_digital/src/util/colors_aplication/colores.dart';
import 'package:mi_credencial_digital/src/router/routes.dart';
import 'package:mi_credencial_digital/src/services/auth.dart';
import 'package:mi_credencial_digital/src/providers/user.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final String nameApp = 'Mi Credencial Digital';
  final ColoresApp cAplication = ColoresApp();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<Users>(
            create: (_) => Users(),
          ),
          ChangeNotifierProvider<AuthService>(
            create: (_) => AuthService(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          debugShowMaterialGrid: false,
          showSemanticsDebugger: false,
          title: nameApp,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: Brightness.light,
            primaryColor: Color(cAplication.medio),
            primaryColorLight: Color(cAplication.bajo),
            colorScheme: ColorScheme.light(
              primary: Color(cAplication.fuerte),
              onPrimary: Color(cAplication.fuerteMedio),
              secondary: Color(cAplication.fuerteMedio),
              onSecondary: Color(cAplication.fuerteMedio),
              tertiary: Color(cAplication.medio),
              primaryContainer: Colors.white,
              secondaryContainer: Colors.white,
              errorContainer: Color(cAplication.error),
              error: Color(cAplication.error),
              onError: const Color.fromARGB(255, 255, 0, 0),
            ),
            buttonTheme: const ButtonThemeData(
              colorScheme: ColorScheme.light(),
              buttonColor: Colors.white,
            ),
            primaryTextTheme:
                const TextTheme(bodyLarge: TextStyle(color: Colors.black)),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(color: Colors.white),
                foregroundColor: Color(cAplication.bajo),
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
          color: Color(cAplication.fuerteMedio),
          initialRoute: Routes.initialRoute,
          onGenerateRoute: Routes.generateRoute,
        ));
  }
}
