import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:route_task/core/utils/styles.dart';
import 'package:route_task/features/products/presentation/manager/cubit/product_states.dart';

import '../../../../core/utils/constants.dart';
import '../../data/products_model/products_model.dart';
import '../manager/cubit/product_cubit.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsStates>(
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
                itemCount: state.products.length),
          ),
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }

  Widget productContainerDetails(ProductsModel product) => Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.kPrimaryColor, width: 1.0),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Column(children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: Image.network(
                    product.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(blurRadius: 4),
                        ],
                        color: Colors.white),
                    child: const Icon(
                      Icons.favorite_border,
                      color: AppColors.kPrimaryColor,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              product.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Styles.descriptionStyle,
            ),
            Expanded(
              child: Row(
                children: [
                  Text('EGP ${product.price}', style: Styles.descriptionStyle),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '${product.discountPercentage} EGP',
                    style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: AppColors.kPrimaryColor),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text('Review(${product.rating})',
                    style: Styles.productsInfoStyle),
                const Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.yellow,
                  size: 20,
                  weight: 20,
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(right: 5.0),
                  child: CircleAvatar(
                    radius: 17,
                    backgroundColor: AppColors.kPrimaryColor,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            )
          ]),
        ),
      );
}
