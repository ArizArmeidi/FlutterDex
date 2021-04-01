import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterdex/models/card_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutterdex/models/pokemon.dart';

class PokeProvider with ChangeNotifier {
  bool isLoading;
  bool isRequestError = false;
  List<CardModel> pokeList = [];
  List<Pokemon> descList = [];
  Pokemon pokemon = Pokemon();

  Future<void> getHomeData() async {
    int pokeNumber = 5;
    List<CardModel> tempList = [];
    isRequestError = false;
    for (int index = 1; index < pokeNumber + 1; index++) {
      int pokeIndex;
      Random rnd;
      int min = 1;
      int max = 893;
      rnd = new Random();
      pokeIndex = min + rnd.nextInt(max - min);
      try {
        isLoading = true;
        Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokeIndex');
        final response = await http.get(url);
        final responseData = json.decode(response.body) as Map<String, dynamic>;
        tempList.add(CardModel.fromJson(responseData));
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

  Future<void> getPokeData(String id) async {
    isRequestError = false;
    List<Pokemon> tempDescList = [];
    Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$id');
    Uri secUrl = Uri.parse('https://pokeapi.co/api/v2/pokemon-species/$id');
    try {
      isLoading = true;
      final response = await http.get(url);
      final secResponse = await http.get(secUrl);
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      final secResponseData =
          json.decode(secResponse.body) as Map<String, dynamic>;
      pokemon = Pokemon.fromJson(responseData, secResponseData);
      descList = tempDescList;
      isLoading = false;
      notifyListeners();
      inspect(pokemon);
    } catch (e) {
      isLoading = false;
      isRequestError = true;
      notifyListeners();
      throw (e);
    }
  }
}
