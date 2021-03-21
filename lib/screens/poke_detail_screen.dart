import 'package:flutter/material.dart';
import 'package:flutterdex/helpers/map_cardColor.dart';
import 'package:flutterdex/provider/poke_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PokeDetailScreen extends StatelessWidget {
  static const routeName = '/pokeDetailScreen';

  @override
  Widget build(BuildContext context) {
    final pokeId = ModalRoute.of(context).settings.arguments as String;
    final pokeData =
        Provider.of<PokeProvider>(context, listen: false).getPokeData(pokeId);

    return Scaffold(
        backgroundColor: setCardColor(pokeData.type1),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.width / 1.5,
              color: setCardColor(pokeData.type1),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Text(
                  toBeginningOfSentenceCase(pokeData.name),
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 35,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
