// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, avoid_print, prefer_const_constructors, unnecessary_cast

import './chart_bar.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_troskovi/models/transakcije.dart';

class Chart extends StatelessWidget {
  final List<Transakcije> nedavneTransakcije;

  Chart(this.nedavneTransakcije);

  List<Map<String, Object>> get skupCijenaTransakcija {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalnaSuma = 0;

      for (var i = 0; i < nedavneTransakcije.length; i++) {
        if (nedavneTransakcije[i].vrijeme.day == weekDay.day &&
            nedavneTransakcije[i].vrijeme.month == weekDay.month &&
            nedavneTransakcije[i].vrijeme.year == weekDay.year) {
          totalnaSuma += nedavneTransakcije[i].cijena;
        }
      }

      return {
        'dan': DateFormat.E().format(weekDay).substring(0, 1),
        'cijena': totalnaSuma,
      };
    });
  }

  double get ukupnaPotrosnja {
   return skupCijenaTransakcija.fold(0.0, (sum, item) {
      return sum + (item['cijena'] as double);
   });
  }

  @override
  Widget build(BuildContext context) {
    print(skupCijenaTransakcija);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: skupCijenaTransakcija.map((data) {
          return ChartBar(
  data['dan'] as String,
  data['cijena'] as double,
  ukupnaPotrosnja == 0.0
    ? 0.0
    : (data['cijena'] as double) / ukupnaPotrosnja,
);

        }).toList(),
      ),
    );
  }
}
