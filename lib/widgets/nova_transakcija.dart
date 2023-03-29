// ignore_for_file: use_key_in_widget_constructors, avoid_print, deprecated_member_use

import 'package:flutter/material.dart';

class NovaTransakcija extends StatefulWidget {
  final Function dodajTx;

  NovaTransakcija(this.dodajTx);

  @override
  State<NovaTransakcija> createState() => _NovaTransakcijaState();
}

class _NovaTransakcijaState extends State<NovaTransakcija> {
  final naslovController = TextEditingController();

  final cijenaController = TextEditingController();

  void submitdata() {
    final uneseniNaslov = naslovController.text;
    final unesenaCijena = double.parse(cijenaController.text);
if(uneseniNaslov.isEmpty || unesenaCijena<=0){
  return;
}

    widget.dodajTx(
      uneseniNaslov,
      unesenaCijena, 
    );

  Navigator.of(context).pop();

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'Naslov'),
              controller: naslovController,
               onSubmitted: (_) => submitdata(),
              // onChanged: (nas){
              //   naslovInput=nas;
              //},
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Cijena'),
              controller: cijenaController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitdata(),
              // onChanged: (cij) {
              //  cijenaInput=cij;
              // },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
              ),
              // ignore: sort_child_properties_last
              child: const Text('Dodaj transakciju',
                  style: TextStyle(color: Colors.purple)),
              onPressed:submitdata,
            ),
          ],
        ),
      ),
    );
  }
}
