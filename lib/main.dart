import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'login_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var _loginController = LoginController();
    _loginController.acessos();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 120.0),
              child: Center(
                child: Container(
                  width: 300,
                  height: 100,
                  child: Text(
                    'Unleash Multi Tenant POC',
                    style: TextStyle(color: Colors.black, fontSize: 35),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Login'
                  ),
                  onChanged: (login) {
                    _loginController.populaLogin(login);
                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Tenant'
                  ),
                  onChanged: (tenant) {
                    _loginController.populaTenant(tenant);
                  }
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  if (_loginController.validaLogin()) {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => HomePage(_loginController)));
                  } else {
                    print("Usuario não cadastrado");
                  }
                },
                child: Text(
                  'Entrar',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}