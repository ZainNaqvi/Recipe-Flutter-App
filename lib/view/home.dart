import 'package:flutter/material.dart';
import 'package:rest_api_recipe/models/recipe.dart';
import 'package:rest_api_recipe/models/recipe_api.dart';
import 'package:rest_api_recipe/view/widget/recipe_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> _recipes = [];
  bool _isLoading = true;

  @override
  void initState() {
    getRecipes();
    super.initState();
  }

  Future<void> getRecipes() async {
    try {
      _recipes = await RecipeApi.getRecipe();

      setState(() {
        _isLoading = false;
      });
      print(_recipes.length);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.restaurant_menu,
                color: Colors.grey,
              ),
              SizedBox(width: 10),
              Text(
                'Recipe Mart',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: _recipes[index].name,
                      cookTime: _recipes[index].totalTime,
                      rating: _recipes[index].rating,
                      thumbnailUrl: _recipes[index].images);
                },
              ));
  }
}
