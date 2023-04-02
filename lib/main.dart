// ignore_for_file: use_key_in_widget_constructors, duplicate_ignore, deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app_troskovi/widgets/chart.dart';
import 'package:flutter_app_troskovi/widgets/nova_transakcija.dart';
import 'package:flutter_app_troskovi/models/transakcije.dart';
import 'package:flutter_app_troskovi/widgets/transakcija_lista.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'OpenSans',
        textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(fontFamily: 'OpenSans', fontSize: 18)),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: 'App troškovi',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//late String naslovInput;

  final List<Transakcije> _korisnickeTransakcije = [
    /* Transakcije(
      id: '1',
      naslov: 'Patike',
      cijena: 90.99,
      vrijeme: DateTime.now(),
    ),
    Transakcije(
      id: '2',
      naslov: 'Rucak',
      cijena: 22.85,
      vrijeme: DateTime.now(),
    ),*/
  ];

 List<Transakcije> get _nedavneTransakcije {
  return _korisnickeTransakcije.where((tx) {
    return tx.vrijeme.isAfter(
      DateTime.now().subtract(
        Duration(days: 7),
      ),
    ); 
  }).toList(); 
  }

  void _dodajNovuTransakciju(String txNaslov, double txCijena) {
    final novaTrans = Transakcije(
      naslov: txNaslov,
      cijena: txCijena,
      vrijeme: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _korisnickeTransakcije.add(novaTrans);
    });
  }

  // ignore: unused_element
  void _pocetakNoveTransakcije(BuildContext kntkst) {
    showModalBottomSheet(
        context: kntkst,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            // ignore: sort_child_properties_last
            child: NovaTransakcija(_dodajNovuTransakciju),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Aplikacija za troskove',
          style: TextStyle(fontFamily: 'OpenSans'),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _pocetakNoveTransakcije(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // ignore: sized_box_for_whitespace
            Chart(_nedavneTransakcije),
            TransakcijeLista(_korisnickeTransakcije)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _pocetakNoveTransakcije(context),
      ),
    );
  }
}
