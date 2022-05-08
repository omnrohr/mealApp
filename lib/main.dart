import 'package:flutter/material.dart';
import './dummy_data.dart';
import './screens/bottom_tab_screen.dart';
import './screens/filters_screen.dart';
import '../screens/meal_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/categories_screen.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _updateFilters(Map<String, bool> newFilters) {
    setState(() {
      _filters = newFilters;
      _availableMeals = DUMMY_MEALS.where((element) {
        if (_filters['gluten'] && !element.isGlutenFree) return false;
        if (_filters['lactose'] && !element.isLactoseFree) return false;
        if (_filters['vegan'] && !element.isVegan) return false;
        if (_filters['vegetarian'] && !element.isVegetarian) return false;

        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final selectedMeal =
        _favoriteMeals.indexWhere((element) => element.id == mealId);
    if (selectedMeal >= 0) {
      setState(() {
        _favoriteMeals.removeAt(selectedMeal);
      });
    } else {
      setState(() {
        _favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isFavorite(String mailID) {
    return _favoriteMeals.any((element) => element.id == mailID);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        textTheme: ThemeData().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: const TextStyle(fontSize: 24)),
      ),
      // home: CategoriesScreen(),
      routes: {
        '/': (context) => BottomTabBarScreen(_favoriteMeals),
        CategoryMealScreen.categoryRout: (context) =>
            CategoryMealScreen(_availableMeals),
        MealScreen.mealScreenRout: (context) =>
            MealScreen(_toggleFavorite, _isFavorite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _updateFilters),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        // 404 page
        builder: (context) => CategoriesScreen(),
      ),
      initialRoute: '/',
    );
  }
}
