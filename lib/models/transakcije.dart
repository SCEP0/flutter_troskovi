// ignore_for_file: unused_import

import 'package:flutter/foundation.dart';

class Transakcije {
  final String id;
  final String naslov;
  final double cijena;
  final DateTime vrijeme;

  Transakcije(
      {required this.id,
      required this.naslov,
      required this.cijena,
      required this.vrijeme});
}
