import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();
  factory PreferenciasUsuario() {
    return _instancia;
  }
  PreferenciasUsuario._internal();
  SharedPreferences _prefs;
  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  //ninguna de estas propiedades se usa
  /*bool _colorSecundario;
  int _genero;
  String _nombre;*/

  //get y set del genero
  get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int valor) {
    _prefs.setInt('genero', valor);
  }

  get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool valor) {
    _prefs.setBool('colorSecundario', valor);
  }

  get nombre {
    return _prefs.getString('Nombre') ?? '';
  }

  set nombre(String valor) {
    _prefs.setString('Nombre', valor);
  }

  get ultimaPagina {
    return _prefs.getString('UltimaPagina') ?? 'home';
  }

  set ultimaPagina(String valor) {
    _prefs.setString('UltimaPagina', valor);
  }
}
