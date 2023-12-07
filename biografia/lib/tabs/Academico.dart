import 'package:flutter/material.dart';

class AcademicoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Academicas'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ExperienceCard(
              title: 'Programacion web',
              date: 'mayo de 2022',
              description: 'Conocimiento de html, css y javascript',
            ),
            ExperienceCard(
              title: 'Base de datos',
              date: 'junio de 2020',
              description:
                  'Conexiones para el envio y trasferencia de datos, creacion de tablas y utilizacion de mysql y sql para las base de datos.',
            ),
            ExperienceCard(
              title: 'IA(Inteligencia artificial)',
              date: 'diciembre de 2023',
              description:
                  'Conocimiento de desarrollo de aplicacion y proyectos que empezaran como autonomos y luego desarrollaran la capacidad de inteligencia artificial.',
            ),
            // Puedes agregar más experiencias aquí
          ],
        ),
      ),
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final String title;
  final String date;
  final String description;

  ExperienceCard({
    required this.title,
    required this.date,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 28, 161, 175),
      elevation: 4,
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 20),
            ),
            Text('Fecha: $date'),
            Text(description),
          ],
        ),
      ),
    );
  }
}
