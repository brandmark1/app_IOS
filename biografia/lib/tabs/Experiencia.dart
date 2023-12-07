import 'package:flutter/material.dart';

class ExperienciaTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 52, 111, 138),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: ListTile(
              title: Text(
                'En el desarrollo del diseño de páginas web.',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                'Breve conocimiento de la base de datos.',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                'También conocimiento del dibujo a papel.',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
