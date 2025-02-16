import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onIconTapped;

  const CustomNavigationBar(
      {super.key, required this.selectedIndex, required this.onIconTapped});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onIconTapped,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.location_city), label: 'Nearby'),
        NavigationDestination(
            icon: Icon(Icons.favorite_border), label: 'Favourites'),
      ],
    );
  }
}
