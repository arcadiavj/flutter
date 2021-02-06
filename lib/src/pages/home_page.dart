import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/share_prefs/preferencias_usuario.dart';
import 'package:preferenciasusuario/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final pref = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    pref.ultimaPagina = HomePage.routeName;
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
        backgroundColor: (pref.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color Secundario: ${pref.colorSecundario}'),
          Divider(),
          Text('Género: ${pref.genero}'),
          Divider(),
          Text('Nombre de Usuario: ${pref.nombre}'),
          Divider(),
        ],
      ),
    );
  }
}
