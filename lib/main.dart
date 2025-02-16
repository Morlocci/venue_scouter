import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:venue_scouter/venue/domain/service/venue_service.dart';
import 'features/navigation/domain/service/navigation_service.dart';
import 'features/navigation/ui/view/bottom_navigation.dart';
import 'features/navigation/ui/view_model/navigation_view_model.dart';

void main() {
  runApp(const VenueScouter());
}

class VenueScouter extends StatelessWidget {
  const VenueScouter({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationViewModel()),
        Provider(create: (_) => NavigationService()),
        Provider(create: (_) => VenueService()),
      ],
      child: Builder(
        builder: (context) {
          final navigationService =
              Provider.of<NavigationService>(context, listen: false);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navigationService.navigatorKey,
            home: const NavigationScreen(),
          );
        },
      ),
    );
  }
}
