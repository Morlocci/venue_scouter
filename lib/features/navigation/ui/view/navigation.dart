import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:venue_scouter/widgets/bottom_navigation_bar.dart';
import 'package:venue_scouter/features/navigation/ui/view_model/navigation_view_model.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationViewModel(),
      child: Consumer<NavigationViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            body: viewModel.currentScreen,
            bottomNavigationBar: CustomNavigationBar(
              selectedIndex: viewModel.selectedIndex,
              onIconTapped: (index) => viewModel.onIconTapped(index),
            ),
          );
        },
      ),
    );
  }
}
