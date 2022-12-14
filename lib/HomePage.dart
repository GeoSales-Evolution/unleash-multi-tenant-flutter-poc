import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:unleash/unleash.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Unleash unl;

  @override
  Widget build(BuildContext context) {
    initConfigs();
    String flagText;

    return Scaffold(
      appBar: AppBar(
        title: Text('Unleash app'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 80,
                width: 300,
                child: Text(
                  'Consulta de flags!!',
                  style: TextStyle(color: Colors.black, fontSize: 35),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Flag'),
                onChanged: (flag) {
                  flagText = flag;
                },
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  print('flag ativa? == ${unl.isEnabled(flagText)}');
                },
                child: Text(
                  'Consultar',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),

            if (unl.isEnabled('flag'))
              Container(
                height: 30,
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                    onPressed: () {},
                    child: Text('gitlab flag')
                ),
              ),

            if (unl.isEnabled('teste_docker_proxy'))
              Container(
                height: 30,
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.green, borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                    onPressed: () {},
                    child: Text('docker proxy flag')
                ),
              ),

            if (unl.isEnabled('teste_relatorio_mobile'))
              Container(
                height: 30,
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent, borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                    onPressed: () {},
                    child: Text('mobile report flag')
                ),
              ),

          ],
        ),
      )
    );
  }

  Future<void> initConfigs() async {
    await DotEnv.load();

    unl = await Unleash.init(
      UnleashSettings(
        appName: '<appname>',
        instanceId: '${DotEnv.env['INSTANCE_ID']}',
        unleashApi: Uri.parse('${DotEnv.env['URL_API']}'),
      ),
    );
  }
}