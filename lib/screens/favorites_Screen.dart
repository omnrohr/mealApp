import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(title: Text('Favorates')),
      body: Center(
        child: Text('favorites screen'),
      ),
    );
  }
}
