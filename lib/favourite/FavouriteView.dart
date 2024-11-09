import 'package:flutter/material.dart';
import 'package:ok/Cart/TopAppBarCart.dart';

import '../AppColors.dart';

class FavouriteHome extends StatelessWidget {
  const FavouriteHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColor.primaryColor),
        backgroundColor: Colors.grey[50],
        title: const Text('My Favourite',style: TextStyle(
          color: AppColor.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),),
        centerTitle: true,
        elevation: 0,
      ),

    );
  }
}
