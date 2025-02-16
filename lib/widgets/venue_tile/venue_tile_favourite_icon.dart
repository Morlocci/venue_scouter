import 'package:flutter/material.dart';

class VenueTileFavouriteIcon extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isFavourite;

  const VenueTileFavouriteIcon(
      {super.key, this.onPressed, required this.isFavourite});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavourite ? Icons.favorite : Icons.favorite_border,
        color: isFavourite ? Colors.red : Colors.grey,
      ),
      onPressed: onPressed,
    );
  }
}
