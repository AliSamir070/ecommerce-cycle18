import 'package:ecommerce_app/core/apis/base_api_client.dart';
import 'package:ecommerce_app/core/resources/api_result.dart';
import 'package:ecommerce_app/features/products_screen/data/data_sources/products_data_source.dart';
import 'package:ecommerce_app/features/products_screen/data/models/products_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsDataSource)
class ProductsDataSourceImpl implements ProductsDataSource {
  final BaseApiClient _apiClient;
  const ProductsDataSourceImpl(this._apiClient);

  @override
  Future<ApiResult<ProductsResponse>> getProducts({
    String? categoryId,
    String? brandId,
  }) async {
    try {
      final result = await _apiClient.getProducts(
        brandId: brandId,
        categoryId: categoryId,
      );

      if (result.statusMsg == null) {
        return Success(result);
      } else {
        return Failure(result.message ?? "Something Went Wrong");
      }
    } catch (exception) {
      return Failure(exception.toString());
    }
  }
}
