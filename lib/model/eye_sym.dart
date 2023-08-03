import 'model.dart';

class ProductsRepository {
  static List<Product> loadProducts(Category category) {
    const allProducts = <Product>[
      Product(
        category: Category.head,
        id: 0,
        name: '다래끼가 났어요',
      ),
      Product(
        category: Category.head,
        id: 1,
        name: '눈이 건조해요',
      ),
      Product(
        category: Category.head,
        id: 2,
        name: '눈 안이 빨개요',
      ),
      Product(
        category: Category.head,
        id: 3,
        name: '시야가 흐려요',
      ),
      Product(
        category: Category.head,
        id: 4,
        name: '눈이 부었어요',
      ),
      Product(
        category: Category.head,
        id: 5,
        name: '눈이 간지러워요\n(알레르기)',
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
