import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.red),
              accountName: Text(
                "G3 Mad Project",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text("mad@uog.com",
                  style: TextStyle(
                    fontSize: 20,
                  )),
              currentAccountPicture: CircleAvatar(
                radius: 5,
                backgroundImage: AssetImage(
                  "AssetImage/girl.png",
                ),
              ),
            ),
          ),

          //list Tile
          InkWell(
            onTap: (){
              Navigator.pushNamed(context,'/');
            },
            child: const ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.red,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context,'AddProduct');
            },
            child: const ListTile(
              leading: Icon(
                CupertinoIcons.add,
                color: Colors.red,
              ),
              title: Text(
                "Add Product",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.person,
              color: Colors.red,
            ),
            title: Text(
              "My Account",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          //list Tile
          const ListTile(
            leading: Icon(
              CupertinoIcons.cart_fill,
              color: Colors.red,
            ),
            title: Text(
              "My Orders",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          //list Tile
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, 'Wishlist');
            },
            child: const ListTile(
              leading: Icon(
                CupertinoIcons.heart_fill,
                color: Colors.red,
              ),
              title: Text(
                "My WishList",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          //list Tile
          const ListTile(
            leading: Icon(
              CupertinoIcons.settings,
              color: Colors.red,
            ),
            title: Text(
              "My Settings",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          //list Tile
          const ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.red,
            ),
            title: Text(
              "Log Out",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
