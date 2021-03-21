import 'package:flutter/material.dart';
import 'package:flutterdex/helpers/map_cardColor.dart';
import 'package:flutterdex/provider/poke_provider.dart';
import 'package:flutterdex/widgets/type_card.dart';
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
              height: MediaQuery.of(context).size.width / 2,
              color: setCardColor(pokeData.type1),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 4.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                ),
                Positioned(
                  right: 35,
                  bottom: -50,
                  left: 35,
                  child: FadeInImage.assetNetwork(
                    placeholder: 'images/pokeLoad.gif',
                    image: pokeData.sprite,
                    imageScale: 0.35,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      toBeginningOfSentenceCase(pokeData.name),
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 35,
                      ),
                    ),
                    Text(
                      '#' + pokeData.id.toString(),
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (pokeData.type1 != null) TypeCard(pokeData.type1),
                        if (pokeData.type2 != null) SizedBox(width: 10),
                        if (pokeData.type2 != null) TypeCard(pokeData.type2),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
