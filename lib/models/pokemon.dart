import 'package:flutter/material.dart';

class Pokemon with ChangeNotifier {
  var id;
  var name;
  var types;

  Pokemon({
    this.id,
    this.name,
    this.types,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      types: json['types'][0]['type'],
    );
  }
}
