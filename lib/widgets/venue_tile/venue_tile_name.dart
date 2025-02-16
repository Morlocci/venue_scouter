import 'package:flutter/material.dart';

class VenueTileName extends StatelessWidget {
  final String venueName;

  const VenueTileName({super.key, required this.venueName});

  @override
  Widget build(BuildContext context) {
    return Text(
      venueName,
      style: const TextStyle(
        fontSize: 15,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
