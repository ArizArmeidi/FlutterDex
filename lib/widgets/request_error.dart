import 'package:flutter/material.dart';

class RequestError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 150),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.black,
            size: 100,
          ),
          SizedBox(height: 10),
          Text(
            'Who\'s that Pokémon?',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 10),
            child: Text(
              'Please make sure that you entered the correct Pokémon name or id',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              onPrimary: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 25),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              shadowColor: Colors.red,
            ),
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Return Home'),
          )
        ],
      ),
    );
  }
}
