import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTab;

  const NavBar({super.key, required this.selectedIndex, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTab,
      selectedItemColor: Colors.blue,
      currentIndex: selectedIndex,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(
          icon: Icon(Icons.info_outline),
          label: 'Detail',
        ),
      ],
    );
  }
}
