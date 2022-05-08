import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  static const categoryRout = '/category-meal';

  // final String categoryId;
  // final String categoryTitle;
  // CategoryMealScreen({this.categoryId, this.categoryTitle});
  @override
  Widget build(BuildContext context) {
    final Map<String, String> categoryArgs =
        ModalRoute.of(context).settings.arguments;
    final String categoryTitle = categoryArgs['title'];
    final String categoryId = categoryArgs['id'];
    final categoryMeals = DUMMY_MEALS
        .where((element) => element.categories.contains(categoryId))
        .toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              id: categoryMeals[index].id,
              recipeTitle: categoryMeals[index].title,
              imageURL: categoryMeals[index].imageUrl,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
              cookingTime: categoryMeals[index].duration,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
