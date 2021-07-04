import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/screens/filter_screen.dart';
import 'package:mealapp/screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import '/screens/categories_screen.dart';
import './screens/categories_meals_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      availableMeals = DUMMY_MEALS.where(
              (element)
          {
            if (_filters['gluten']==true && element.isGlutenFree ==false)
              {
                return false;
              };
            if (_filters['lactose']==true && element.isLactoseFree ==false)
            {
              return false;
            };
            if (_filters['vegan']==true && element.isVegan ==false)
            {
              return false;
            };
            if (_filters['vegetarian']==true && element.isVegetarian ==false)
            {
              return false;
            };
            return true;
          }
      ).toList();
    });
  }
  void togglefavorite(String mealId)
  {
   final existingindex = favoriteMeals.indexWhere((element) => element.id == mealId);
   if(existingindex>=0)
     {
       setState(() {
         favoriteMeals.removeAt(existingindex);
       });
     }
   else{
     favoriteMeals.add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
   }

  }
  bool isFavortie(String id)
  {
    return favoriteMeals.any((element) => element.id == id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData
              .light()
              .textTheme
              .copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
              title: TextStyle(
                  fontSize: 24,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold))),
      //making categoryscreen home page
      routes: {
        '/': (context) => TasbScreen(favoriteMeals),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(availableMeals),
        MealDetailScreen.routName: (context) => MealDetailScreen(togglefavorite,isFavortie),
        FiltersScreen.routeName: (context) => FiltersScreen(_filters,setFilters),

      },
      //home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("Meal App"),
      ),
      //making homescreen Category screen
      // body: CategoriesScreen(),
      body: null,
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
