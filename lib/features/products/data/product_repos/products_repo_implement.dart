import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:route_task/core/exceptions/failure.dart';
import 'package:route_task/features/products/data/product_repos/products_repo.dart';
import 'package:route_task/features/products/data/products_model/products_model.dart';

import '../../../../core/utils/api_services.dart';

class ProductsRepoImplement implements ProductsRepo {

  ApiServices apiServices;

  ProductsRepoImplement(this.apiServices);


  @override
  Future<Either<Failure, List<ProductsModel>>> fetchSearchProducts(
      String value) async {
    try {
      var data = await apiServices.getSearch(value: value);

      if (data.containsKey('products') && data['products'] is List) {
        List<dynamic> productsData = data['products'];

        List<ProductsModel> productModel = productsData.map((product) =>
            ProductsModel.fromJson(product)).toList();

        return Right(productModel);
      } else {
        return Left(ServerFailure('Products data is invalid'));
      }
    } catch (e) {
      if (e is DioException) {

        print('Dio error: $e');
        return Left(ServerFailure.fromDioException(e));
      } else {
        print('General error: $e');
        return Left(
            ServerFailure('Oops! There was an error. Please try again.'));
      }
    }
  }



}

