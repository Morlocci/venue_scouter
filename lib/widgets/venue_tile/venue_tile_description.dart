import 'package:flutter/material.dart';

class VenueTileDescription extends StatelessWidget {
  final String venueDescription;

  const VenueTileDescription({super.key, required this.venueDescription});

  @override
  Widget build(BuildContext context) {
    return Text(
      venueDescription,
      maxLines: 2,
      overflow: TextOverflow.fade,
      style: const TextStyle(fontSize: 12, color: Colors.black),
    );
  }
}
