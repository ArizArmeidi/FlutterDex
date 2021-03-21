import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutterdex/models/pokemon.dart';

class PokeProvider with ChangeNotifier {
  bool isLoading;
  List<Pokemon> pokeList = [];
  Pokemon pokemon = Pokemon();

  Future<void> getHomeData() async {
    int pokeNumber = 5;
    List<Pokemon> tempList = [];

    for (int index = 1; index < pokeNumber + 1; index++) {
      int pokeIndex;
      Random rnd;
      int min = 1;
      int max = 151;
      rnd = new Random();
      pokeIndex = min + rnd.nextInt(max - min);
      try {
        isLoading = true;
        Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokeIndex');
        final response = await http.get(url);
        final responseData = json.decode(response.body) as Map<String, dynamic>;
        tempList.add(Pokemon.fromJson(responseData));
      } catch (e) {
        throw (e);
      }
    }
    if (tempList.length == pokeNumber) {
      pokeList = tempList;
      isLoading = false;
      notifyListeners();
      inspect(pokeList);
    }
  }

  Pokemon getPokeData(String id) {
    return pokeList.firstWhere((data) => data.id == id);
  }
}
