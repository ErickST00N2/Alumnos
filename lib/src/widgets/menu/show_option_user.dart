import 'package:flutter/material.dart';
import 'package:mi_credencial_digital/src/util/colors_aplication/colores.dart';
import 'package:mi_credencial_digital/src/router/routes.dart';
import 'package:mi_credencial_digital/src/services/auth.dart';
import 'package:provider/provider.dart';

class ShowOptionUser extends StatelessWidget {
  const ShowOptionUser({super.key});

  @override
  Widget build(BuildContext context) {
    ListBody sessionCondition = ListBody(
      children: <Widget>[
        ListTile(
          title: const Text("Iniciar Sesión"),
          leading: Icon(color: Color(ColoresApp.fuerte3), Icons.login),
          onTap: () => Routes.showScreen(context, "login"),
        )
      ],
    );
    return Consumer<AuthService>(
      builder: (context, AuthService authService, child) {
        switch (authService.status) {
          case AuthStatus.Uninitialized:
            return sessionCondition;
          case AuthStatus.Authenticated:
            return ListTile(
              title: const Text("Cerrar Sesión"),
              leading: Icon(color: Color(ColoresApp.fuerte3), Icons.logout),
              onTap: () {
                authService.signOut();
                Routes.showScreen(context, "login");
              },
            );
          case AuthStatus.Unauthenticated:
            return sessionCondition;
          default:
            return const ListTile();
        }
      },
    );
  }
}
