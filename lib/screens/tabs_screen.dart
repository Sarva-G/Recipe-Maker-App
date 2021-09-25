import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import './favourites_screen.dart';
import './categories_screen.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabScreen(this.favoriteMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavouritesScreen(widget.favoriteMeals), 'title': 'Favorites'},
    ];
    super.initState();
  }

  int _selectedPage = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPage]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPage]['page'],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Theme.of(context).canvasColor,
        color: Theme.of(context).primaryColor,
        buttonBackgroundColor: Theme.of(context).accentColor,
        height: 60,
        onTap: _selectPage,
        items: [
          Icon(
            Icons.category,
            color: Colors.black45,
            size: 27,
          ),
          Icon(
            Icons.favorite,
            color: Colors.black45,
            size: 27,
          ),
        ],
        index: _selectedPage,
      ),
    );
  }
}
