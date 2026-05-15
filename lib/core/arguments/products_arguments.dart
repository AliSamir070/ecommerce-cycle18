class ProductsArguments {
  final String? categoryId;
  final String? brandId;

  const ProductsArguments({this.categoryId, this.brandId});

  @override
  String toString() {
    return 'ProductsArguments: (categoryId is: $categoryId, brandId is: $brandId)';
  }
}
