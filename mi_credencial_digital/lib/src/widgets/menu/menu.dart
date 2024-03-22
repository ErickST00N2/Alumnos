import 'package:flutter/material.dart';
import 'package:mi_credencial_digital/src/util/colors_aplication/colores.dart';
import 'package:mi_credencial_digital/src/router/routes.dart';
import 'package:mi_credencial_digital/src/providers/user.dart';
import 'package:mi_credencial_digital/src/widgets/menu/show_option_user.dart';
import 'package:provider/provider.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(elevation: 2, child: _buildDrawerContent(context));
  }

  Widget _buildDrawerContent(BuildContext _) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: Color(ColoresApp.fuerte3),
          ),
          accountName: Text(_.watch<Users>().nombre),
          accountEmail: Text(_.watch<Users>().correo),
          currentAccountPicture: CircleAvatar(
            backgroundImage: _.watch<Users>().getPhotoURL(),
          ),
        ),
        ListBody(
          children: [
            ListTile(
              title: const Text("Inicio"),
              leading: Icon(color: Color(ColoresApp.fuerte3), Icons.home),
              onTap: () => Routes.showScreen(_, ''),
            ),
            ListTile(
              title: const Text("Mi credencial"),
              leading:
                  Icon(color: Color(ColoresApp.fuerte3), Icons.credit_card),
              onTap: () => Routes.showScreen(_, 'view_data_students'),
            ),
            ListTile(
              title: const Text("Lista de incidencias"),
              leading: Icon(color: Color(ColoresApp.fuerte3), Icons.list),
              onTap: () {
                Routes.showScreen(_, 'view_incidents');
              },
            ),
            ListTile(
              title: const Text("Tutorial"),
              leading:
                  Icon(color: Color(ColoresApp.fuerte3), Icons.video_library),
              onTap: () => Routes.showScreen(_, 'tutorial'),
            ),
            ListTile(
              title: const Text("Créditos"),
              leading: Icon(color: Color(ColoresApp.fuerte3), Icons.info),
              onTap: () => Routes.showScreen(_, 'about'),
            ),
            const ShowOptionUser(),
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
        ),
      ]),
    );
  }
}
