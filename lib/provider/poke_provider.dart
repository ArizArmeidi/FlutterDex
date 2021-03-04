import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/pokemon.dart';

class PokeProvider with ChangeNotifier {
  Pokemon pokemon = Pokemon();

  getPokemonData() async {
    Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon/1/');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      pokemon = Pokemon.fromJson(extractedData);
      inspect(pokemon);
    } catch (e) {
      print(e);
    }
  }
}
