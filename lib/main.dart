import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String _informText = 'Informe seus dados!';
  void _resetCampos() {
    pesoController.text = '';
    alturaController.text = '';
    setState(() {
      _informText = '';
    });
  }

  void _calcular() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;

      double imc = peso / (altura * altura);
      if (imc < 18.6) {
        _informText =
            'Voce esta abaixo do peso (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 18.6 && imc <= 24.9) {
        _informText =
            'Voce esta no seu peso ideal (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 24.9 && imc <= 29.9) {
        _informText =
            'Voce esta levemente  acima do peso (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 29.9 && imc <= 34.9) {
        _informText =
            ' Voce esta com obesidade grau I (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 34.9 && imc <= 39.9) {
        _informText =
            ' Voce esta com obesidade grau II (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 40) {
        _informText =
            ' Voce esta com obesidade grau III (${imc.toStringAsPrecision(3)})';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Caluculadora de IMC'),
          backgroundColor: Colors.red,
          actions: [
            IconButton(
              icon: Icon(Icons.refresh, color: Colors.white),
              onPressed: () {
                _resetCampos();
              },
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Form(
          key: _formkey,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.person_outline,
                  size: 120,
                  color: Colors.red,
                ),
                TextField(
                  controller: pesoController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Peso KG',
                    labelStyle: TextStyle(color: Colors.red),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 25),
                ),
                TextField(
                  controller: alturaController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Altura',
                    labelStyle: TextStyle(color: Colors.red),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 25),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: Container(
                    height: 50,
                    child: RaisedButton(
                      onPressed: _calcular,
                      child: Text(
                        'Calcular',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      color: Colors.red,
                    ),
                  ),
                ),
                Text(
                  _informText,
                  style: TextStyle(fontSize: 20, color: Colors.red),
                )
              ],
            ),
          ),
        )));
  }
}
