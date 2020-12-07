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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Caluculadora de IMC'),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.person_outline,
              size: 120,
              color: Colors.red,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Peso KG',
                labelStyle: TextStyle(color: Colors.red),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Altura',
                labelStyle: TextStyle(color: Colors.red),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25),
            ),
            Container(
              height: 50,
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  'Calcular',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                color: Colors.red,
              ),
            ),
            Text(
              'Info',
              style: TextStyle(fontSize: 20, color: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}
