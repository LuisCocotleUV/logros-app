import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logros_app/components/my_button.dart';
import 'package:logros_app/components/my_textfield.dart';
import 'package:logros_app/components/square_tile.dart';
import 'package:logros_app/services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Controles de texto
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Metodo de registro
  void signUserUp() async {
    // Círculo de carga
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // Crear cuenta
    try {
      // Checa si se confirma la contraseña
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        // Muestra mensaje de error
        showErrorMessage("Las constraseñas no coinciden");
      }
      // Cierra el círculo de carga
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
                  Image.asset(
                    'lib/images/trofeo.png',
                  ),

                  // Espacio
                  SizedBox(height: 50),

                  // Texto de creación de cuenta
                  Text(
                    'Crea tu cuenta llenando el formulario',
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
                  SizedBox(height: 15),

                  // Textbox - contraseña
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Contraseña',
                    obscureText: true,
                  ),

                  // Espacio
                  SizedBox(height: 15),

                  // Textbox - confirmar contraseña
                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirmar contraseña',
                    obscureText: true,
                  ),

                  // Espacio
                  SizedBox(height: 50),

                  // Botón de login
                  MyButton(
                    text: "Registrate",
                    onTap: signUserUp,
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
                        imagePath: 'lib/images/google.png'),
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
                        '¿Ya tienes cuenta?',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Inicia sesión',
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
