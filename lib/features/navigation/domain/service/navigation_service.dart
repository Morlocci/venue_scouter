import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<void> navigateTo(String routeName) async {
    await navigatorKey.currentState?.pushNamed(routeName);
  }

  void goBack() {
    navigatorKey.currentState?.pop();
  }
}
