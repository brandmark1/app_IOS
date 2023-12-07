import 'package:flutter/material.dart';

class DatPersonalTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 136, 134, 127),
      child: Card(
        shadowColor: Colors.black,
        elevation: 5,
        margin: EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            // Agregamos un Center para centrar contenido
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Alineamos el contenido al centro
              children: [
                Text(
                  'Instituto: Tecnologico de Colima',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                Text(
                  'Nombre: Brandon Ricardo Marquez Larios',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  'Edad: 24 años',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  'Teléfono: 3121907165',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  'Carrera: Ing Sistema Computacionales',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/brandon.jpeg',
                  width: 300,
                  height: 300,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
