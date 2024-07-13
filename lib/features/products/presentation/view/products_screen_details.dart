
import 'package:flutter/material.dart';
import '../widgets/grid_view_widget.dart';
import '../widgets/search_bar_widget.dart';

class ProductsScreenDetails extends StatelessWidget {
  const ProductsScreenDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.only(left: 5.0,right: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height:45,),
            SizedBox(
                width:100,
                child: Image.asset(
                  'assets/images/logo_app-removebg-preview.png',
                  fit:BoxFit.cover,
                  alignment: Alignment.topLeft,
                ),
              ),
            const SizedBox(height: 10,),
            const SearchBarWidget(),
            const GridViewWidget(),
          ],
        ),
      ),
    );
  }

}
