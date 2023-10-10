import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final String username;

  WelcomeScreen({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(248, 131, 213, 228),
      appBar: AppBar(
        title: Text('Bienvenid@'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('¡Bienvenido, $username!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Puedes agregar lógica para realizar acciones específicas en esta vista.
              },
              child: Text('Acceso Autorizado'),
            ),
          ],
        ),
      ),
    );
  }
}
