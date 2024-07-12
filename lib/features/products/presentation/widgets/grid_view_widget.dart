

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:route_task/features/products/presentation/manager/cubit/product_states.dart';

import '../../../../core/constants.dart';
import '../../data/products_model/products_model.dart';
import '../manager/cubit/product_cubit.dart';
class GridViewWidget extends StatelessWidget{
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit,ProductsStates>(
      builder: (BuildContext context, ProductsStates state) {
        if (state is GetProductsSuccessState) {
          return Expanded(
            child: SizedBox(

              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 4.9,
                  mainAxisSpacing: 17.0,
                  crossAxisSpacing: 7.0,
                ),

            itemBuilder: (context, index) =>

              productContainerDetails(state.products[index]),

                itemCount:
                state.products.length
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }
    );
  }
  Widget productContainerDetails(ProductsModel product)=>
      Container(
        // width: 218,
        // height: 275,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.kPrimaryColor, width: 1.0),
          borderRadius: BorderRadius.circular(20),
          //  color: Colors.red,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Column(children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image.network(
                  product.image,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CircleAvatar(
                    radius: 19,
                    backgroundColor: Colors.white,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border,
                          color: AppColors.kPrimaryColor,
                          size: 24,
                        )),
                  ),
                )
              ],
            ),
             Text(
              product.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: AppColors.descriptionColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
             Row(
              children: [
                Text(
                  'EGP ${product.price}',
                  style: const TextStyle(
                      color: AppColors.descriptionColor,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  ' ${product.discountPercentage} EGP',
                  style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: AppColors.kPrimaryColor),
                ),
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            Row(
              children: [
                 Text(
                  'Review (${product.rating})',
                  style: const TextStyle(
                      color: AppColors.descriptionColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
                const Icon(
                  FontAwesomeIcons.starOfLife,
                  color: Colors.yellow,
                  size: 20,
                ),
                // Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const CircleAvatar(
                      radius: 18,
                      backgroundColor: AppColors.kPrimaryColor,
                      child: Icon(Icons.add,
                          color: Colors.white, size: 27, weight: 20),
                    ))
              ],
            ),
          ]),
        ),
      );
}