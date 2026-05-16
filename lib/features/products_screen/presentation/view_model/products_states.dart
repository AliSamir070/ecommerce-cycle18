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

class AddToCartLoadingState extends ProductsStates {
  final String productId;
  AddToCartLoadingState(this.productId);
}

class AddToCartSuccessState extends ProductsStates {
  final String message;
  final String productId;
  AddToCartSuccessState(this.message, this.productId);
}

class AddToCartFailureState extends ProductsStates {
  final String failureMessage;
  final String productId;
  AddToCartFailureState(this.failureMessage, this.productId);
}
