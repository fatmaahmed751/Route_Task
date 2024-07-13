

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:route_task/core/utils/api_services.dart';

import '../../features/products/data/product_repos/products_repo_implement.dart';

GetIt getIt = GetIt.instance;
class ServicesLocator {

  void init() {
    getIt.registerSingleton<ProductsRepoImplement>(
      ProductsRepoImplement(ApiServices(
          Dio()
      ),
      ),);

  }
}