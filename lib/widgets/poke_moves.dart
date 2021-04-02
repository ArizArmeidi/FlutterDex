import 'package:flutter/material.dart';
import 'package:flutterdex/models/pokemon.dart';
import 'package:intl/intl.dart';

class PokeMoves extends StatelessWidget {
  final Pokemon pokeData;
  PokeMoves(this.pokeData);

  Widget moveLabel(dynamic text) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          toBeginningOfSentenceCase(text),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
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
        mainAxisSpacing: 2,
        childAspectRatio: 6 / 1.5,
        crossAxisSpacing: 2,
        children: moveList.map((item) => moveLabel(item)).toList(),
      ),
    );
  }
}
