import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:venue_scouter/location/domain/entities/coordinates.dart';

class LocationService extends ChangeNotifier {
  final Coordinates _coordinates;
  Timer? _timer;
  int _currentIndex = 0;

  LocationService(this._coordinates);

  void _simulateWalking() {
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      _currentIndex = (_currentIndex + 1) % _coordinates.values.length;
      notifyListeners();
    });
  }

  List<double> getCurrentCoordinate() {
    return _coordinates.values[_currentIndex];
  }

  void start() {
    _simulateWalking();
  }

  void stop() {
    _timer?.cancel();
  }
}
