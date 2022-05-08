import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_Screen.dart';
import '../widgets/main_drawer.dart';

class BottomTabBarScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  BottomTabBarScreen(this.favoriteMeals);
  @override
  State<BottomTabBarScreen> createState() => _BottomTabBarScreenState();
}

class _BottomTabBarScreenState extends State<BottomTabBarScreen> {
  List<Map<String, Object>> _screens;

  @override
  void initState() {
    // TODO: implement initState
    _screens = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Your Favorites'
      },
    ];
    super.initState();
  }

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
