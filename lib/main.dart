
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_task/core/utils/service_locator.dart';
import 'core/utils/bloc_observer.dart';
import 'features/products/data/product_repos/products_repo_implement.dart';
import 'features/products/presentation/manager/cubit/product_cubit.dart';
import 'features/products/presentation/view/products_screen.dart';

void main() {
  ServicesLocator().init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String value = '';

  @override
  Widget build(BuildContext context) {
 return  BlocProvider(
     create: ( context)=>ProductsCubit(getIt.get<ProductsRepoImplement>()
      )..fetchProductsData(value),
       child: MaterialApp(
         theme: ThemeData.light(),
         debugShowCheckedModeBanner: false,
         home:const ProductsScreen(
         ),
   ),
   );
  }
}

