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
  Future<Either<Failure, List<ProductsModel>>> fetchSearchProducts(String value)async {

    try {
      var data = await

      apiServices.get(
          endPoint:value

      );
      List<ProductsModel>productsList = [];
      for (var products in data['items']) {
       productsList.add(ProductsModel.fromJson(products));
      }
      print('llllllllllllllllllllllllll');
      print(productsList);
      print('llllllllllllllllllllllllll');
      return right(productsList);
    } catch (e) {
      if (e is DioException) {
        print(e.toString());
        return left(ServerFailure('Opps There was an Error,please try again'));
        //  return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure.fromDioException(e.toString() as DioException));
    }
  }
  }

