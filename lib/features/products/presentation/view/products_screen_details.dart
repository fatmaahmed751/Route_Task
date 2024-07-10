
import 'package:flutter/material.dart';
import '../widgets/grid_view_widget.dart';
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
      body: const Padding(
        padding: EdgeInsets.only(left: 5.0,right: 5),
        child: Column(
          children: [
            SearchBarWidget(),
            GridViewWidget()
          ],
        ),
      ),
    );
  }

}
