import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutterdex/helpers/map_cardColor.dart';

class PokeCard extends StatelessWidget {
  final dynamic poke;
  final BuildContext context;

  const PokeCard(this.poke, this.context);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 20, top: 5),
      decoration: BoxDecoration(
        color: setCardColor(poke.type1.toString()),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('#' + poke.id.toString()),
              Text(
                toBeginningOfSentenceCase(poke.name),
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Positioned(
            right: -35,
            bottom: -50,
            child: Image.network(
              poke.sprite,
              scale: 0.55,
            ),
          )
        ],
      ),
    );
  }
}
