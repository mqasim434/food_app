import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {

  AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFBE4037), // Set the color here
          borderRadius: BorderRadius.circular(10.0), // Set the radius here
        ),
        height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(CupertinoIcons.bars),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text("HOME"),
                    ),
                    InkWell(
                      onTap: () {
                        // Add the action for the "My Current Location" button here
                     // Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> GetUserCurrentLocationScreen()));

                      },
                        child: Text(
                          'My Current Location',
                          // Text for the button
                          style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.notifications),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





