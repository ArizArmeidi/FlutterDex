import 'package:flutter/material.dart';
import 'package:flutterdex/provider/poke_provider.dart';
import 'package:flutterdex/widgets/poke_card.dart';
import 'package:provider/provider.dart';

import '../widgets/home_search.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<PokeProvider>(context, listen: false).getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<PokeProvider>(context);
    final pokeData = data.pokeList;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(25, 5, 25, 25),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 30),
              height: MediaQuery.of(context).size.width / 1.5,
              width: MediaQuery.of(context).size.width,
              child: HomeSearch(),
            ),
            Expanded(
              child: data.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView(
                      padding: EdgeInsets.only(top: 10),
                      children: [
                        Column(
                          children: pokeData
                              .map((item) => PokeCard(item, context))
                              .toList(),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
