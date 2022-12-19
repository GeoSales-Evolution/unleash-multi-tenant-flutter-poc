import 'package:flutter/material.dart';

import 'login_controller.dart';
import 'main.dart';

class InfoUser extends StatefulWidget {
  final LoginController login;
  const InfoUser(this.login);

  @override
  _InfoUserState createState() => _InfoUserState();
}

class _InfoUserState extends State<InfoUser> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Informações do Usuário Logado',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
          ),
          Wrap(
            spacing: 10.0,
            children: <Widget>[
              const Text(
                'Login:',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
              ),
              Text(
                widget.login.getLogin,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 25),
              ),
            ],
          ),
          Wrap(
            spacing: 10.0,
            children: <Widget>[
              const Text(
                'Tenant:',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
              ),
              Text(
                widget.login.getTenant,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 25),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () => {
                  print('Ainda não sei como mas vai'),
                },
                child: Text(
                  'Switch Tenant',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () => {
                  widget.login.logOff(),
                  Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage())),
                },
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}