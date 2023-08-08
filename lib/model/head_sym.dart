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
      Product(
        category: Category.head,
        id: '4-0',
        name: '치아가 흔들려요',
      ),
      Product(
        category: Category.head,
        id: '4-1',
        name: '충치가 있어요',
      ),
      Product(
        category: Category.head,
        id: '4-2',
        name: '치아가 아파요',
      ),
      Product(
        category: Category.head,
        id: '4-3',
        name: '구내염이 났어요',
      ),
      Product(
        category: Category.head,
        id: '4-4',
        name: '입술에서\n피가 나요',
      ),
      Product(
        category: Category.head,
        id: '4-5',
        name: '잇몸이 아파요',
      ),
      Product(
        category: Category.head,
        id: '4-6',
        name: '입이 건조해요',
      ),
      Product(
        category: Category.head,
        id: '5-0',
        name: '귀 통증',
      ),
      Product(
        category: Category.head,
        id: '5-1',
        name: '이명이 들려요',
      ),
      Product(
        category: Category.head,
        id: '5-2',
        name: '귀 부상\n(피/상처)',
      ),
      Product(
        category: Category.head,
        id: '5-3',
        name: '알레르기',
      ),
      Product(
        category: Category.head,
        id: '5-4',
        name: '귀가 부었어요',
      ),
      Product(
        category: Category.head,
        id: '6-0',
        name: '목 통증',
      ),
      Product(
        category: Category.head,
        id: '6-1',
        name: '가래가 나와요',
      ),
      Product(
        category: Category.head,
        id: '6-2',
        name: '목이 부었어요',
      ),
      Product(
        category: Category.head,
        id: '6-3',
        name: '기침이 나요',
      ),
      Product(
        category: Category.head,
        id: '6-4',
        name: '구토를 해요',
      ),
      Product(
        category: Category.head,
        id: '6-5',
        name: '알레르기',
      ),
      Product(
        category: Category.cheek,
        id: '7-0',
        name: '볼 통증',
      ),
      Product(
        category: Category.cheek,
        id: '7-1',
        name: '볼이 부었어요',
      ),
      Product(
        category: Category.cheek,
        id: '7-2',
        name: '볼 부상(피/상처)',
      ),
      Product(
        category: Category.cheek,
        id: '7-3',
        name: '여드름이 심해요',
      ),
      Product(
        category: Category.cheek,
        id: '7-4',
        name: '얼굴이 노래요',
      ),
      Product(
        category: Category.cheek,
        id: '7-5',
        name: '홍조가 나타나요',
      ),
      Product(
        category: Category.head,
        id: '8-0',
        name: '턱 상처',
      ),
      Product(
        category: Category.head,
        id: '8-1',
        name: '턱관절이 아파요',
      ),
      Product(
        category: Category.head,
        id: '8-2',
        name: '턱이 아파요\n(통증)',
      ),
      Product(
        category: Category.head,
        id: '8-3',
        name: '턱에서\n경련이 왔어요',
      ),
      Product(
        category: Category.head,
        id: '8-4',
        name: '여드름이 심해요',
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
