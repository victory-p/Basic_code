import 'model.dart';

class ProductsRepository {
  static List<Product> loadProducts(Category category) {
    const allProducts = <Product>[
      Product(
        category: Category.arm,
        id: '1-0',
        name: '손등 통증',
      ),
      Product(
        category: Category.arm,
        id: '1-1',
        name: '손등 부상\n(피/상처)',
      ),
      Product(
        category: Category.arm,
        id: '1-2',
        name: '손바닥 통증',
      ),
      Product(
        category: Category.arm,
        id: '1-3',
        name: '손바닥 부상',
      ),
      Product(
        category: Category.arm,
        id: '1-4',
        name: '손가락 부상\n(피/잘림)',
      ),
      Product(
        category: Category.arm,
        id: '1-5',
        name: '손가락 뼈골절',
      ),
      Product(
        category: Category.arm,
        id: '1-6',
        name: '손이 부어요',
      ),
      Product(
        category: Category.arm,
        id: '1-7',
        name: '손 알레르기',
      ),
      Product(
        category: Category.arm,
        id: '2-0',
        name: '손목 통증',
      ),
      Product(
        category: Category.arm,
        id: '2-1',
        name: '손목 탈골/골절',
      ),
      Product(
        category: Category.arm,
        id: '2-2',
        name: '손목 부상(상처)',
      ),
      Product(
        category: Category.arm,
        id: '2-3',
        name: '팔 통증',
      ),
      Product(
        category: Category.arm,
        id: '2-4',
        name: '팔 골절(뼈 부상)',
      ),
      Product(
        category: Category.arm,
        id: '2-5',
        name: '팔 부상(상처)',
      ),
      Product(
        category: Category.arm,
        id: '2-6',
        name: '알레르기',
      ),
      Product(
        category: Category.arm,
        id: '2-7',
        name: '팔 부종',
      ),
      Product(
        category: Category.arm,
        id: '3-0',
        name: '팔꿈치 부상\n(상처/타박상)',
      ),
      Product(
        category: Category.arm,
        id: '3-1',
        name: '팔꿈치 통증',
      ),
      Product(
        category: Category.arm,
        id: '3-2',
        name: '팔꿈치 뼈 골절',
      ),
      Product(
        category: Category.arm,
        id: '3-3',
        name: '알레르기',
      ),
      Product(
        category: Category.arm,
        id: '3-4',
        name: '팔 부상(상처)',
      ),
      Product(
        category: Category.arm,
        id: '3-5',
        name: '팔 통증',
      ),
      Product(
        category: Category.arm,
        id: '3-6',
        name: '팔 골절',
      ),
      Product(
        category: Category.arm,
        id: '3-7',
        name: '팔 부종',
      ),
      Product(
        category: Category.arm,
        id: '4-0',
        name: '어깨 통증',
      ),
      Product(
        category: Category.arm,
        id: '4-1',
        name: '어깨 탈골/골절',
      ),
      Product(
        category: Category.arm,
        id: '4-2',
        name: '알레르기',
      ),
      Product(
        category: Category.arm,
        id: '4-3',
        name: '겨드랑이 통증',
      ),
    ];
    if (category == Category.arm) {
      return allProducts;
    } else {
      return allProducts.where((Product p) {
        return p.category == category;
      }).toList();
    }
  }
}
