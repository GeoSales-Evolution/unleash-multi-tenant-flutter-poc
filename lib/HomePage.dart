import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unleash app'),
      ),
      body: Center(
        child: Container(
          height: 80,
          width: 300,
          child: Text(
            'Você está logado!!',
            style: TextStyle(color: Colors.black, fontSize: 35),
          ),
        ),
      ),
    );
  }
}
