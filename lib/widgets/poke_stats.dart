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
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: setTypeColor(pokeData.type1),
            ),
          ),
          Spacer(),
          Text(
            convertValue(value),
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: setTypeColor(pokeData.type1),
            ),
          ),
          Container(
            width: 250,
            height: 10,
            margin: EdgeInsets.only(left: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[300],
                valueColor:
                    AlwaysStoppedAnimation<Color>(setCardColor(pokeData.type1)),
                value: value,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Column(
        children: [
          SizedBox(height: 15),
          statsBar('HP', pokeData.hp),
          statsBar('ATK', pokeData.attack),
          statsBar('DEF', pokeData.defense),
          statsBar('SATK', pokeData.spAttack),
          statsBar('SDEF', pokeData.spDefense),
          statsBar('SPD', pokeData.speed),
        ],
      ),
    );
  }
}
