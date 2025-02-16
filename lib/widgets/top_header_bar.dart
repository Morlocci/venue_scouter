import 'package:flutter/material.dart';

class TopHeaderBar extends StatelessWidget implements PreferredSizeWidget {
  final String headerName;

  const TopHeaderBar({super.key, required this.headerName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text(
          headerName,
          style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
