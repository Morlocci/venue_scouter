import 'package:flutter/material.dart';
import 'package:venue_scouter/widgets/venue_tile/venue_tile_description.dart';
import 'package:venue_scouter/widgets/venue_tile/venue_tile_favourite_icon.dart';
import 'package:venue_scouter/widgets/venue_tile/venue_tile_image.dart';
import 'package:venue_scouter/widgets/venue_tile/venue_tile_name.dart';

class VenueTile extends StatelessWidget {
  final String venueName;
  final String venueDescription;
  final String? imageUrl;
  final bool isFavouriteVenue;
  final VoidCallback onFavouriteToggle;

  const VenueTile({
    super.key,
    required this.venueName,
    required this.venueDescription,
    this.imageUrl,
    required this.isFavouriteVenue,
    required this.onFavouriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: VenueImage(imageUrl: imageUrl),
            title: VenueTileName(venueName: venueName),
            subtitle: VenueTileDescription(venueDescription: venueDescription),
            trailing: VenueTileFavouriteIcon(
              isFavourite: isFavouriteVenue,
              onPressed: onFavouriteToggle,
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
