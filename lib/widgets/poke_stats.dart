import 'package:flutter/material.dart';
import 'package:flutterdex/helpers/map_cardColor.dart';
import 'package:flutterdex/models/pokemon.dart';

class PokeStats extends StatelessWidget {
  final Pokemon pokeData;

  PokeStats(this.pokeData);

  String convertValue(value) {
    double initValue = value * 100;
    return initValue.toStringAsFixed(0);
  }

  Widget statsBar(String label, double value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: setCardColor(pokeData.type1),
          ),
        ),
        Spacer(),
        Text(
          convertValue(value),
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: setCardColor(pokeData.type1),
          ),
        ),
        Container(
          width: 250,
          height: 15,
          margin: EdgeInsets.only(left: 15),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[350],
              valueColor:
                  AlwaysStoppedAnimation<Color>(setCardColor(pokeData.type1)),
              value: value,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Column(
        children: [
          statsBar('HP', pokeData.hp),
          statsBar('Attack', pokeData.attack),
        ],
      ),
    );
  }
}
