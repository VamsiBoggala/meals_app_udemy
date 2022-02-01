import 'package:flutter/material.dart';

class CategoryMealsCreen extends StatelessWidget {
  const CategoryMealsCreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('The Recipes'),),
      body: const Center(
        child: Text('The Recipes forthhe category'),
      ),
    );
  }
}