import 'model.dart';

class ProductsRepository {
  static List<Product> loadProducts(Category category) {
    const allProducts = <Product>[
      Product(
        category: Category.leg,
        id: '1-0',
        name: '통증',
      ),
      Product(
        category: Category.leg,
        id: '1-1',
        name: '부상 (피/상처)',
      ),
      Product(
        category: Category.leg,
        id: '1-2',
        name: '근육 경련',
      ),
      Product(
        category: Category.leg,
        id: '1-3',
        name: '알레르기',
      ),
      Product(
        category: Category.leg,
        id: '1-4',
        name: '부종',
      ),
      Product(
        category: Category.leg,
        id: '1-5',
        name: '불편함(움직임 제한)',
      ),
      Product(
        category: Category.leg,
        id: '1-6',
        name: '골절',
      ),
      Product(
        category: Category.leg,
        id: '2-0',
        name: '통증',
      ),
      Product(
        category: Category.leg,
        id: '2-1',
        name: '부상 (피/상처)',
      ),
      Product(
        category: Category.leg,
        id: '2-2',
        name: '부종',
      ),
      Product(
        category: Category.leg,
        id: '2-3',
        name: '불편함(움직임 제한)',
      ),
      Product(
        category: Category.leg,
        id: '2-4',
        name: '두드러기',
      ),
      Product(
        category: Category.leg,
        id: '2-5',
        name: '골절',
      ),
      Product(
        category: Category.leg,
        id: '3-0',
        name: '통증',
      ),
      Product(
        category: Category.leg,
        id: '3-1',
        name: '부상 (피/상처)',
      ),
      Product(
        category: Category.leg,
        id: '3-2',
        name: '부종',
      ),
      Product(
        category: Category.leg,
        id: '3-3',
        name: '간지러움',
      ),
      Product(
        category: Category.leg,
        id: '3-4',
        name: '발톱 빠짐',
      ),
      Product(
        category: Category.leg,
        id: '3-5',
        name: '발톱 변색',
      ),
      Product(
        category: Category.leg,
        id: '3-6',
        name: '발톱 갈라짐',
      ),
      Product(
        category: Category.leg,
        id: '3-7',
        name: '무좀',
      ),
      Product(
        category: Category.leg,
        id: '4-0',
        name: '통증',
      ),
      Product(
        category: Category.leg,
        id: '4-1',
        name: '부상 (피/상처)',
      ),
      Product(
        category: Category.leg,
        id: '4-2',
        name: '부종',
      ),
      Product(
        category: Category.leg,
        id: '4-3',
        name: '경련',
      ),
      Product(
        category: Category.leg,
        id: '4-4',
        name: '불편함 (움직임 제한)',
      ),
      Product(
        category: Category.leg,
        id: '4-5',
        name: '관절',
      ),
      Product(
        category: Category.leg,
        id: '4-6',
        name: '두드러기',
      ),
      Product(
        category: Category.leg,
        id: '5-0',
        name: '통증',
      ),
      Product(
        category: Category.leg,
        id: '5-1',
        name: '부상 (피/상처)',
      ),
      Product(
        category: Category.leg,
        id: '5-2',
        name: '부종',
      ),
      Product(
        category: Category.leg,
        id: '5-3',
        name: '경련',
      ),
      Product(
        category: Category.leg,
        id: '5-4',
        name: '불편함(움직임 제한)',
      ),
      Product(
        category: Category.leg,
        id: '5-5',
        name: '두드러기',
      ),
      Product(
        category: Category.leg,
        id: '5-4',
        name: '골절',
      ),
    ];
    if (category == Category.leg) {
      return allProducts;
    } else {
      return allProducts.where((Product p) {
        return p.category == category;
      }).toList();
    }
  }
}
