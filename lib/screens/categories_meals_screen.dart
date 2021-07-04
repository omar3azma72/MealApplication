import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "CategoryMealsScreen";
  final List<Meal> availableMeals;

   CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeal;

  @override
  void didChangeDependencies() {
    final routeArg =
    ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title'].toString();
    displayedMeal = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  @override
  void initState() {

    super.initState();

  }

  void removeMeal(String mealId)
  {
    setState(() {
      displayedMeal.removeWhere((element) => element.id == mealId);
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ct, index) {
          return MealItem(
            id: displayedMeal[index].id,
            imageUrl: displayedMeal[index].imageUrl,
            title: displayedMeal[index].title,
            duration: displayedMeal[index].duration,
            affordability: displayedMeal[index].affordability,
            complexity: displayedMeal[index].complexity,

          );
        },
        itemCount: displayedMeal.length,
      ),
    );
  }
}
