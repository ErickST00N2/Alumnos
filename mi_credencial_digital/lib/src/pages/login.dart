import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:mi_credencial_digital/src/util/colors_aplication/colores.dart';
import 'package:mi_credencial_digital/src/services/auth.dart';
import 'package:mi_credencial_digital/src/providers/user.dart';
import 'package:mi_credencial_digital/src/util/responsive/responsive_design.dart';
import 'package:provider/provider.dart';

/// [Login] - Widget que representa la pantalla de inicio de sesión.
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Duration get loginTime => const Duration(milliseconds: 2250);

  bool _loading = false;
  bool _showPassword = false;
  late ColoresApp _cApp;
  // Controladores para los campos de texto de correo electrónico y contraseña.
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late FocusNode _emailFocus;
  late FocusNode _passwordFocus;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    /// [size] - Es el tamaño de la pantalla que se obtiene del dispositivo.
    final size = MediaQuery.of(context).size;

    ResponsiveDesign rd = ResponsiveDesign();

    /// [maxWidthScreenCard] - Evaluamos la anchura de la pantalla para saber si
    /// nuestra credencial tendrá un ancho maximo de 700 pixeles o si sigue con
    /// el valor por defecto de 0.95.
    final maxWidthScreenCard = rd.isMobile(context)
        ? size.width * 0.95
        : rd.isTablet(context)
            ? 0.8
            : 600.0;

    /// [authService] - Instancia de la clase [AuthService].final authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(vertical: 60),
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color(_cApp.bajo),
              Color(_cApp.medio),
              Color(_cApp.fuerteMedio),
              Color(_cApp.fuerte),
            ],
          )),
          child: Image.asset(
            'assets/svg/logo2.png',
            height: 200,
          ),
        ),
        Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.black38),
          child: Transform.translate(
            offset: const Offset(0, -50),
            child: Center(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: SizedBox(
                  width: maxWidthScreenCard,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    margin:
                        const EdgeInsets.only(left: 20, right: 20, top: 260),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 30),
                      child: Form(
                        key: formKey,
                        child: Column(
                          /*No poner en max en caso de querer ver el container del login muy grande*/
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            // Campo de texto para el correo electrónico.
                            TextFormField(
                              focusNode: _emailFocus,
                              keyboardAppearance: Brightness.light,
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailController,
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return "¡Introduce tu correo!, ej: example@gmail.com";
                                } else if (!value!.contains("@") &&
                                    !value.contains(".com")) {
                                  return 'Ingresa un correo valido.';
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                //labelText: "Correo",
                                hintText: 'Correo@example.com',
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                ),
                              ),
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () =>
                                  requestFocus(context, _passwordFocus),
                            ),
                            const SizedBox(
                              height: 40,
                            ),

                            // Campo de texto para la contraseña.
                            TextFormField(
                              focusNode: _passwordFocus,
                              controller: _passwordController,
                              keyboardAppearance: Brightness.light,
                              keyboardType: TextInputType.visiblePassword,
                              validator: (value) {
                                if (value!.length < 6) {
                                  return "¡Introduce tu contraseña!, debe tener al menos 6 caracteres.";
                                } else if (value.toString().isEmpty) {
                                  return "¡Debes colocar tu contraseña!";
                                } else {
                                  return null;
                                }
                              },
                              obscureText: !_showPassword,
                              decoration: InputDecoration(
                                //labelText: "Contraseña",

                                prefixIcon: const Icon(
                                  Icons.lock_person,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _showPassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _showPassword = !_showPassword;
                                    });
                                  },
                                ),
                              ),
                              onEditingComplete: () =>
                                  requestFocus(context, _passwordFocus),
                            ),
                            const SizedBox(
                              height: 40,
                            ),

                            // Botón para iniciar sesión.
                            FilledButton(
                              onPressed: () {
                                _loginButton(context);
                              },
                              style: const ButtonStyle(
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(vertical: 15)),
                                foregroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                                backgroundColor:
                                    MaterialStatePropertyAll(Color(0xFF069BDF)),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder()),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text("Iniciar Sesion"),
                                  if (context.watch<AuthService>().status ==
                                      AuthStatus.Authenticating)
                                    Container(
                                        width: 20,
                                        height: 20,
                                        margin: const EdgeInsets.only(left: 20),
                                        child: const CircularProgressIndicator
                                            .adaptive(
                                          backgroundColor: Colors.white,
                                        )),
                                ],
                              ),
                            ),

                            const SizedBox(
                              height: 20,
                            ),

                            /*
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text("¿No estás Registrado?"),

                                // Botón para Registrarse
                                FilledButton(
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.transparent),
                                      textStyle: MaterialStatePropertyAll(
                                          TextStyle(color: Color(0xFF0F84D1)))),
                                  onPressed: _showRegisterPage,
                                  child: const Text("Registrate"),
                                ),
                              ],
                            )*/
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  /// [_showRegisterPage] - Método que se llama cuando el usuario presiona el botón de Registrar.
  /// Llama al método [popAndPushNamed] de la clase [Navigator] para pasar a la pagina de registro.
  void _showRegisterPage() {
    Navigator.pushNamed(context, '/register');
  }

  /// [_loginButton] - Método que se llama cuando el usuario presiona el botón de inicio de sesión.
  /// Llama al método [signInWithEmailAndPassword] del servicio de autenticación con los datos ingresados.
  void _loginButton(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      if (!_loading) {
        setState(() {
          _loading = true;
        });
      } else {
        setState(() {
          _loading = false;
        });
      }

      // Obtiene los valores de los campos de texto.

      //String email = _emailController.text;
      //String password = _passwordController.text;
      formKey.currentState!.save();

      // Llama al método de inicio de sesión con correo electrónico y contraseña.
      //await AuthService.signInWithEmailAndPassword(email, password);
      User? user = await AuthService().signInWithEmailAndPassword(
          _emailController.text, _passwordController.text);

      if (user != null) {
        debugPrint('El usuario $user esta autenticado satisfactoriamente');
        context.read<Users>().getUserData(user);
        Navigator.pushNamed(context, '/');
      } else {
        debugPrint('No se puede loggear el usuario');
      }
    }
  }

  void requestFocus(BuildContext context, FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();

    super.dispose();
  }

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    _emailFocus = FocusNode();
    _passwordFocus = FocusNode();
    _cApp = ColoresApp();
  }
}
