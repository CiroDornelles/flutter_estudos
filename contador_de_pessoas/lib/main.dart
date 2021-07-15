import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "contador de pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pessoa = 0;
  String texto = "Pode entrar!!!";

  void _mudarpessoa(int numero) {
    setState(() {
      pessoa += numero;

      if (pessoa < 0) {
        texto = "que diabo é isso?";
      } else if (pessoa <= 10) {
        texto = "pode entrar";
      } else {
        texto = "ta lotado meu irmão ta doido?";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Pessoas $pessoa",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextButton(
                      onPressed: () {
                        _mudarpessoa(1);
                      },
                      child: Text(
                        "+1",
                        style: TextStyle(fontSize: 40.0, color: Colors.white),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextButton(
                      onPressed: () {
                        _mudarpessoa(-1);
                      },
                      child: Text(
                        "-1",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      )),
                )
              ],
            ),
            Text(texto,
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 30.0),
                textAlign: TextAlign.center),
          ],
        ),
      ],
    );
  }
}
