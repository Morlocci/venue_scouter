import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:venue_scouter/features/nearby_venues/ui/view_model/nearby_venues_view_model.dart';
import 'package:venue_scouter/widgets/top_header_bar.dart';
import 'package:venue_scouter/widgets/venue_tile/venue_tile.dart';
import 'package:venue_scouter/venue/domain/service/venue_service.dart';
import 'package:venue_scouter/location/service/location_service.dart';

class NearbyVenues extends StatelessWidget {
  const NearbyVenues({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NearbyVenuesViewModel(
        Provider.of<VenueService>(context, listen: false),
        Provider.of<LocationService>(context, listen: false),
      )..init(),
      child: Consumer<NearbyVenuesViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: const TopHeaderBar(headerName: 'Nearby Venues'),
            body: viewModel.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
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
