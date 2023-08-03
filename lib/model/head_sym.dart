import 'model.dart';

class ProductsRepository {
  static List<Product> loadProducts(Category category) {
    const allProducts = <Product>[
      Product(
        category: Category.head,
        id: '1-0',
        name: '열 증상',
      ),
      Product(
        category: Category.head,
        id: '1-1',
        name: '머리 부상\n(피/상처)',
      ),
      Product(
        category: Category.head,
        id: '1-2',
        name: '머리 통증',
      ),
      Product(
        category: Category.head,
        id: '1-3',
        name: '어지러움',
      ),
      Product(
        category: Category.head,
        id: '1-4',
        name: '황달 증상',
      ),
      Product(
        category: Category.head,
        id: '1-5',
        name: '머리 혹 생김',
      ),
      Product(
        category: Category.head,
        id: '1-6',
        name: '머리카락 빠짐',
      ),
      Product(
        category: Category.head,
        id: '2-0',
        name: '다래끼가 났어요',
      ),
      Product(
        category: Category.head,
        id: '2-1',
        name: '눈이 건조해요',
      ),
      Product(
        category: Category.head,
        id: '2-2',
        name: '눈 안이 빨개요',
      ),
      Product(
        category: Category.head,
        id: '2-3',
        name: '시야가 흐려요',
      ),
      Product(
        category: Category.head,
        id: '2-4',
        name: '눈이 부었어요',
      ),
      Product(
        category: Category.head,
        id: '2-5',
        name: '눈이 간지러워요\n(알레르기)',
      ),
      Product(
        category: Category.head,
        id: '3-0',
        name: '콧물이 나요',
      ),
      Product(
        category: Category.head,
        id: '3-1',
        name: '코피가 나요',
      ),
      Product(
        category: Category.head,
        id: '3-2',
        name: '코가 아파요',
      ),
      Product(
        category: Category.head,
        id: '3-3',
        name: '코가 건조해요',
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
