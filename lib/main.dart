import 'package:flutter/material.dart';
import 'package:flutterdex/provider/poke_provider.dart';
import 'package:flutterdex/screens/poke_detail_screen.dart';
import 'package:provider/provider.dart';

import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PokeProvider(),
      child: MaterialApp(
        title: 'Flutter Dex',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.transparent,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            elevation: 0,
          ),
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
        routes: {
          PokeDetailScreen.routeName: (ctx) => PokeDetailScreen(),
        },
      ),
    );
  }
}
