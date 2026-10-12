import 'package:flutter/material.dart';

import 'detail_page.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'widget/navbar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [HomePage(), ProfilePage(), DetailPage()];

  void _onTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: NavBar(selectedIndex: _selectedIndex, onTab: _onTab),
    );
  }
}
