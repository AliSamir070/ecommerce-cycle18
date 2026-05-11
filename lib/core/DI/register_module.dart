import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@module
abstract class RegisterModule {
  Dio createDio()=>Dio(BaseOptions(
    validateStatus: (status) {
      if(status! <500){
        return true;
      }
      return false;
    },
  ));
}