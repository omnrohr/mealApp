import 'package:flutter/material.dart';

import '../screens/meal_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imageURL;
  final String recipeTitle;
  final int cookingTime;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;

  MealItem(
      {this.id,
      this.imageURL,
      this.recipeTitle,
      this.cookingTime,
      this.complexity,
      this.affordability,
      this.removeItem});
  void selectMeal(conx) {
    Navigator.pushNamed(conx, MealScreen.mealScreenRout, arguments: id).then(
      (result) {
        if (result != null) {
          removeItem(result);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(imageURL,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      repeat: ImageRepeat.noRepeat),
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    width: MediaQuery.of(context).size.width -
                        (MediaQuery.of(context).size.width * .15),
                    color: Colors.black.withOpacity(.45),
                    child: Text(
                      recipeTitle,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [Icon(Icons.schedule), Text('$cookingTime min')],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      Text(complexity.name),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      Text(affordability.name)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
