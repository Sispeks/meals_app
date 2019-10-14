import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-details';

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style: Theme.of(context).textTheme.title),
    );
  }

  Widget _buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey)),
        height: 200,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final _selectedMeal =
        DUMMY_MEALS.firstWhere((element) => mealId == element.id);
    return Scaffold(
        appBar: AppBar(
          title: Text('${_selectedMeal.title}'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  _selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              _buildSectionTitle(context, 'Ingredients'),
              _buildContainer(
                ListView.builder(
                  itemBuilder: (context, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10),
                      child: Text(_selectedMeal.ingredients[index]),
                    ),
                  ),
                  itemCount: _selectedMeal.ingredients.length,
                ),
              ),
              _buildSectionTitle(context, 'Steps'),
              _buildContainer(
                ListView.builder(
                  itemCount: _selectedMeal.steps.length,
                  itemBuilder: (ctx, index) => Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${(index + 1)}'),
                        ),
                        title: Text(
                          _selectedMeal.steps[index],
                          style: Theme.of(context).textTheme.body1,
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
