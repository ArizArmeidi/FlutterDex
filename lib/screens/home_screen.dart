import 'package:flutter/material.dart';
import 'package:flutterdex/provider/poke_provider.dart';
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
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(25, 30, 25, 15),
            height: MediaQuery.of(context).size.width / 1.5,
            width: MediaQuery.of(context).size.width,
            child: HomeSearch(),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(25),
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(bottom: 25),
                  child: Placeholder(
                    fallbackHeight: 100,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
