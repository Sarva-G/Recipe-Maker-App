import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavouritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty) {
      return Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 240,
            ),
            Container(
              height: 100,
              child: Image.network("https://img.icons8.com/clouds/100/000000/shopping-basket-add.png"),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text('You have no Favorite Meals yet!'),
            ),
          ],
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            affordability: favoriteMeals[index].affordability,
            complexity: favoriteMeals[index].complexity,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
