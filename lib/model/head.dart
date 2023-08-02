enum Category {
  all,
  accessories,
  clothing,
  home,
}

class Product {
  const Product({
    required this.sym,
    required this.sympicture,
  });

  final Category category;
  final bool sympicture;
  final String sym;

  String get assetName => '$id-0.jpg'; //
  String get assetPackage => 'shrine_images';

  @override
  String toString() => "$name (id=$id)";
}
