import 'package:ecommerce_app/core/resources/api_result.dart';
import 'package:ecommerce_app/features/products_screen/data/models/add_to_cart_request_model.dart';
import 'package:ecommerce_app/features/products_screen/domain/entites/add_to_cart_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/repository/products_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUsecase {
  final ProductsRepository _repository;
  const AddToCartUsecase(this._repository);

  Future<ApiResult<AddToCartEntity>> call({required String productId}) async {
    return _repository.addProductToCart(
      body: AddToCartRequestModel(productId: productId),
    );
  }
}
