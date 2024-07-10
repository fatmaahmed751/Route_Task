import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/constants.dart';
import '../widgets/search_bar_widget.dart';

class ProductsScreenDetails extends StatelessWidget {
  const ProductsScreenDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'assets/images/routeacademy_logo-removebg-preview.png',
          color: Colors.blue[800]!.withOpacity(0.9),
          //  width:MediaQuery.sizeOf(context).width,
          // height: 400,
          // fit:BoxFit.cover,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5.0,right: 5),
        child: Column(
          children: [
            const SearchBarWidget(),
            Expanded(
                child: SizedBox(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                  childAspectRatio: 3/4.9,
                      mainAxisSpacing:17.0,
                      crossAxisSpacing:7.0,
                    ),
                    itemBuilder: (context, index) =>
                      productContainerDetails(),

                    itemCount: 6,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
  Widget productContainerDetails()=>
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
              'https://i.pinimg.com/564x/72/d9/f4/72d9f40d08fa48d16e29ee1abcb8c901.jpg',
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
        const Text(
          'Nike Shoes with\nred colors and black flexible for woman',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: AppColors.descriptionColor,
              fontSize: 14,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 10,
        ),
        const Row(
          children: [
            Text(
              'EGP 1,200',
              style: TextStyle(
                  color: AppColors.descriptionColor,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              '1,200 EGP',
              style: TextStyle(
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
            const Text(
              'Review (4.6)',
              style: TextStyle(
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
