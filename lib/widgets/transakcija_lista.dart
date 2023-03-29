// ignore_for_file: prefer_interpolation_to_compose_strings, sized_box_for_whitespace
import 'package:flutter_app_troskovi/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transakcije.dart';

class TransakcijeLista extends StatelessWidget {
  final List<Transakcije> transakcije;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  TransakcijeLista(this.transakcije);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      
        child: ListView.builder(
          itemBuilder: (kontekst,index){
              return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      transakcije[index].cijena.toStringAsFixed(2) + '€',
                      style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        transakcije[index].naslov,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        DateFormat('dd-MM-yyyy').format(transakcije[index].vrijeme),
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          itemCount: transakcije.length,
         
            
          
        ),
      );
  
  }
}
