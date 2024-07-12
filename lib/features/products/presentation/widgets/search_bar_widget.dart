import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:route_task/features/products/presentation/manager/cubit/product_cubit.dart';
import 'package:route_task/features/products/presentation/manager/cubit/product_states.dart';

import '../../../../core/constants.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return BlocConsumer<ProductsCubit, ProductsStates>(
      builder: (BuildContext context, ProductsStates state) {
        return Row(
          children: [
            SizedBox(
              height: 50,
              width: 300,
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: searchController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  hintText: 'what do you search for ?',
                  hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: AppColors.descriptionColor),
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.magnifyingGlass,
                      size: 21,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                        width: 7.0, color: AppColors.kPrimaryColor),
                  ),
                ),
                // cursorColor: AppColors.grey,
                onFieldSubmitted: (String value) {

                  print(value);
                  searchController.clear();

                    ProductsCubit.get(context).fetchProductsData(value);

                },
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColors.kPrimaryColor,
                )),
          ],
        );
      },
      listener: (BuildContext context, ProductsStates state) {},
    );
  }
}
