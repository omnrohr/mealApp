import 'package:flutter/material.dart';
import 'package:myapp/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListOfTiles(String title, IconData icon, Function ontab) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Colors.pink,
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      onTap: ontab,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.all(20),
            height: 120,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: const Text(
              'Cooking up',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListOfTiles('Meals', Icons.restaurant, () {
            Navigator.pushReplacementNamed(context, "/");
          }),
          buildListOfTiles('Filters', Icons.settings, () {
            Navigator.pushReplacementNamed(context, FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
