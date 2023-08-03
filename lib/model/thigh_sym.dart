import 'model.dart';

class ProductsRepository {
  static List<Product> loadProducts(Category category) {
    const allProducts = <Product>[
      Product(
        category: Category.thigh,
        id: '1-0',
        name: '통증',
      ),
      Product(
        category: Category.thigh,
        id: '1-1',
        name: '부상(피/상처)',
      ),
      Product(
        category: Category.thigh,
        id: '1-2',
        name: '뼈 관절',
      ),
      Product(
        category: Category.thigh,
        id: '1-3',
        name: '운동 제한(걷기 등)',
      ),
      Product(
        category: Category.thigh,
        id: '1-4',
        name: '붓기',
      ),
      Product(
        category: Category.thigh,
        id: '2-0',
        name: '통증',
      ),
      Product(
        category: Category.thigh,
        id: '2-1',
        name: '부상(피/상처)',
      ),
      Product(
        category: Category.thigh,
        id: '2-2',
        name: '간지러움',
      ),
      Product(
        category: Category.thigh,
        id: '2-3',
        name: '근육 경련',
      ),
      Product(
        category: Category.thigh,
        id: '2-4',
        name: '저림/마비',
      ),
      Product(
        category: Category.thigh,
        id: '2-5',
        name: '붓기',
      ),
      Product(
        category: Category.thigh,
        id: '2-6',
        name: '알레르기',
      ),
      Product(
        category: Category.thigh,
        id: '2-7',
        name: '변비/설사',
      ),
      Product(
        category: Category.thigh,
        id: '3-0',
        name: '통증',
      ),
      Product(
        category: Category.thigh,
        id: '3-1',
        name: '부상\n(피/상처)',
      ),
      Product(
        category: Category.thigh,
        id: '3-2',
        name: '간지러움',
      ),
      Product(
        category: Category.thigh,
        id: '3-3',
        name: '질 분비물 변화',
      ),
      Product(
        category: Category.thigh,
        id: '3-4',
        name: '발기 문제',
      ),
      Product(
        category: Category.thigh,
        id: '3-5',
        name: '생리 관련 증상',
      ),
      Product(
        category: Category.thigh,
        id: '3-6',
        name: '부종',
      ),
      Product(
        category: Category.thigh,
        id: '3-5',
        name: '빈뇨/잔뇨 등 문제',
      ),
    ];
    if (category == Category.thigh) {
      return allProducts;
    } else {
      return allProducts.where((Product p) {
        return p.category == category;
      }).toList();
    }
  }
}
