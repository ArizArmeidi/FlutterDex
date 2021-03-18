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
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(poke.name),
    );
  }
}
