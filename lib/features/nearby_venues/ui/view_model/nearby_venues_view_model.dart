import 'package:flutter/material.dart';
import 'package:venue_scouter/venue/domain/entities/venue.dart';
import 'package:venue_scouter/venue/domain/service/venue_service.dart';

class NearbyVenuesViewModel extends ChangeNotifier {
  final VenueService _venueService;
  bool _showVenueList = false;

  NearbyVenuesViewModel(this._venueService) {
    fetchNearbyVenues();
  }

  String get headerTitle => 'Nearby Venues';

  List<Venue> _venues = [];

  List<Venue> get venues => _venues;

  bool get isListVisible => _showVenueList;

  bool isVenueFavourite(String venueId) {
    return _venueService.isVenueFavourite(venueId);
  }

  Future<void> fetchNearbyVenues() async {
    _venues = await _venueService.fetchNearbyVenues(60.170187, 24.930599);
    _showVenueList = true;
    notifyListeners();
  }

  void toggleFavourite(Venue venue) {
    if (isVenueFavourite(venue.id)) {
      _venueService.removeVenueFromFavourites(venue);
    } else {
      _venueService.addVenueToFavourites(venue);
    }
    notifyListeners();
  }
}
