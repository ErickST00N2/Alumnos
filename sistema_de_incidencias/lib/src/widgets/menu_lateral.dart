import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  Duration get loginTime => const Duration(milliseconds: 2250);

  const MenuLateral({super.key});
  @override
  Widget build(BuildContext context) {
    return _getDrawer(context);
  }
}

Widget _getDrawer(BuildContext context) {
  String accountName = 'Erick Gonzalez Cortes';
  String accountEmail = 'erickst00ngmail.com';
  String picture = "assets/backgrounds/IMG-20230817-WA0073.jpg";
  return Drawer(
    elevation: 2,
    child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0Xff186DBE),
            ),
            accountName: Text(accountName),
            accountEmail: Text(accountEmail),
            onDetailsPressed: () {
              const Text(
                  "Ingeniero en Entornos Virtuales y Negocios Digitales");
            },
            currentAccountPicture: GridView.count(
              crossAxisCount: 1,
              shrinkWrap: true,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage(picture),
                ),
              ],
            )),
        ListBody(
          children: [
            ListTile(
              title: const Text("Inicio"),
              leading: const Icon(color: Color(0xff186DBE), Icons.home),
              onTap: () => showScreen(context, ''),
            ),
            ListTile(
              title: const Text("Datos del profesor"),
              leading:
                  const Icon(color: Color(0xff186DBE), Icons.library_books),
              onTap: () => showScreen(context, 'View_Data_Teacher'),
            ),
            ListTile(
              title: const Text("Lista de incidencias"),
              leading: const Icon(color: Color(0xff186DBE), Icons.list),
              onTap: () => showScreen(context, 'List_Incidents'),
            ),
            ListTile(
              title: const Text("Añadir incidencias"),
              leading: const Icon(color: Color(0xff186DBE), Icons.add_box),
              onTap: () => showScreen(context, 'Add_Incidents'),
            ),
            ListTile(
              title: const Text("Tutorial"),
              leading:
                  const Icon(color: Color(0xff186DBE), Icons.video_library),
              onTap: () => showScreen(context, 'Tutorial'),
            ),
            ListTile(
              title: const Text("Desarrolladores"),
              leading:
                  const Icon(color: Color(0xff186DBE), Icons.developer_mode),
              onTap: () => showScreen(context, "About"),
            ),
            ListTile(
              title: const Text("Iniciar Sesión"),
              leading: const Icon(color: Color(0xff186DBE), Icons.login),
              onTap: () => showScreen(context, "Login"),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
          width: double.infinity,
        ),
        const Divider(
          height: 20,
          thickness: 1,
          indent: 0,
          endIndent: 0,
          color: Colors.black38,
        )
      ],
    ),
  );
}

void showScreen(BuildContext context, routeName) {
  Navigator.of(context).popAndPushNamed('/$routeName');
  //Navigator.of(context).push("/$routeName");
}
