import 'package:flutter/material.dart';

class Pokemon with ChangeNotifier {
  var id;
  var name;
  var sprite;
  var type1;
  var type2;
  var hp;
  var attack;

  Pokemon({
    this.id,
    this.name,
    this.sprite,
    this.type1,
    this.type2,
    this.hp,
    this.attack,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    String pokeId = json['id'].toString();
    int hp = json['stats'][0]['base_stat'];
    int attack = json['stats'][1]['base_stat'];
    double pokeHp = hp / 100;
    double pokeAttack = attack / 100;
    final List types = json['types'];

    if (types.length == 1) {
      return Pokemon(
        id: pokeId,
        name: json['name'],
        sprite: json['sprites']['front_default'],
        type1: json['types'][0]['type']['name'],
        type2: null,
        hp: pokeHp,
        attack: pokeAttack,
      );
    } else {
      return Pokemon(
        id: pokeId,
        name: json['name'],
        sprite: json['sprites']['front_default'],
        type1: json['types'][0]['type']['name'],
        type2: json['types'][1]['type']['name'],
        hp: pokeHp,
        attack: pokeAttack,
      );
    }
  }
}
