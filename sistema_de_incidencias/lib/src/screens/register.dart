import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Duration get loginTime => const Duration(milliseconds: 2250);
  void aver() {
    Navigator.pop(context);
  }

  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      onDrawerChanged: (isOpened) => aver,
      body: Stack(children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(vertical: 60),
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color(0xFF02A9DA),
              Color(0xFF069BDF),
              Color(0xFF0F84D1),
              Color(0xFF186DDE),
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
            offset: const Offset(0, -30),
            child: Center(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 260),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 20),
                    child: Column(
                      /*No poner en max en caso de querer ver el container del login muy grande*/
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: "Usuario"),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: "Contraseña"),
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
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
                              const Text("Registrarme"),
                              if (_loading)
                                Container(
                                    width: 20,
                                    height: 20,
                                    margin: const EdgeInsets.only(left: 20),
                                    child: const CircularProgressIndicator(
                                      color: Colors.white,
                                    )),
                            ],
                          ),
                        ),
                      ],
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

  void showRegisterPage() {
    Navigator.of(context).pushNamed(
      "/Register",
    );
  }

  void _loginButton(BuildContext context) {
    if (!_loading) {
      setState(() {
        _loading = true;
      });
    } else {
      setState(() {
        _loading = false;
      });
    }
  }
}
