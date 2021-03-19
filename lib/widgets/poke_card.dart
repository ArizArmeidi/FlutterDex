import 'package:flutter/material.dart';

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
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('#' + poke.id.toString()),
          Text(poke.name),
          // Text(poke.name),
        ],
      ),
    );
  }
}
