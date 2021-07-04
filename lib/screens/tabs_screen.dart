import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/screens/categories_screen.dart';
import 'package:mealapp/screens/favourites_screen.dart';
import 'package:mealapp/widgets/main_drawer.dart';

class TasbScreen extends StatefulWidget {
  final List<Meal> favoriteMeals ;

  const TasbScreen(this.favoriteMeals);
  @override
  _TasbScreenState createState() => _TasbScreenState();
}

class _TasbScreenState extends State<TasbScreen> {
   late List<Map<String, Object>> _pages;
   @override
   void initState()
   {
     _pages = [
       {
         'title': 'Categories',
         'page': CategoriesScreen(),
       },
       {
         'title': 'Favourites',
         'page': Favourite_Screen(widget.favoriteMeals),
       }
     ];
     super.initState();

   }
  int selectedpageindex = 0;

  _selectPage(int value) {
    setState(() {
      selectedpageindex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget x = _pages[selectedpageindex]['page'] as Widget;
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[selectedpageindex]['title'].toString()),
      ),
      body: x,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).accentColor ,
        currentIndex: selectedpageindex,
        unselectedItemColor: Colors.white ,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favourites"),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
