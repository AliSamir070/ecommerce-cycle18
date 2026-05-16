// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/api/auth_client.dart' as _i397;
import '../../features/auth/data/datasource/auth_dao.dart' as _i753;
import '../../features/auth/data/datasource_impl/auth_api_dao_impl.dart'
    as _i793;
import '../../features/auth/data/repo_impl/auth_repo_impl.dart' as _i279;
import '../../features/auth/domain/repo/auth_repo.dart' as _i170;
import '../../features/auth/domain/usecase/sign_in_use_case.dart' as _i277;
import '../../features/auth/domain/usecase/sign_up_use_case.dart' as _i538;
import '../../features/auth/presentation/viewmodels/signin_view_model/sign_in_view_model_cubit.dart'
    as _i124;
import '../../features/auth/presentation/viewmodels/signup_view_model/signu_view_model_cubit.dart'
    as _i462;
import '../../features/main_layout/home/data/data_sources/home_tab_data_source.dart'
    as _i263;
import '../../features/main_layout/home/data/data_sources/home_tab_data_source_impl.dart'
    as _i701;
import '../../features/main_layout/home/data/repository/home_tab_repository_impl.dart'
    as _i899;
import '../../features/main_layout/home/domain/repository/home_tab_repository.dart'
    as _i164;
import '../../features/main_layout/home/domain/usecases/get_all_brands_usecase.dart'
    as _i474;
import '../../features/main_layout/home/domain/usecases/get_all_categories_usecase.dart'
    as _i870;
import '../../features/main_layout/home/presentation/view_model/home_tab_view_model.dart'
    as _i590;
import '../../features/products_screen/data/data_sources/products_data_source.dart'
    as _i269;
import '../../features/products_screen/data/data_sources/products_data_source_impl.dart'
    as _i149;
import '../../features/products_screen/data/repository/products_repository_impl.dart'
    as _i395;
import '../../features/products_screen/domain/repository/products_repository.dart'
    as _i354;
import '../../features/products_screen/domain/usecases/add_to_cart_usecase.dart'
    as _i631;
import '../../features/products_screen/domain/usecases/get_products_usecase.dart'
    as _i936;
import '../../features/products_screen/presentation/view_model/products_view_model.dart'
    as _i64;
import '../apis/base_api_client.dart' as _i1046;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i361.Dio>(() => registerModule.createDio());
    gh.singleton<_i1046.BaseApiClient>(
        () => _i1046.BaseApiClient(gh<_i361.Dio>()));
    gh.singleton<_i397.AuthClient>(() => _i397.AuthClient(gh<_i361.Dio>()));
    gh.factory<_i269.ProductsDataSource>(
        () => _i149.ProductsDataSourceImpl(gh<_i1046.BaseApiClient>()));
    gh.factory<_i263.HomeTabDataSource>(
        () => _i701.HomeTabDataSourceImpl(gh<_i1046.BaseApiClient>()));
    gh.factory<_i164.HomeTabRepository>(
        () => _i899.HomeTabRepositoryImpl(gh<_i263.HomeTabDataSource>()));
    gh.factory<_i753.AuthDao>(
        () => _i793.AuthApiDaoImpl(gh<_i397.AuthClient>()));
    gh.factory<_i170.AuthRepo>(() => _i279.AuthRepoImpl(gh<_i753.AuthDao>()));
    gh.factory<_i474.GetAllBrandsUsecase>(
        () => _i474.GetAllBrandsUsecase(gh<_i164.HomeTabRepository>()));
    gh.factory<_i870.GetAllCategoriesUsecase>(
        () => _i870.GetAllCategoriesUsecase(gh<_i164.HomeTabRepository>()));
    gh.factory<_i354.ProductsRepository>(
        () => _i395.ProductsRepositoryImpl(gh<_i269.ProductsDataSource>()));
    gh.singleton<_i277.SignInUseCase>(
        () => _i277.SignInUseCase(gh<_i170.AuthRepo>()));
    gh.singleton<_i538.SignUpUseCase>(
        () => _i538.SignUpUseCase(gh<_i170.AuthRepo>()));
    gh.factory<_i124.SignInViewModelCubit>(
        () => _i124.SignInViewModelCubit(gh<_i277.SignInUseCase>()));
    gh.factory<_i462.SignupViewModelCubit>(
        () => _i462.SignupViewModelCubit(gh<_i538.SignUpUseCase>()));
    gh.factory<_i590.HomeTabViewModel>(() => _i590.HomeTabViewModel(
          gh<_i870.GetAllCategoriesUsecase>(),
          gh<_i474.GetAllBrandsUsecase>(),
        ));
    gh.factory<_i631.AddToCartUsecase>(
        () => _i631.AddToCartUsecase(gh<_i354.ProductsRepository>()));
    gh.factory<_i936.GetProductsUsecase>(
        () => _i936.GetProductsUsecase(gh<_i354.ProductsRepository>()));
    gh.factory<_i64.ProductsViewModel>(() => _i64.ProductsViewModel(
          gh<_i936.GetProductsUsecase>(),
          gh<_i631.AddToCartUsecase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
