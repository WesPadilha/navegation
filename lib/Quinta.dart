import 'package:flutter/material.dart';
import 'package:navegation/TelaSecundaria.dart';
import 'package:navegation/Terceira.dart';
import 'package:navegation/Quarta.dart';
import 'package:navegation/main.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Quinta(),
    );
  }
}

class Quinta extends StatefulWidget {
  @override 
  _Quinta createState() => _Quinta();
}

class _Quinta extends State<Quinta> {
  SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Principal"),
        backgroundColor: Colors.orange,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TelaPrincipal()),
              );
            },
            child: Text("Home"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent, // Remove a cor de fundo
              foregroundColor: Colors.white, // Cor do texto
              side: BorderSide.none, // Remove a borda
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TelaSecundaria()),
              );
            },
            child: Text("Contatos"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent, // Remove a cor de fundo
              foregroundColor: Colors.white, // Cor do texto
              side: BorderSide.none, // Remove a borda
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Terceira()),
              );
            },
            child: Text("Calendario"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent, // Remove a cor de fundo
              foregroundColor: Colors.white, // Cor do texto
              side: BorderSide.none, // Remove a borda
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Quarta()),
              );
            },
            child: Text("Imagens"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent, // Remove a cor de fundo
              foregroundColor: Colors.white, // Cor do texto
              side: BorderSide.none, // Remove a borda
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Quinta()),
              );
            },
            child: Text("Quinta"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent, // Remove a cor de fundo
              foregroundColor: Colors.white, // Cor do texto
              side: BorderSide.none, // Remove a borda
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Text(
              "QUinta!!!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Escolha uma opção:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            RadioListTile<SingingCharacter>(
              title: const Text('Lafayette'),
              value: SingingCharacter.lafayette,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            RadioListTile<SingingCharacter>(
              title: const Text('Thomas Jefferson'),
              value: SingingCharacter.jefferson,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

enum SingingCharacter { lafayette, jefferson }
