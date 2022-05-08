import 'package:flutter/material.dart';
import 'package:myapp/screens/categories_screen.dart';
import 'package:myapp/screens/favorites_Screen.dart';
import 'package:myapp/widgets/main_drawer.dart';

class BottomTabBarScreen extends StatefulWidget {
  @override
  State<BottomTabBarScreen> createState() => _BottomTabBarScreenState();
}

class _BottomTabBarScreenState extends State<BottomTabBarScreen> {
  final List<Map<String, Object>> _screens = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoritesScreen(), 'title': 'Your Favorites'},
  ];
  int _selectedTabIndex = 0;
  void _selectedTab(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(_screens[_selectedTabIndex]['title']),
      ),
      body: _screens[_selectedTabIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
        onTap: _selectedTab,
        currentIndex: _selectedTabIndex,
      ),
    );
  }
}
