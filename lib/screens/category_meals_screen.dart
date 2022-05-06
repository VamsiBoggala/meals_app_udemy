import 'package:example/models/category.dart';
import 'package:example/models/meal.dart';
import 'package:example/widgets/category_item.dart';
import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeals;
  var _loadInitData = false;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void didChangeDependencies() {
    
    // TODO: implement didChangeDependencies
    if (!_loadInitData) {
      final args = ModalRoute.of(context)!.settings.arguments as Category;
      // Map<String, String> routeArgs =
      //     ModalRoute.of(context).settings.arguments as Map<String, String>;
      // final categoryTitle = routeArgs['title'] ?? " ";
      // final categoryId = routeArgs['id'] ?? " ";
      categoryTitle = args.title;
      final categoryId = args.id;
      displayedMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    displayedMeals.removeWhere((element) => element.id == mealId);
  }

  // final String categoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
