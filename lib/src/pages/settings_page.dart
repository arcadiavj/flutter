import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/share_prefs/preferencias_usuario.dart';
import 'package:preferenciasusuario/src/widgets/menu_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = true;
  int _genero = 1;
  String _nombre = 'Pedro';

  TextEditingController _textControler;
  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //cargarPref();
    prefs.ultimaPagina = SettingsPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;

    _textControler = new TextEditingController(text: _nombre);
  }

  // cargarPref() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   _genero = prefs.getInt('genero');
  //   setState(() {});
  // }

  _setSelectedRadio(int valor) {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.setInt('genero', valor);
    prefs.genero = valor;
    _genero = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes'),
          backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            SwitchListTile(
                value: _colorSecundario,
                title: Text('Color Secundario'),
                onChanged: (value) {
                  _colorSecundario = value;
                  prefs.colorSecundario = value;
                  setState(() {});
                }),
            RadioListTile(
              value: 1,
              title: Text('masculio'),
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            RadioListTile(
                value: 2,
                title: Text('femenino'),
                groupValue: _genero,
                onChanged: _setSelectedRadio),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textControler,
                decoration: InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre de la persona Utilizando el telefono'),
                onChanged: (value) {
                  prefs.nombre = value;
                },
              ),
            )
          ],
        ));
  }
}
