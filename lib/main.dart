import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:venue_scouter/venue/domain/service/venue_service.dart';
import 'features/navigation/ui/view/navigation.dart';
import 'features/navigation/ui/view_model/navigation_view_model.dart';
import 'location/domain/entities/coordinates.dart';
import 'location/service/location_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const VenueScouter());
}

class VenueScouter extends StatelessWidget {
  const VenueScouter({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationViewModel()),
        ChangeNotifierProvider(create: (context) {
          final locationService = LocationService(Coordinates());
          locationService.start(); // Start the periodic updates
          return locationService;
        }),
        Provider(create: (_) => VenueService()),
      ],
      child: Builder(
        builder: (context) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Navigation(),
          );
        },
      ),
    );
  }
}
