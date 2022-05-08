import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> _favoriteMeal;

  FavoritesScreen(this._favoriteMeal);

  @override
  Widget build(BuildContext context) {
    if (_favoriteMeal.isEmpty) {
      return const Center(
        child: Text('No favorites available Please start add some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: _favoriteMeal[index].id,
            recipeTitle: _favoriteMeal[index].title,
            imageURL: _favoriteMeal[index].imageUrl,
            complexity: _favoriteMeal[index].complexity,
            affordability: _favoriteMeal[index].affordability,
            cookingTime: _favoriteMeal[index].duration,
          );
        },
        itemCount: _favoriteMeal.length,
      );
    }
  }
}
