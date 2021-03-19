import 'dart:developer';

import 'package:flutter/material.dart';

class Pokemon with ChangeNotifier {
  var id;
  var name;
  var type1;
  var type2;

  Pokemon({
    this.id,
    this.name,
    this.type1,
    this.type2,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    final List types = json['types'];
    if (types.length == 1) {
      return Pokemon(
        id: json['id'],
        name: json['name'],
        type1: json['types'][0]['type']['name'],
        type2: null,
      );
    } else {
      return Pokemon(
        id: json['id'],
        name: json['name'],
        type1: json['types'][0]['type']['name'],
        type2: json['types'][1]['type']['name'],
      );
    }
  }
}
