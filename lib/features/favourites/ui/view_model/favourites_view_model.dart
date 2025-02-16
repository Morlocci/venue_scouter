import 'package:flutter/material.dart';
import 'package:venue_scouter/venue/domain/entities/venue.dart';
import 'package:venue_scouter/venue/domain/service/venue_service.dart';

class FavouritesViewModel extends ChangeNotifier {
  final VenueService _venueService;

  FavouritesViewModel(this._venueService) {
    getFavouriteVenues();
  }

  String get headerTitle => 'Favourite Venues';

  List<Venue> _favouriteVenues = [];

  List<Venue> get venues => _favouriteVenues;

  void getFavouriteVenues() {
    _favouriteVenues = _venueService.favouriteVenues;
    notifyListeners();
  }

  bool isVenueFavourite(String venueId) {
    return _venueService.isVenueFavourite(venueId);
  }

  void toggleFavourite(Venue venue) {
    if (isVenueFavourite(venue.id)) {
      _venueService.removeVenueFromFavourites(venue);
    } else {
      _venueService.addVenueToFavourites(venue);
    }
    getFavouriteVenues();
  }
}
