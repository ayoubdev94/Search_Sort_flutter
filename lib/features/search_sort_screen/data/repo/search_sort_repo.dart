import 'package:flutter_x/features/search_sort_screen/data/model/item_model.dart';

class SearchSortRepo {
  static List<Item> getItems() {
    final List<Item> sampleItems = [
      Item(name: 'Apple', price: 1.99),
      Item(name: 'Banana', price: 0.99),
      Item(name: 'Cherry', price: 2.99),
      Item(name: 'Date', price: 3.49),
      Item(name: 'Elderberry', price: 4.99),
    ];
    return sampleItems;
  }
}
