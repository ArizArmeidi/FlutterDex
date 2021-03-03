import 'dart:ui';

import 'package:FlutterDex/widgets/searchBar.dart';
import 'package:flutter/material.dart';

class HomeSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pokédex',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 35,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 45),
            child: Text(
              'Search Pokémon by entering their name or using the Pokédex number.',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
              ),
            ),
          ),
          SearchBar(),
        ],
      ),
    );
  }
}
