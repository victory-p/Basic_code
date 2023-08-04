import 'model.dart';

class ProductsRepository {
  static List<Product> loadProducts(Category category) {
    const allProducts = <Product>[
      Product(
        category: Category.chest,
        id: '1-0',
        name: '호흡 힘듦',
      ),
      Product(
        category: Category.chest,
        id: '1-1',
        name: '통증\n(가슴 통증)',
      ),
      Product(
        category: Category.chest,
        id: '1-2',
        name: '통증\n(심장 통증)',
      ),
      Product(
        category: Category.chest,
        id: '1-3',
        name: '가슴 알레르기',
      ),
      Product(
        category: Category.chest,
        id: '2-0',
        name: '배 통증 \n(배 아픔)',
      ),
      Product(
        category: Category.chest,
        id: '2-1',
        name: '변비',
      ),
      Product(
        category: Category.chest,
        id: '2-2',
        name: '설사',
      ),
      Product(
        category: Category.chest,
        id: '2-3',
        name: '탈수',
      ),
      Product(
        category: Category.chest,
        id: '2-4',
        name: '복수가 차요',
      ),
      Product(
        category: Category.chest,
        id: '2-5',
        name: '배 알레르기',
      ),
      Product(
        category: Category.chest,
        id: '2-6',
        name: '속이 쓰려요 / \n 토할것 같아요',
      ),
      Product(
        category: Category.chest,
        id: '2-7',
        name: '오른쪽 옆구리 통증',
      ),
      Product(
        category: Category.chest,
        id: '2-8',
        name: '왼쪽 옆구리 통증',
      ),
      Product(
        category: Category.chest,
        id: '2-9',
        name: '생리 관련 증상',
      ),
      Product(
        category: Category.chest,
        id: '3-0',
        name: '등 통증\n(등 맨 위)',
      ),
      Product(
        category: Category.chest,
        id: '3-1',
        name: '등 통증\n(등 중앙)',
      ),
      Product(
        category: Category.chest,
        id: '3-2',
        name: '등 통증\n(등 맨 아래)',
      ),
      Product(
        category: Category.chest,
        id: '3-3',
        name: '허리 골절/탈골',
      ),
      Product(
        category: Category.chest,
        id: '3-4',
        name: '등드름',
      ),
      Product(
        category: Category.chest,
        id: '3-5',
        name: '허리 통증\n(삐끗함)',
      ),
    ];
    if (category == Category.chest) {
      return allProducts;
    } else {
      return allProducts.where((Product p) {
        return p.category == category;
      }).toList();
    }
  }
}
