import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_task/features/products/presentation/manager/cubit/product_state.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitialState());
 // final ProductRepo homeRepo;

  static ProductCubit get(context) => BlocProvider.of(context);
}