import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  Function setFilters;
  Map<String, bool> filters;

  FiltersScreen(this.filters, this.setFilters);
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree;
  bool _isVegan;
  bool _isVegetarian;
  bool _isLactoseFree;
  @override
  void initState() {
    // TODO: implement initState
    _isGlutenFree = widget.filters['gluten'];
    _isVegan = widget.filters['vegan'];
    _isLactoseFree = widget.filters['lactose'];
    _isVegetarian = widget.filters['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                final modifiedFilters = {
                  'gluten': _isGlutenFree,
                  'lactose': _isLactoseFree,
                  'vegan': _isVegan,
                  'vegetarian': _isVegetarian,
                };
                widget.setFilters(modifiedFilters);
              },
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Text('Filter your results'),
            ),
            Expanded(
                child: ListView(
              children: [
                SwitchListTile(
                  title: Text('select only Gluten-Free meals'),
                  subtitle: Text('Only include gluten-free meals'),
                  value: _isGlutenFree,
                  onChanged: (newValue) {
                    setState(() {
                      _isGlutenFree = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('select only Lactose-Free meals'),
                  subtitle: Text('Only include Lactose-free meals'),
                  value: _isLactoseFree,
                  onChanged: (newValue) {
                    setState(() {
                      _isLactoseFree = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('select only Vegan meals'),
                  subtitle: Text('Only include vegan meals'),
                  value: _isVegan,
                  onChanged: (newValue) {
                    setState(() {
                      _isVegan = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('select only Vegetarian meals'),
                  subtitle: Text('Only include Vegetarian meals'),
                  value: _isVegetarian,
                  onChanged: (newValue) {
                    setState(() {
                      _isVegetarian = newValue;
                    });
                  },
                ),
              ],
            ))
          ],
        ));
  }
}
