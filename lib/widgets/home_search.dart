import 'package:flutter/material.dart';

import 'search_bar.dart';

class HomeSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'FlutterDex',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 35,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 45),
            child: Text(
              'Search Pokémon by entering their name or using the Pokédex number.',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
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
