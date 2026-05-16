import 'package:ecommerce_app/core/resources/api_result.dart';
import 'package:ecommerce_app/core/resources/internet_checker.dart';
import 'package:ecommerce_app/features/products_screen/data/data_sources/products_data_source.dart';
import 'package:ecommerce_app/features/products_screen/data/models/add_to_cart_request_model.dart';
import 'package:ecommerce_app/features/products_screen/data/models/add_to_cart_response.dart';
import 'package:ecommerce_app/features/products_screen/data/models/products_response.dart';
import 'package:ecommerce_app/features/products_screen/domain/entites/add_to_cart_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/entites/product_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/repository/products_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsRepository)
class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsDataSource _dataSource;
  const ProductsRepositoryImpl(this._dataSource);

  @override
  Future<ApiResult<List<ProductEntity>>> getProducts({
    String? categoryId,
    String? brandId,
  }) async {
    if (await InternetChecker.checkConnection()) {
      final result = await _dataSource.getProducts(
        brandId: brandId,
        categoryId: categoryId,
      );

      switch (result) {
        case Success<ProductsResponse>():
          return Success(result.response.data
                  ?.map((product) => product!.toEntity())
                  .toList() ??
              []);
        case Failure<ProductsResponse>():
          return Failure(result.error);
      }
    } else {
      return Failure('No Internet Connection');
    }
  }

  @override
  Future<ApiResult<AddToCartEntity>> addProductToCart({
    required AddToCartRequestModel body,
  }) async {
    if (await InternetChecker.checkConnection()) {
      final result = await _dataSource.addToCart(body: body);

      switch (result) {
        case Success<AddToCartResponse>():
          return Success(result.response.toEntity());
        case Failure<AddToCartResponse>():
          return Failure(result.error);
      }
    } else {
      return Failure('No Internet Connection');
    }
  }
}
