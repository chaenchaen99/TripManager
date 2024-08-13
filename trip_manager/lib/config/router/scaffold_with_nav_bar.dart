import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/home.png',
                height: 24,
                width: 24,
              ),
              label: 'home'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/golf_course.png',
                height: 24,
                width: 24,
              ),
              label: 'ai'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/filter_none.png',
                height: 24,
                width: 24,
              ),
              label: 'feed'),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/bookmark.png',
              height: 24,
              width: 24,
            ),
            label: 'bookmark',
          ),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/account_circle.png',
                height: 24,
                width: 24,
              ),
              label: 'my'),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => _onTap(context, index),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
