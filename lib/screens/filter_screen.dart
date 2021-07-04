import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mealapp/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";
 final Function setfilters;
 final Map<String,bool> currentfilters;

   FiltersScreen( this.currentfilters,this.setfilters) ;


  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {


  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;

  @override
  initState()
  {
    isGlutenFree =  widget.currentfilters['gluten'] as bool;
     isLactoseFree = widget.currentfilters['lactose'] as bool;
     isVegan =widget.currentfilters['vegan'] as bool ;
     isVegetarian =widget.currentfilters['vegetarian'] as bool ;

     super.initState();
  }

  Widget switchlisttile(String title, String Description, bool currentvalue,
     void  updatevalue(bool)) {
    return SwitchListTile(
      title: Text(title),
      value: currentvalue,
      onChanged: updatevalue,
      subtitle: Text(Description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters !"),
        actions: [
          IconButton(onPressed:(){
            final Map<String,bool> selectedfilters =
                {
                  'gluten': isGlutenFree,
                  'lactose': isLactoseFree,
                  'vegan': isVegan,
                  'vegetarian': isVegetarian
                };
            widget.setfilters(selectedfilters);
          }, icon: Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust Your Meal Selection",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              switchlisttile(
                "Gluten-Free",
                "Only Include Gluten - Free Meals",
                isGlutenFree,
                (newvalue) {
                  setState(() {
                    isGlutenFree = newvalue;
                  });
                },
              ),
              switchlisttile(
                "Lactose-Free",
                "Only Include Lactose - Free Meals",
                isLactoseFree,
                (newvalue) {
                  setState(() {
                    isLactoseFree = newvalue;
                  });
                },
              ),
              switchlisttile(
                "Vegetarian",
                "Only Include Vegetarian  Meals",
                isVegetarian,
                (newvalue) {
                  setState(() {
                    isVegetarian = newvalue;
                  });
                },
              ),
              switchlisttile(
                "Vegan ",
                "Only Include Vegan  Meals",
                isVegan,
                (newvalue) {
                  setState(() {
                    isVegan = newvalue;
                  });
                },
              )
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
