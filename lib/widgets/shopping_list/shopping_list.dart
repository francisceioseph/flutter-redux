import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_shopping_cart/models/app_state.dart';
import 'package:flutter_redux_shopping_cart/models/cart_item.dart';
import 'package:flutter_redux_shopping_cart/widgets/shopping_list/shopping_list_item.dart';

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<CartItem>>(
      converter: (store) => store.state.cartItems,
      builder: (context, cartItems) {
        return ListView.builder(
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            return ShoppingListItem(
              item: cartItems[index],
            );
          },
        );
      },
    );
  }
}
