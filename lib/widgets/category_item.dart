import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/categories_meals_screen.dart';
import 'package:mealapp/screens/categories_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

   CategoryItem(this.id, this.title, this.color);

   void selectcategory(BuildContext ctx)
   {
     Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName ,
     arguments: {
       'id':id, 'title':title,
     }
     );

           

   }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectcategory(context)
      ,
        borderRadius: BorderRadius.circular(15),

      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title ,style: Theme.of(context).textTheme.title),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors:[
                color.withOpacity(0.5) ,color
              ] ,
            begin: Alignment.topLeft,
            end:Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15)
        ),
      ),
    );
  }
}
