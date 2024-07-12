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
        // Handle DioError specifically (e.g., network issues, timeout, etc.)
        print('Dio error: $e');
        return Left(ServerFailure.fromDioException(e));
      } else {
        // Handle other types of exceptions
        print('General error: $e');
        return Left(
            ServerFailure('Oops! There was an error. Please try again.'));
      }
    }
  }
// try {
//   print('hellllllllllllllllllo');
//  var data = await apiServices.getSearch();
//   List<ProductsModel>productModel=[];
//       for (var product in data['products'] ) {
//         productModel.add(ProductsModel.fromJson(product));
//       }
//       print('hellllllllllhhhhhllllllllo');// Call the modified getSearch
//       return right(productModel);
// } catch (e) {
//   if (e is DioException) {
//     print(e.toString().toString());
//     return left(ServerFailure.fromDioException(e).toString() as Failure);
//
//   }
//   // If it's not a DioException, handle it accordingly
//   return left(ServerFailure('Opps There was an Error, Please try again'));
// }
// }


}

