import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/constants.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
          return Row(
            children: [
              SizedBox(
                height: 50,
               width: 300,
                child: TextFormField(

                  keyboardType: TextInputType.text,
                  controller: searchController,
                  decoration: InputDecoration(
                    contentPadding:const EdgeInsets.all(10),
                    hintText: 'what do you search for ?',
                    hintStyle: const TextStyle(
                        fontSize:16,
                        fontWeight: FontWeight.w300,
                        color: AppColors.descriptionColor),


                    prefixIcon: IconButton(
                      onPressed: () {
                      },
                      icon:  const Icon(
                        FontAwesomeIcons.magnifyingGlass,
                        size: 21,
                        color: AppColors.kPrimaryColor,

                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),

                       borderSide: const BorderSide(width: 7.0, color: AppColors.kPrimaryColor),

                    ),


                  ),
                  // cursorColor: AppColors.grey,
                  onFieldSubmitted: (String value) {

                    print(value);
                    searchController.clear();

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
        }


}