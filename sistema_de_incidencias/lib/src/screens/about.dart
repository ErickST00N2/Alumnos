import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sistema_de_incidencias/src/widgets/menu_lateral.dart';

import '../widgets/developer_item.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class CarouselSlider extends StatefulWidget {
  const CarouselSlider({super.key});

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return const CarouselSlider();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    //Animación de entrada
    Timer(const Duration(microseconds: 100), () {
      setState(() {
        //_opacity = 1.0;
      });
    });

    //Animación de salida y navegación a la siguiente pantalla
    Timer(const Duration(seconds: 3), () {
      setState(() {
        //_containerHeight = 0;
        //_containerWidth = 0;
      });
    });
  }
}

class _CarouselSliderState extends State<CarouselSlider> {
  final List<DeveloperItem> developers = [
    DeveloperItem(
      name: 'Erick Gonzalez Cortes',
      description: 'Descripción del desarrollador 1',
      picture: 'assets/backgrounds/IMG-20230817-WA0073.jpg',
    ),
    DeveloperItem(
      name: 'Desarrollador 2',
      description: 'Descripción del desarrollador 2',
      picture: 'assets/developer2.jpg',
    ),
  ];
  late PageController _pageController;
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // AppBar de la pantalla
        title: const Text(
          // Título de la AppBar
          "Acerca de", // Texto del título
          style: TextStyle(
              // Estilo del texto del título
              fontFamily: AutofillHints.jobTitle, // Fuente del texto
              color: Color.fromARGB(255, 255, 255, 255)), // Color del texto
        ),
        backgroundColor:
            const Color.fromRGBO(2, 169, 218, 1), // Color de fondo de la AppBar
      ),
      drawer: const MenuLateral(), // Menú lateral de la pantalla

      body: Container(
        child: PageView.builder(
          controller: _pageController,
          itemCount: 2,
          itemBuilder: (context, index) {
            return developers[index];
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    Timer.periodic(const Duration(seconds: 6), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
        );
      }
    });
  }
}
