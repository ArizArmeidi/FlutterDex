import 'package:flutter/material.dart';
import 'package:flutterdex/helpers/map_cardColor.dart';
import 'package:intl/intl.dart';

class TypeCard extends StatelessWidget {
  final String type;
  TypeCard(this.type);
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      shadowColor: setTypeColor(type),
      borderRadius: BorderRadius.circular(3),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        decoration: BoxDecoration(
          color: setTypeColor(type),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Text(
          toBeginningOfSentenceCase(type),
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
