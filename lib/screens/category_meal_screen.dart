import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const categoryRout = '/category-meal';
  final List<Meal> availableMeals;
  CategoryMealScreen(this.availableMeals);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loaded = false;

  @override
  void didChangeDependencies() {
    if (!_loaded) {
      final Map<String, String> categoryArgs =
          ModalRoute.of(context).settings.arguments;
      categoryTitle = categoryArgs['title'];
      final String categoryId = categoryArgs['id'];
      displayedMeals = widget.availableMeals
          .where((element) => element.categories.contains(categoryId))
          .toList();
      _loaded = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealID) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealID);
    });
  }

  // final String categoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              id: displayedMeals[index].id,
              recipeTitle: displayedMeals[index].title,
              imageURL: displayedMeals[index].imageUrl,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability,
              cookingTime: displayedMeals[index].duration,
              removeItem: _removeMeal,
            );
          },
          itemCount: displayedMeals.length,
        ));
  }
}
