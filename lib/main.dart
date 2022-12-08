import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'HomePage.dart';

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
                    labelText: 'Login'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Tenant'),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomePage()));
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