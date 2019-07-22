import 'package:flutter/material.dart';
import 'package:flutter_redux_shopping_cart/actions/cart_actions.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_redux_shopping_cart/reducers/cart_reducers.dart';
import 'package:flutter_redux_shopping_cart/models/app_state.dart';
import 'package:flutter_redux_shopping_cart/screens/home.dart';

class ShoppingCartApp extends StatelessWidget {
  final store = Store<AppState>(
    cartReducers(),
    initialState: AppState.empty(),
    middleware: [],
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Shopping Cart',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StoreBuilder<AppState>(
          onInit: (store) {
            return store.dispatch(FetchItemsAction());
          },
          builder: (context, store) {
            return Home(store);
          },
        ),
      ),
    );
  }
}
