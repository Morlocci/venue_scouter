import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:venue_scouter/venue/domain/entities/venue.dart';

class VenueService {
  final String apiUrl = 'https://restaurant-api.wolt.com/v1/pages/restaurants';
  final List<Venue> _nearbyVenues = [];
  final List<Venue> _favouriteVenues = [];

  List<Venue> get nearbyVenues => List.unmodifiable(_nearbyVenues);

  List<Venue> get favouriteVenues => List.unmodifiable(_favouriteVenues);

  Future<List<Venue>> fetchNearbyVenues(double lat, double lon) async {
    try {
      final response = await http.get(
        Uri.parse('$apiUrl?lat=$lat&lon=$lon'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        final venues = (data['sections'][1]['items'] as List)
            .take(15)
            .map((item) => Venue.fromJson(item))
            .toList();

        return venues;
      } else {
        throw Exception(
            'Failed to fetch nearby venues: HTTP ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  void addVenueToFavourites(Venue venue) {
    if (_favouriteVenues.contains(venue)) return;
    _favouriteVenues.add(venue);
  }

  void removeVenueFromFavourites(Venue venue) {
    _favouriteVenues.remove(venue);
  }

  bool isVenueFavourite(String venueId) {
    return _favouriteVenues.any((venue) => venue.id == venueId);
  }
}
