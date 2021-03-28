import 'package:flutter/material.dart';

class CardModel with ChangeNotifier {
  var id;
  var name;
  var sprite;
  var type1;
  var type2;

  CardModel({
    this.id,
    this.name,
    this.sprite,
    this.type1,
    this.type2,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    String pokeId = json['id'].toString();
    final List types = json['types'];
    if (types.length == 1) {
      return CardModel(
        id: pokeId,
        name: json['name'],
        sprite: json['sprites']['front_default'],
        type1: json['types'][0]['type']['name'],
        type2: null,
      );
    } else {
      return CardModel(
        id: pokeId,
        name: json['name'],
        sprite: json['sprites']['front_default'],
        type1: json['types'][0]['type']['name'],
        type2: json['types'][1]['type']['name'],
      );
    }
  }
}
