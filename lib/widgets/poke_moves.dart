import 'package:flutter/material.dart';
import 'package:flutterdex/helpers/map_cardColor.dart';
import 'package:flutterdex/models/pokemon.dart';
import 'package:intl/intl.dart';

class PokeMoves extends StatelessWidget {
  final Pokemon pokeData;
  PokeMoves(this.pokeData);

  Widget moveLabel(String text, dynamic pokeData) {
    return Container(
      decoration: BoxDecoration(
        color: setTypeColor(pokeData.type1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          toBeginningOfSentenceCase(text),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(2, 2),
                blurRadius: 7,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List moveList = pokeData.moves;
    return Container(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: GridView.count(
        padding: EdgeInsets.zero,
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        childAspectRatio: 6 / 1.5,
        crossAxisSpacing: 4,
        children: moveList.map((item) => moveLabel(item, pokeData)).toList(),
      ),
    );
  }
}
