import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class LoginController {

  var _usuarios;
  String _tenant;
  String _login;

  get getTenant => _tenant;
  get getLogin => _login;

  void logOff() {
    _login = null;
    _tenant = null;
  }

  Future<void> acessos() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path;
    File file = File('$path/acessos.txt');
    var fileArquivo = await file.create();
    fileArquivo.writeAsString(
        '{"acesso": {"pewter": ["dev1","dev2","dev3"],"goldenrod": ["dev4","dev5","dev6"],"cerulean": ["dev7","dev8","dev9"]}}');
    _usuarios = json.decode(await fileArquivo.readAsString());
  }

  void populaTenant(String tenant) {
    _tenant = tenant;
  }

  void populaLogin(String login) {
    _login = login;
  }

  bool validaLogin() {
    if (_tenant == null || _login == null) {
      return false;
    }

    List<dynamic> listaLogins = _usuarios['acesso'][_tenant];

    if (listaLogins == null) {
      return false;
    }

    return listaLogins.contains(_login);
  }
}