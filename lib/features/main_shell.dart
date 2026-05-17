import 'package:flutter/material.dart';
import 'package:falcon/shared/widgets/falcon_shell.dart';
import 'package:falcon/features/home/home_screen.dart';
import 'package:falcon/features/search/search_screen.dart';
import 'package:falcon/features/profile/my_profile_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: const [
          HomeScreen(),       // 0 → HOME
          SearchScreen(),     // 1 → SEARCH
          HomeScreen(),       // 2 → BOOKINGS placeholder (never shown)
          MyProfileScreen(),  // 3 → PROFILE
        ],
      ),
      bottomNavigationBar: FalconBottomNav(
        currentIndex: _index,
        onTap: (i) {
          if (i == 2) return; // bookings — do nothing
          setState(() => _index = i);
        },
      ),
    );
  }
}