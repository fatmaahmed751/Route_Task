import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/api_services.dart';
import 'core/utils/bloc_observer.dart';
import 'features/products/data/product_repos/products_repo_implement.dart';
import 'features/products/presentation/manager/cubit/product_cubit.dart';
import 'features/products/presentation/view/products_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String value = '';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
 return  BlocProvider(
     create: ( context)=>ProductsCubit(ProductsRepoImplement(ApiServices(
         Dio()),),)..fetchProductsData(value),
       child:const MaterialApp(
         debugShowCheckedModeBanner: false,
         home:ProductsScreen(
         ),
   ),
   );
  }
}

