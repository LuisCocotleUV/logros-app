import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logros_app/components/my_button.dart';
import 'package:logros_app/components/my_textfield.dart';
import 'package:logros_app/components/square_tile.dart';
import 'package:logros_app/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controles de texto
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Metodo de login (aún sin implementar)
  void signUserIn() async {
    // Círculo de carga
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // Inicio de sesión
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // Cierra el círculo de carga
      Navigator.pop(context);
      // Mostrar error
      showErrorMessage(e.code);
    }
  }

  // Popup - Error
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [Color(0xff1b2838), Color(0xff171a21)],
                stops: [0, 1],
                center: Alignment.center,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(height: 50),

                  // Logo
                  Image.asset('lib/images/trofeo.png'),

                  // Espacio
                  SizedBox(height: 50),

                  // Ejemplo
                  Text(
                    'Hola causas',
                    style: TextStyle(
                        color: Colors.white, fontSize: 16, fontFamily: 'Arial'),
                  ),

                  // Espacio
                  SizedBox(height: 50),

                  // Textbox - correo
                  MyTextField(
                    controller: emailController,
                    hintText: 'Correo electrónico',
                    obscureText: false,
                  ),

                  // Espacio
                  SizedBox(height: 30),

                  // Textbox - contraseña
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Contraseña',
                    obscureText: true,
                  ),

                  // Espacio
                  SizedBox(height: 15),

                  // Constraseña olvidada
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Olvidé mi contraseña',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),

                  // Espacio
                  SizedBox(height: 50),

                  // Botón de login
                  MyButton(
                    text: "Sign Up",
                    onTap: signUserIn,
                  ),

                  // Espacio
                  SizedBox(height: 50),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'O continúa con:',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Espacio
                  SizedBox(height: 50),

                  // Botón de Google
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SquareTile(
                        onTap: () => AuthService().signInWithGoogle(),
                        imagePath: 'lib/images/google.png',
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),

                  // Espacio
                  SizedBox(height: 50),

                  // Registro
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '¿Aún no tienes cuenta?',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Registrate ahora',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ]),
              ),
            )),
      ),
    );
  }
}
