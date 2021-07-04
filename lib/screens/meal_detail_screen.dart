import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routName = "meal_detail";
  final Function togglefavorite;
  final Function isFavortie;
   MealDetailScreen(this.togglefavorite ,this.isFavortie);

  Widget buildSectionTitle(String text, BuildContext ct) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(ct).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final routeArgID = ModalRoute.of(context)!.settings.arguments as String;
    final selectedmeal =
        DUMMY_MEALS.firstWhere((meal) => meal.id == routeArgID);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedmeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                selectedmeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle("Ingredients", context),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, itembuilder) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(selectedmeal.ingredients[itembuilder]),
                    ),
                  );
                },
                itemCount: selectedmeal.ingredients.length,
              ),
            ),
            buildSectionTitle("Steps", context),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, itembuilder) {
                  return Column(
                    children: [
                      ListTile(
                        leading:CircleAvatar(
                          child: Text("# ${itembuilder+1}"),
                        ) ,
                        title: Text(selectedmeal.steps[itembuilder]),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: selectedmeal.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> togglefavorite(routeArgID),
        child: Icon(
            isFavortie(routeArgID) ? Icons.star : Icons.star_border
        ),
      ),
    );
   }
}
