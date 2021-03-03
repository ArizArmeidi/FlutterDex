import 'package:flutter/material.dart';

import 'package:FlutterDex/widgets/homeSearch.dart';

class HomeScreen extends StatelessWidget {
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
