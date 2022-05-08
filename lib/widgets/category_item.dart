import 'package:flutter/material.dart';

import '../screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem({this.id, this.title, this.color});

  void selectCategory(BuildContext conx) {
    Navigator.pushNamed(conx, CategoryMealScreen.categoryRout,
        arguments: {'id': id, 'title': title});

    // Navigator.push(
    //   conx,
    //   MaterialPageRoute(
    //     builder: (_) => CategoryMealScreen(
    //       categoryId: id,
    //       categoryTitle: title,
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text(title, textAlign: TextAlign.center),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.6), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
