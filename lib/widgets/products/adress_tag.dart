import 'package:flutter/material.dart';

class AdressTag extends StatelessWidget {

  final String adress;

  AdressTag({this.adress});

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(color: Colors.grey, width: 1.0)),
            child: Text(adress),
          );
  }
}