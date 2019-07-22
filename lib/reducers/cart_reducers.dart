import 'package:redux/redux.dart';
import 'package:flutter_redux_shopping_cart/actions/cart_actions.dart';
import 'package:flutter_redux_shopping_cart/models/app_state.dart';
import 'package:flutter_redux_shopping_cart/models/cart_item.dart';

AppState _addItem(AppState state, AddItemAction action) {
  final List<CartItem> items = state.cartItems;
  return AppState(List.from(items)..add(action.item));
}

AppState _toggleItemState(AppState state, ToggleItemStateAction action) {
  final List<CartItem> items = state.cartItems;
  return AppState(items
      .map((item) => item.name == action.item.name ? action.item : item)
      .toList());
}

AppState _removeItem(AppState state, RemoveItemAction action) {
  final List<CartItem> items = state.cartItems;
  return AppState(
      List.from(items)..removeWhere((item) => item.name == action.item.name));
}

AppState _loadItems(AppState state, ItemLoadedAction action) {
  return AppState(action.items);
}

AppState Function(AppState, dynamic) cartReducers() {
  return combineReducers<AppState>([
    TypedReducer<AppState, AddItemAction>(_addItem),
    TypedReducer<AppState, ToggleItemStateAction>(_toggleItemState),
    TypedReducer<AppState, RemoveItemAction>(_removeItem),
    TypedReducer<AppState, ItemLoadedAction>(_loadItems),
  ]);
}
