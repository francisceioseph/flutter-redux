import 'package:flutter_redux_shopping_cart/models/cart_item.dart';

class AppState {
  final List<CartItem> cartItems;

  AppState(this.cartItems);

  AppState.fromJson(Map<String, dynamic> json)
      : cartItems = (json['cartItems'] as List)
            .map((i) => new CartItem.fromJson(i as Map<String, dynamic>))
            .toList();

  AppState.empty() : cartItems = [];

  Map<String, dynamic> toJson() => {'items': cartItems};

  @override
  String toString() => "$cartItems";
}
