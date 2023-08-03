import 'model.dart';

class ProductsRepository {
  static List<Product> loadProducts(Category category) {
    const allProducts = <Product>[
      Product(
        category: Category.head,
        id: 0,
        name: '열 증상',
      ),
      Product(
        category: Category.head,
        id: 1,
        name: '머리 부상\n(피/상처)',
      ),
      Product(
        category: Category.head,
        id: 2,
        name: '머리 통증',
      ),
      Product(
        category: Category.head,
        id: 3,
        name: '어지러움',
      ),
      Product(
        category: Category.head,
        id: 4,
        name: '황달 증상',
      ),
      Product(
        category: Category.head,
        id: 5,
        name: '머리 혹 생김',
      ),
      Product(
        category: Category.head,
        id: 6,
        name: '머리카락 빠짐',
      ),
    ];
    if (category == Category.head) {
      return allProducts;
    } else {
      return allProducts.where((Product p) {
        return p.category == category;
      }).toList();
    }
  }
}
