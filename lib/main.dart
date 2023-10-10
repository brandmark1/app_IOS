import 'dart:io';

import 'package:flutter/material.dart';
import 'bienvenida.dart'; // Importa la nueva vista

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String login = '';
  String password = '';
  bool authorized = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(248, 102, 201, 231),
      appBar: AppBar(
        title: Text('Login App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              alignment: Alignment.center,
              child: Image.asset("img/logo.jpg"),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  login = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Login',
              ),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (login == 'anitza' && password == '123') {
                  setState(() {
                    authorized = true;
                  });
                  _showAuthorizationDialog(context, true);

                  // Navegar a la vista de bienvenida
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => WelcomeScreen(username: login),
                    ),
                  );
                } else {
                  _showAuthorizationDialog(context, false);
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(
                    255, 59, 231, 16), // Cambia el color del botón a rojo
              ),
              child: Text('Iniciar Sesión'),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                exit(0);
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(
                    255, 244, 60, 54), // Cambia el color del botón a rojo
              ),
              child: Text('Salir'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showAuthorizationDialog(
      BuildContext context, bool authorized) async {
    String message =
        authorized ? 'Usuario autorizado' : 'Usuario no autorizado';

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Resultado de la autorización'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (!authorized) {
                  setState(() {
                    login = '';
                    password = '';
                  });
                }
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
