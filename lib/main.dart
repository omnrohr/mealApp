import 'package:flutter/material.dart';
import 'package:myapp/screens/bottom_tab_screen.dart';
import 'package:myapp/screens/filters_screen.dart';
import '../screens/meal_screen.dart';
import './screens/category_meal_screen.dart';
import 'screens/top_tapbar_screens.dart';
import './screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        '/': (context) => BottomTabBarScreen(),
        CategoryMealScreen.categoryRout: (context) => CategoryMealScreen(),
        MealScreen.mealScreenRout: (context) => MealScreen(),
        FiltersScreen.routeName: (context) => FiltersScreen(),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        // 404 page
        builder: (context) => CategoriesScreen(),
      ),
      initialRoute: '/',
    );
  }
}
