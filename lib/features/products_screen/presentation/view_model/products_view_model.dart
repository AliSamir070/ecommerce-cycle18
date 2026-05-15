import 'package:ecommerce_app/core/resources/api_result.dart';
import 'package:ecommerce_app/features/products_screen/domain/entites/product_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/usecases/get_products_usecase.dart';
import 'package:ecommerce_app/features/products_screen/presentation/view_model/products_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsViewModel extends Cubit<ProductsStates> {
  final GetProductsUsecase _getProductsUsecase;
  ProductsViewModel(this._getProductsUsecase) : super(ProductsInitialState());

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
}
