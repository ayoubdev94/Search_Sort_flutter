import 'package:flutter_x/features/search_sort_screen/data/model/item_model.dart';

class SearchSortRepo {
  // Fetch Data From Api
  static List<Item> getItems() {
    final List<Item> sampleItems = [
      Item(name: 'Apple', price: 1.99, category: 'Fruit'),
      Item(name: 'Banana', price: 0.99, category: 'Fruit'),
      Item(name: 'Cherry', price: 2.99, category: 'Fruit'),
      Item(name: 'Date', price: 3.49, category: 'Fruit'),
      Item(name: 'Elderberry', price: 4.99, category: 'Fruit'),
      Item(name: 'Fig', price: 2.49, category: 'Fruit'),
      Item(name: 'Grapes', price: 2.99, category: 'Fruit'),
      Item(name: 'Honeydew', price: 3.99, category: 'Fruit'),
      Item(name: 'Iceberg Lettuce', price: 1.49, category: 'Vegetable'),
      Item(name: 'Jalapeno', price: 1.99, category: 'Vegetable'),
      Item(name: 'Kale', price: 2.99, category: 'Vegetable'),
      Item(name: 'Lemon', price: 0.89, category: 'Fruit'),
      Item(name: 'Mango', price: 1.49, category: 'Fruit'),
      Item(name: 'Nectarine', price: 2.49, category: 'Fruit'),
      Item(name: 'Orange', price: 1.29, category: 'Fruit'),
      Item(name: 'Peach', price: 2.29, category: 'Fruit'),
      Item(name: 'Quince', price: 3.99, category: 'Fruit'),
      Item(name: 'Radish', price: 1.19, category: 'Vegetable'),
      Item(name: 'Spinach', price: 1.99, category: 'Vegetable'),
      Item(name: 'Tomato', price: 1.99, category: 'Vegetable'),
      Item(name: 'Ugli Fruit', price: 4.99, category: 'Fruit'),
      Item(name: 'Vidalia Onion', price: 0.79, category: 'Vegetable'),
      Item(name: 'Watermelon', price: 3.99, category: 'Fruit'),
      Item(name: 'Xigua', price: 5.99, category: 'Fruit'),
      Item(name: 'Yellow Pepper', price: 2.49, category: 'Vegetable'),
      Item(name: 'Zucchini', price: 1.29, category: 'Vegetable'),
    ];
    return sampleItems;
  }
}
