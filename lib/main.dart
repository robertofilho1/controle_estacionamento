import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Controle Vagas Condominio", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = "Existem vagas disponiveis";

  void _changepeople(int delta) {
    setState(() {
      _people += delta;

      if (_people >= 1) {
        _infoText = "Próximo Carro";
      } else if (_people == 0) {
        _infoText = "Existem vagas disponiveis";
      } else {
        _infoText = "Estamos Vazios!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          constraints: BoxConstraints.expand(),
          child: Image.asset(
            "images/estacionamento-1.jpg",
            fit: BoxFit.fitHeight,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Estacionamento",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
            Text("Edificio Santa Maria",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Vagas :$_people",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Text(
                          "+1",
                          style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          _changepeople(1);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Text(
                          "-1",
                          style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          _changepeople(-1);
                        },
                      ),
                    ),
                  ],
                ),
                Text(_infoText,
                    style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 30.0))
              ],
            )
          ],
        )
      ]),
    );
  }
}
