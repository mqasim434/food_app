import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/widgets/AppBarWidget.dart';
import 'package:food_app/widgets/CategoryWidget.dart';
import 'package:food_app/widgets/DrawerWidget.dart';
import 'package:food_app/widgets/NewestItemWidget.dart';
import 'package:food_app/widgets/PopularItemWidget.dart';
import 'package:food_app/Models/Product_Model.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          //Custom App Bar widget
          AppBarWidget(),
          //search
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.search,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 250,
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "What would you like to eat?",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const Icon(Icons.filter_list),
                  ],
                ),
              ),
            ),
          ),

          //Category
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 10),
            child: Text(
              "Categories",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          //Category Widget
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  CategoryWidget(
                    imagePath: 'assets/images/burger.png',
                  ),
                  CategoryWidget(
                    imagePath: 'assets/images/pizza.png',
                  ),
                  CategoryWidget(
                    imagePath: 'assets/images/biryani.png',
                  ),
                  CategoryWidget(
                    imagePath: 'assets/images/spagheti.png',
                  ),
                  CategoryWidget(
                    imagePath: 'assets/images/steakk.png',
                  ),
                  CategoryWidget(
                    imagePath: 'assets/images/sushi.png',
                  ),
                ],
              ),
            ),
          ),

          //Popular Items
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 10),
            child: Text(
              "Popular",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),

          // Popular Items
          SizedBox(
            height: 260,
            child: ListView.builder(
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return PopularItemWidget(
                  imagePath: products[index].imagePath.toString(),
                  title: products[index].title.toString(),
                  description: products[index].description.toString(),
                  price: products[index].price.toString(),
                );
              },
            ),
          ),

          // Newest Items
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 10),
            child: Text(
              "Newest",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),

          //Newest Items Widget
          Expanded(
            flex: 1,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return NewestItemWidget(
                  imagePath: products[index].imagePath.toString(),
                  title: products[index].title.toString(),
                  description: products[index].description.toString(),
                  price: products[index].price.toString(),
                );
              },
            ),
          ),
        ],
      ),
      drawer: DrawerWidget(),
      floatingActionButton: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ]),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "CartPage");
          },
          backgroundColor: Colors.white,
          child: const Icon(
            CupertinoIcons.cart,
            size: 28,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
