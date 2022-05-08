// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors


import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(
    this.currentFilters,
    this.saveFilters,
  );

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {



  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactosFree = false;
  @override
  initState(){
    _glutenFree = widget.currentFilters['gluten']!;
    _vegan = widget.currentFilters['vegan']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _lactosFree = widget.currentFilters['lactos']!;
    super.initState();
  }

  Widget _buidSwitchListTile(
    String title,
    String decription,
    bool currentValue,
    Function(bool) upDateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        decription,
      ),
      onChanged: upDateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactos': _lactosFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Selection',
              style: Theme.of(context).textTheme.caption,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buidSwitchListTile(
                  'Gluten free',
                  'Only include gluten-free meals',
                  _glutenFree,
                  (p0) {
                    setState(() {
                      _glutenFree = p0;
                    });
                  },
                ),
                _buidSwitchListTile(
                  'Lactos free',
                  'Only include lactos-free meals',
                  _lactosFree,
                  (p0) {
                    setState(() {
                      _lactosFree = p0;
                    });
                  },
                ),
                _buidSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals',
                  _vegetarian,
                  (p0) {
                    setState(() {
                      _vegetarian = p0;
                    });
                  },
                ),
                _buidSwitchListTile(
                  'Vegan',
                  'Only include vegan meals',
                  _vegan,
                  (p0) {
                    setState(() {
                      _vegan = p0;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
