import 'package:flutter/material.dart';
import 'package:food_app/Models/Product_Model.dart';
import 'package:food_app/Widgets/NewestItemWidget.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
        centerTitle: true,
      ),
      body: favorites.isEmpty
          ? const Center(
              child: Text('No Favorite Item'),
            )
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return NewestItemWidget(
                  imagePath: favorites[index].imagePath.toString(),
                  title: favorites[index].title.toString(),
                  description: favorites[index].description.toString(),
                  price: favorites[index].price.toString(),
                );
              },
            ),
    );
  }
}
