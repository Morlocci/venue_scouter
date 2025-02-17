import 'dart:async';
import 'package:flutter/material.dart';
import 'package:venue_scouter/location/service/location_service.dart';
import 'package:venue_scouter/venue/domain/entities/venue.dart';
import 'package:venue_scouter/venue/domain/service/venue_service.dart';

class NearbyVenuesViewModel extends ChangeNotifier {
  final VenueService _venueService;
  final LocationService _locationService;

  List<Venue> _venues = [];
  bool _isLoading = true;

  NearbyVenuesViewModel(this._venueService, this._locationService);

  List<Venue> get venues => _venues;

  bool get isLoading => _isLoading;

  void init() {
    _locationService.addListener(_fetchNearbyVenues);
    _fetchNearbyVenues();
  }

  bool isVenueFavourite(String venueId) {
    return _venueService.isVenueFavourite(venueId);
  }

  Future<void> _fetchNearbyVenues() async {
    final coordinates = _locationService.getCurrentCoordinate();
    final lat = coordinates[0];
    final lon = coordinates[1];

    _venues = await _venueService.fetchNearbyVenues(lat, lon);
    _isLoading = false;
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

  @override
  void dispose() {
    _locationService.removeListener(_fetchNearbyVenues);
    super.dispose();
  }
}
