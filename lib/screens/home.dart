import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux_shopping_cart/models/app_state.dart';
import 'package:flutter_redux_shopping_cart/widgets/item_dialog/add_item_dialog.dart';
import 'package:flutter_redux_shopping_cart/widgets/shopping_list/shopping_list.dart';

class Home extends StatelessWidget {
  final Store<AppState> store;

  Home(this.store);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShoppingList'),
      ),
      body: ShoppingList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddItemDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }
}

_openAddItemDialog(BuildContext context) {
  showDialog(context: context, builder: (context) => AddItemDialog());
}
