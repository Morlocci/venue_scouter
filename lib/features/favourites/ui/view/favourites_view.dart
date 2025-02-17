import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:venue_scouter/features/favourites/ui/view_model/favourites_view_model.dart';
import 'package:venue_scouter/widgets/top_header_bar.dart';
import 'package:venue_scouter/widgets/venue_tile/venue_tile.dart';

import 'package:venue_scouter/venue/domain/service/venue_service.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavouritesViewModel(
        Provider.of<VenueService>(context, listen: false),
      )..getFavouriteVenues(),
      child: Consumer<FavouritesViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: const TopHeaderBar(headerName: 'Favourite Venues'),
            body: viewModel.venues.isEmpty
                ? const Center(child: Text('No favourite venues'))
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: viewModel.venues.length,
                    itemBuilder: (context, index) {
                      final venue = viewModel.venues[index];
                      return VenueTile(
                        venueName: venue.name,
                        venueDescription: venue.shortDescription,
                        imageUrl: venue.imageUrl,
                        isFavouriteVenue: viewModel.isVenueFavourite(venue.id),
                        onFavouriteToggle: () {
                          viewModel.toggleFavourite(venue);
                        },
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
