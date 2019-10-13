import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // const CategoryMealsScreen(
  //     {@required this.categoryId, @required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    var categoryTitle = routeArguments['title'];
    var categoryId = routeArguments['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            categoryTitle,
          ),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            Meal _selectedMeal = categoryMeals[index];
            return MealItem(
              id: _selectedMeal.id,
              title: _selectedMeal.title,
              affordability: _selectedMeal.affordability,
              complexity: _selectedMeal.complexity,
              imageUrl: _selectedMeal.imageUrl,
              duration: _selectedMeal.duration,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
