import 'package:ecommerce_app/core/resources/api_result.dart';
import 'package:ecommerce_app/core/resources/internet_checker.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/home_tab_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/brands_response.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/categories_response.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/brands_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/categories_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repository/home_tab_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeTabRepository)
class HomeTabRepositoryImpl implements HomeTabRepository {
  final HomeTabDataSource _dataSource;
  const HomeTabRepositoryImpl(this._dataSource);

  @override
  Future<ApiResult<List<CategoriesEntity>>> getAllCategories() async {
    if (await InternetChecker.checkConnection()) {
      final result = await _dataSource.getAllCategories();
      switch (result) {
        case Success<CategoriesResponse>():
          return Success(result.response.data
                  ?.map((categoty) => categoty!.toEntity())
                  .toList() ??
              []);
        case Failure<CategoriesResponse>():
          return Failure(result.error);
      }
    } else {
      return Failure('No Internet Connection');
    }
  }

  @override
  Future<ApiResult<List<BrandsEntity>>> getAllBrands() async {
    if (await InternetChecker.checkConnection()) {
      final result = await _dataSource.getAllBrands();

      switch (result) {
        case Success<BrandsResponse>():
          return Success(result.response.data
                  ?.map((brand) => brand!.toEntity())
                  .toList() ??
              []);
        case Failure<BrandsResponse>():
          return Failure(result.error);
      }
    } else {
      return Failure('No Internet Connection');
    }
  }
}
