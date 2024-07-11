
import 'package:dartz/dartz.dart';
import '../../../../core/exceptions/failure.dart';
import '../products_model/products_model.dart';

abstract class ProductsRepo{

  Future<Either<Failure,List<ProductsModel>>> fetchSearchProducts(String value);
}
