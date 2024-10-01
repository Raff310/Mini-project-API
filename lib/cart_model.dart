import 'product_model.dart';

class Cart {
  final Map<Product, int> _items = {};

  List<Product> get items => _items.keys.toList();

  void addItem(Product product) {
    if (_items.containsKey(product)) {
      _items[product] = _items[product]! + 1;
    } else {
      _items[product] = 1;
    }
  }

  void removeItem(Product product) {
    if (_items.containsKey(product) && _items[product]! > 1) {
      _items[product] = _items[product]! - 1;
    } else {
      _items.remove(product);
    }
  }

  int getQuantity(Product product) {
    return _items[product] ?? 0;
  }

  double get totalPrice {
    double total = 0.0;
    _items.forEach((product, quantity) {
      total += product.price * quantity;
    });
    return total;
  }

  void clear() {
    _items.clear();
  }
}
