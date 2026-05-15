import 'package:ecommerce_app/features/products_screen/domain/entites/product_entity.dart';

sealed class ProductsStates {}

class ProductsInitialState extends ProductsStates {}

class ProductsLoadingState extends ProductsStates {}

class ProductsSuccessState extends ProductsStates {
  final List<ProductEntity> products;
  ProductsSuccessState(this.products);
}

class ProductsFailureState extends ProductsStates {
  final String message;
  ProductsFailureState(this.message);
}
