import 'package:flutter/material.dart';
import 'package:venue_scouter/features/favourites/ui/view/favourites_view.dart';
import 'package:venue_scouter/features/nearby_venues/ui/view/nearby_venues_view.dart';

class NavigationViewModel extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  Widget get currentScreen {
    switch (_selectedIndex) {
      case 0:
        return const NearbyVenues();
      case 1:
        return const Favourites();
      default:
        return const NearbyVenues();
    }
  }

  void onIconTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
