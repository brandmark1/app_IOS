import 'package:flutter/material.dart';
import 'package:biografia/tabs/Datospersonales.dart';
import 'package:biografia/tabs/Academico.dart';
import 'package:biografia/tabs/Experiencia.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyTabBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Número de pestañas
      child: Scaffold(
        appBar: AppBar(
          title: Text('Historia de Mi Vida'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.person), text: 'Datos Personales'),
              Tab(icon: Icon(Icons.school), text: 'Academico'),
              Tab(icon: Icon(Icons.check_box), text: 'Experiencia'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            DatPersonalTab(),
            AcademicoTab(),
            ExperienciaTab(),
          ],
        ),
      ),
    );
  }
}
