import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealScreen extends StatelessWidget {
  static const mealScreenRout = '/meal-details';

  Widget buildSubTitle(BuildContext ctx, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      child: Text(
        title,
        style: Theme.of(ctx).textTheme.headline6,
      ),
    );
  }

  Widget getDetails(Widget child) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      height: 200,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context).settings.arguments;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context, mealId);
          },
          child: Icon(Icons.delete)),
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.network(
                selectedMeal.imageUrl,
                height: 300,
                width: double.infinity,
              ),
            ),
            buildSubTitle(context, 'Ingredients'),
            // adding a list view inside a column will throw an error, because the container is requesting as much space it could have and list view is the same, so we need to wrap the list view inside a container
            getDetails(
              ListView.builder(
                itemBuilder: (_, index) => Card(
                  elevation: 0.5,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text(selectedMeal.ingredients[index])),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSubTitle(context, 'Steps'),
            getDetails(
              ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    child: Text('# ${index + 1}'),
                  ),
                  title: Text(selectedMeal.steps[index]),
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
