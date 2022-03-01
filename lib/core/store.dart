import 'package:velocity_x/velocity_x.dart';

import '../models/cart.dart';
import '../models/catalog.dart';

class MyStore extends VxStore {
  CatalogModel catalog;
  CartModel cart;
  VxNavigator navigator;
  List<Item> items;

  MyStore(
    this.catalog,
    this.cart,
    this.navigator,
    this.items,
  ) {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
