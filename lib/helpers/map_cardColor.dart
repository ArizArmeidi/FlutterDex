import 'package:flutter/material.dart';

Color setCardColor(String type) {
  type = type.toLowerCase();
  if (type == null) {
    return Color(0xffdbd9d9);
  }
  switch (type) {
    case 'fire':
      return Color(0xfffd7d24);
      break;
    case 'grass':
      return Color(0xff8ede54);
      break;
    case 'water':
      return Color(0xFF58ABF6);
      break;
    case 'rock':
      return Color(0xffd5e1eb);
      break;
    case 'bug':
      return Color(0xff50f2d0);
      break;
    case 'normal':
      return Color(0xff9fc7b7);
      break;
    case 'poison':
      return Color(0xff5685f5);
      break;
    case 'electric':
      return Color(0xfffaf25f);
      break;
    case 'ground':
      return Color(0xfff0c37d);
      break;
    case 'ice':
      return Color(0xff7aedfa);
      break;
    case 'dark':
      return Color(0xffd3e0e0);
      break;
    case 'fairy':
      return Color(0xff9f71e3);
      break;
    case 'psychic':
      return Color(0xffce91eb);
      break;
    case 'fighting':
      return Color(0xff9cd44e);
      break;
    case 'ghost':
      return Color(0xff6d3bad);
      break;
    default:
      return Color(0xffdbd9d9);
  }
}
