import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const IMS());
}

class IMS extends StatefulWidget {
  const IMS({Key? key}) : super(key: key);

  @override
  State<IMS> createState() => _IMSState();
}

class _IMSState extends State<IMS> {
  // Variable para el resultado
  String res = "0";
  String categoria = "";
  Color categoriaColor = Colors.black;
  String imagenCategoria = 'assets/imagen_normal.png';

  // Declaramos los controladores para nombrar los textField
  var estatura = TextEditingController();
  var peso = TextEditingController();

  // Método para calcular el IMC
  double calculaIMC(double estatura, double peso) {
    return peso / pow(estatura, 2);
  }

  // Función para determinar la categoría del IMC y asignar la imagen correspondiente
  void determinarCategoriaImagen(double imc) {
    String categoriaIMC = determinarCategoria(imc);
    setState(() {
      categoria = categoriaIMC;
      imagenCategoria = obtenerImagenCategoria(categoriaIMC);
    });
  }

  // Función para obtener la imagen según la categoría
  String obtenerImagenCategoria(String categoria) {
    switch (categoria) {
      case "Bajo Peso":
        return 'assets/imagen_bajo_peso.png';
      case "Normal":
        return 'assets/imagen_normal.png';
      case "Sobrepeso":
        return 'assets/imagen_sobrepeso.png';
      case "Obesidad":
        return 'assets/imagen_obesidad.png';
      default:
        return 'assets/imagen_normal.png';
    }
  }

  // Función para determinar la categoría del IMC y asignar el color correspondiente
  void determinarCategoriaColor(double imc) {
    String categoriaIMC = determinarCategoria(imc);
    setState(() {
      categoriaColor = getColorCategoria(categoriaIMC);
    });
  }

  // Función para obtener el color según la categoría
  Color getColorCategoria(String categoria) {
    switch (categoria) {
      case "Bajo Peso":
        return Colors.black;
      case "Normal":
        return Colors.green;
      case "Sobrepeso":
        return Colors.yellow;
      case "Obesidad":
        return Color.fromARGB(255, 236, 3, 3);
      default:
        return Colors.black;
    }
  }

  // Función para determinar la categoría del IMC
  String determinarCategoria(double imc) {
    if (imc < 18.5) {
      return "Bajo Peso";
    } else if (imc >= 18.5 && imc < 24.9) {
      return "Normal";
    } else if (imc >= 25 && imc < 29.9) {
      return "Sobrepeso";
    } else {
      return "Obesidad";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "IMC",
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
        backgroundColor: Color.fromARGB(248, 227, 114, 39),
        appBar: AppBar(
          title: Text("IMC"),
        ),
        body: Column(
          children: [
            // Etiqueta "Inserte Estatura"
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Inserte Estatura:",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.amber),
                controller: estatura,
              ),
            ),

            // Etiqueta "Inserte Peso"
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Inserte Peso:",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.amber),
                controller: peso,
              ),
            ),

            // Botones
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      double n1 = double.parse(estatura.text);
                      double n2 = double.parse(peso.text);
                      double imc = calculaIMC(n1, n2);
                      String categoriaIMC = determinarCategoria(imc);
                      setState(() {
                        res = imc.toStringAsFixed(2);
                        categoria = categoriaIMC;
                      });
                      determinarCategoriaImagen(imc);
                      determinarCategoriaColor(imc);
                    },
                    child: Text("Calcular IMC"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      peso.text = "";
                      estatura.text = "";
                      setState(() {
                        res = "0";
                        categoria = "";
                        categoriaColor = Colors.black;
                        imagenCategoria = 'assets/imagen_normal.png';
                      });
                    },
                    child: Text("Otro IMC"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200.0,
              width: 250.0,
              child: Image.asset(imagenCategoria),
            ),
            // Resultado del IMC
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "IMC: $res",
                style: TextStyle(
                    fontSize: 30, color: Color.fromARGB(255, 19, 29, 169)),
              ),
            ),

            // Categoría del IMC
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Categoría: $categoria",
                style: TextStyle(fontSize: 30, color: categoriaColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
