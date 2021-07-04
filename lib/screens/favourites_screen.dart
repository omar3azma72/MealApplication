import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/widgets/meal_item.dart';
class Favourite_Screen extends StatelessWidget {
  final List<Meal> favoriteMeals ;

  const Favourite_Screen( this.favoriteMeals) ;



  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text("Favourite Screen"),
      );
    }
    else {
      return ListView.builder(
          itemBuilder: (ct, build) {
            return MealItem(
              id: favoriteMeals[build].id,
              imageUrl: favoriteMeals[build].imageUrl,
              title: favoriteMeals[build].title,
              duration: favoriteMeals[build].duration,
              affordability: favoriteMeals[build].affordability,
              complexity: favoriteMeals[build].complexity,

            );

          },
        itemCount: favoriteMeals.length,
      );
    }
  }
}