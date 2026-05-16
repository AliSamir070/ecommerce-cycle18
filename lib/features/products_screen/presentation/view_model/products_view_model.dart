import 'package:ecommerce_app/core/resources/api_result.dart';
import 'package:ecommerce_app/features/products_screen/domain/entites/add_to_cart_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/entites/product_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/usecases/add_to_cart_usecase.dart';
import 'package:ecommerce_app/features/products_screen/domain/usecases/get_products_usecase.dart';
import 'package:ecommerce_app/features/products_screen/presentation/view_model/products_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsViewModel extends Cubit<ProductsStates> {
  final GetProductsUsecase _getProductsUsecase;
  final AddToCartUsecase _addToCartUsecase;
  ProductsViewModel(this._getProductsUsecase, this._addToCartUsecase)
      : super(ProductsInitialState());

  Future<void> getProducts({String? categoryId, String? brandId}) async {
    emit(ProductsLoadingState());

    final result = await _getProductsUsecase(
      brandId: brandId,
      categoryId: categoryId,
    );

    switch (result) {
      case Success<List<ProductEntity>>():
        emit(ProductsSuccessState(result.response));
      case Failure<List<ProductEntity>>():
        emit(ProductsFailureState(result.error));
    }
  }

  Future<void> addProductToCart({required String productId}) async {
    emit(AddToCartLoadingState(productId));

    final result = await _addToCartUsecase(productId: productId);

    switch (result) {
      case Success<AddToCartEntity>():
        emit(AddToCartSuccessState(result.response.message, productId));
      case Failure<AddToCartEntity>():
        emit(AddToCartFailureState(result.error, productId));
    }
  }
}
