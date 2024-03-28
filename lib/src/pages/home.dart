import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mi_credencial_digital/src/util/colors_aplication/colores.dart';
import 'package:mi_credencial_digital/src/util/logos/logos.dart';
import 'package:mi_credencial_digital/src/util/responsive/responsive_design.dart';
import 'package:mi_credencial_digital/src/widgets/menu/menu.dart';
import 'package:mi_credencial_digital/src/widgets/pie_pagina/pie_pagina.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final ColoresApp cAplication = ColoresApp();
  final ResponsiveDesign responsive = ResponsiveDesign();

  @override
  Widget build(BuildContext context) {
    double containerMainSizedWidth = responsive.isMobile(context)
        ? MediaQuery.of(context).size.width * 0.95
        : responsive.isTablet(context)
            ? MediaQuery.of(context).size.width * 0.75
            : responsive.isDesktop(context)
                ? 600
                : MediaQuery.of(context).size.width * 0.5;
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        backgroundColor: cAplication.colorDelAppBar,
        title: const AutoSizeText('Credencial Digital'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            width: containerMainSizedWidth,
            child: Column(
              children: [
                Logos().isotipoAzulImgAsset(context),
                /*Icon(
                  Icons.credit_card_outlined,
                  size: 80,
                  color: Color(cAplication.fuerte2),
                ),*/
                const AutoSizeText(
                  'Bienvenido',
                  style: TextStyle(fontSize: 40),
                  maxLines: 1,
                  maxFontSize: 55,
                  minFontSize: 25,
                ),
                const AutoSizeText(
                  'Credencial Digital',
                  style: TextStyle(fontSize: 30),
                  maxLines: 1,
                  maxFontSize: 45,
                  minFontSize: 15,
                ),
                const SizedBox(
                  height: 20,
                ),
                const AutoSizeText.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'El ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Sistema de Credenciales QR ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'es un proyecto desarrollado por el ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'T.S.U. Erick González Cortes, ',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            'un estudiante de Ingeniería en Tecnologías de La Información, especializado en Área Entornos Virtuales y Negocios Digitales, durante su periodo de estadías en la ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Universidad Tecnológica de Tlaxcala. ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            'Este sistema tiene como objetivo proporcionar un método eficiente y seguro para la gestión de credenciales mediante tecnología QR.',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.justify, // Añadido el textAlign aquí
                ),
                const SizedBox(
                  height: 20,
                ),
                const AutoSizeText.rich(
                  textAlign: TextAlign.justify, // Añadido el textAlign aquí

                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'El sistema de credenciales QR consta de tres aplicaciones móviles, cada una con su respectiva versión web. Además, incluye una aplicación de administración que está disponible exclusivamente en versión web. Esta solución proporciona una forma innovadora y práctica de gestionar credenciales, facilitando su creación, distribución y verificación a través de códigos QR.',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const PiePagina(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
