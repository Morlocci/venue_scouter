import 'package:flutter/material.dart';

class VenueImage extends StatelessWidget {
  final String? imageUrl;

  const VenueImage({super.key, this.imageUrl});

  static const double _imageWidth = 50;
  static const double _imageHeight = 50;
  static const BorderRadius _borderRadius = BorderRadius.all(
    Radius.circular(8),
  );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: _borderRadius,
      child: imageUrl != null && imageUrl!.isNotEmpty
          ? Image.network(
              imageUrl!,
              width: _imageWidth,
              height: _imageHeight,
              fit: BoxFit.cover,
            )
          : Container(
              width: _imageWidth,
              height: _imageHeight,
              decoration: BoxDecoration(
                color: Colors.grey[300], // Placeholder color
                borderRadius: _borderRadius,
              ),
              child: const Icon(Icons.image, color: Colors.grey),
            ),
    );
  }
}
