import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rest_api_recipe/models/recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "33fbed9dbdmsh2febcfc28632877p1312e7jsn21bc91380c39",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    var temp = [];

    for (var i in data['feed']) {
      temp.add(i['content']['details']);
      // print(temp);
    }

    return Recipe.recipeFromSnapshot(temp);
  }
}
