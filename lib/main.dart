import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Contador de Aulas Aubay!",
    home: Home()
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _aulas = 0;
  String _infoText = "Pode Descansar!";

  void _changeAula(int delta) {
    setState(() {
      _aulas += delta;

      if (_aulas < 0) {
        _infoText = "Oops! Non Exists.";
      } else if (_aulas <= 10) {
        _infoText = "Continue com o Trabalho";
      } else if (_aulas <= 20) {
        _infoText = "Ta quase acabando!";
      } else {
        _infoText = "Terminou, vá descansar!";
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/aubayfundo.png",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Aulas: $_aulas", 
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                      child: Text(
                        "+1",
                        style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 40.0),
                      ),
                      onPressed: () {
                        _changeAula(1);
                        debugPrint("+1");
                      },
                    ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                      child: Text(
                        "-1",
                        style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 40.0),
                      ),
                      onPressed: () {
                        _changeAula(-1);
                        debugPrint("-1");
                      },
                    ),
                )
              ],
            ),
            Text(
              "$_infoText",
              style: TextStyle(color: Colors.white, 
                              fontStyle: FontStyle.italic,
                              fontSize: 30.0 )
            )
          ],
        )
      ],
    );
  }
}