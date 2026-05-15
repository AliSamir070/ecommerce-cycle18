import 'package:ecommerce_app/core/resources/api_result.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/brands_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/categories_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/usecases/get_all_brands_usecase.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/usecases/get_all_categories_usecase.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/view_model/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  final GetAllCategoriesUsecase _categoriesUsecase;
  final GetAllBrandsUsecase _allBrandsUsecase;
  HomeTabViewModel(this._categoriesUsecase, this._allBrandsUsecase)
      : super(HomeTabInitialState()) {
    getAllCategories();
    getAllBrands();
  }

  Future<void> getAllCategories() async {
    emit(CategoriesLoadingState());

    final result = await _categoriesUsecase();

    switch (result) {
      case Success<List<CategoriesEntity>>():
        emit(CategoriesSuccessState(result.response));
      case Failure<List<CategoriesEntity>>():
        emit(CategoriesFailureState(result.error));
    }
  }

  Future<void> getAllBrands() async {
    emit(BrandsLoadingState());

    final result = await _allBrandsUsecase();

    switch (result) {
      case Success<List<BrandsEntity>>():
        emit(BrandsSuccessState(result.response));
      case Failure<List<BrandsEntity>>():
        emit(BrandsFailureState(result.error));
    }
  }
}
