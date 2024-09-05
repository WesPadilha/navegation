import 'package:flutter/material.dart';
import 'package:navegation/main.dart';
import 'package:navegation/Terceira.dart';
import 'package:navegation/Quarta.dart';
import 'package:navegation/Quinta.dart';

class TelaSecundaria extends StatefulWidget {
  @override
  _TelaSecundariaState createState() => _TelaSecundariaState();
}

class _TelaSecundariaState extends State<TelaSecundaria> {
  String _selectedLanguage = 'Português';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Principal"),
        backgroundColor: Colors.orange,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          // Dropdown para selecionar o idioma
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DropdownButton<String>(
              value: _selectedLanguage,
              icon: Icon(Icons.language, color: Colors.white),
              dropdownColor: Colors.orange,
              underline: Container(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLanguage = newValue!;
                });
              },
              items: <String>['Português', 'Inglês', 'Espanhol', 'Francês', 'Alemão']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
            ),
          ),
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
            child: Text("Linguagem"),
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
      body: Center(
        child: DialogExample(), // Exibe o AlertDialog quando pressionado
      ),
    );
  }
}

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}
