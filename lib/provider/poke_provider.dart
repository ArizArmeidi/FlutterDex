import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutterdex/models/pokemon.dart';

class PokeProvider with ChangeNotifier {
  bool isLoading;
  Pokemon pokemon = Pokemon();
  List<Pokemon> pokeList = [];

  getPokemonData() async {
    int pokeNumber = 5;
    List<Pokemon> tempList = [];

    for (int index = 1; index < pokeNumber + 1; index++) {
      try {
        isLoading = true;
        Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$index/');
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
}

// Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=10');
// Uri listUrl;
// List pokeUrl = [];
// List tempPoke = [];
// try {
//   final response = await http.get(url);
//   final extractedData = json.decode(response.body) as Map<String, dynamic>;
//   var tempData = [];
//   List items = extractedData['results'];
//   tempData = items.map((data) => PokeList.getUrl(data)).toList();
//   _pokelist = tempData;
//   _pokelist.forEach((element) async {
//     Uri myUrl = Uri.parse(element.mainUrl);
//     listUrl = myUrl;
//     pokeUrl.add(listUrl);
//   });
//   pokeUrl.forEach((element) async {
//     final urlResponse = await http.get(element);
//     final data = json.decode(urlResponse.body) as Map<String, dynamic>;
//     tempPoke.add(Pokemon.fromJson(data));
//   });
//   pokemon = tempPoke;
//   inspect(pokemon);
//   notifyListeners();
// } catch (e) {
//   print(e);
// }
