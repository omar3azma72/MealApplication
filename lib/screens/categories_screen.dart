import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/widgets/category_item.dart';
 class CategoriesScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GridView(
        padding: EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map((categorydata) =>
        CategoryItem(categorydata.id, categorydata.title, categorydata.color)
        ).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3/2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20
          ),
  
      ),
    );
  }
}
