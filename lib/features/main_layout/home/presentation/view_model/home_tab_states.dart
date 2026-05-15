import 'package:ecommerce_app/features/main_layout/home/domain/entities/brands_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/categories_entity.dart';

sealed class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class CategoriesLoadingState extends HomeTabStates {}

class CategoriesSuccessState extends HomeTabStates {
  final List<CategoriesEntity> categories;
  CategoriesSuccessState(this.categories);
}

class CategoriesFailureState extends HomeTabStates {
  final String failureMessage;
  CategoriesFailureState(this.failureMessage);
}

class BrandsLoadingState extends HomeTabStates {}

class BrandsSuccessState extends HomeTabStates {
  final List<BrandsEntity> brands;
  BrandsSuccessState(this.brands);
}

class BrandsFailureState extends HomeTabStates {
  final String errorMessage;
  BrandsFailureState(this.errorMessage);
}
