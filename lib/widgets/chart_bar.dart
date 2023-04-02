// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double troskoviCijena;
  final double procenatUkupnihTroskova;

  ChartBar(this.label, this.troskoviCijena, this.procenatUkupnihTroskova);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('\$${troskoviCijena.toStringAsFixed(0)}'),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Color.fromRGBO(220, 220, 200, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              )
            ],
          ),
        ),
        FractionallySizedBox(
          heightFactor: procenatUkupnihTroskova,
          child: Container(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
