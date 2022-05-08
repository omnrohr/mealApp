import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorites_Screen.dart';

class TopTabsScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meals'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Category',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favorites',
              ),
            ],
          ),
        ),
        body: TabBarView(children: [CategoriesScreen(), FavoritesScreen()]),
      ),
    );
  }
}
