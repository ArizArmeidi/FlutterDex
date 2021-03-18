import 'package:flutter/material.dart';

class PokeList with ChangeNotifier {
  var mainUrl;

  PokeList({
    this.mainUrl,
  });

  factory PokeList.getUrl(dynamic json) {
    return PokeList(
      mainUrl: json['url'],
    );
  }
}
