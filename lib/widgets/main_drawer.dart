import 'package:flutter/material.dart';
import 'package:mealapp/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListtile(String title , IconData icon ,  void  TapHandler ())
  {
   return ListTile(
      leading: Icon(icon, size: 26,),
      title: Text(title,style: TextStyle(
          fontSize: 24 , fontFamily: "RobotoCondensed",fontWeight: FontWeight.bold
      ),),
     onTap: TapHandler

     ,
    );
    
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).accentColor,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Cooking Up !",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListtile("Meal", Icons.restaurant ,  () {Navigator.of(context).pushReplacementNamed('/');}),
          buildListtile("Filters", Icons.settings , (){Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);})

        ],
      ),
    );
  }
}
