import 'package:flutter/material.dart';
import 'package:navegation/TelaSecundaria.dart';
import 'package:navegation/Quarta.dart';
import 'package:navegation/Quinta.dart';
import 'package:navegation/main.dart'; // Certifique-se de que TelaPrincipal está definido aqui

class Terceira extends StatefulWidget {
  @override
  _Terceira createState() => _Terceira();
}

class _Terceira extends State<Terceira> with RestorationMixin {
  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2021, 7, 25));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2021),
          lastDate: DateTime(2022),
        );
      },
    );
  }

  @override
  String? get restorationId => 'terceira_screen'; // Adicione este getter

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        ));
      });
    }
  }

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
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Text(
              "Terceira tela!!!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                _restorableDatePickerRouteFuture.present();
              },
              child: Text('Open Date Picker'),
            ),
            SizedBox(height: 20),
            Text(
              'Selecionado: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
