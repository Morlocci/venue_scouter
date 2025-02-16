import 'package:flutter/material.dart';

class VenueFetchButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const VenueFetchButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.favorite_border,
        color: Colors.blue,
      ),
      onPressed: onPressed,
    );
  }
}
