import 'package:flutter/material.dart';

class Pokemon with ChangeNotifier {
  var name;
  var types;

  Pokemon({
    this.name,
    this.types,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      types: json['types'],
    );
  }
}
