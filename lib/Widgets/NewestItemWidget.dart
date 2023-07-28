import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class NewestItemWidget extends StatefulWidget {
  NewestItemWidget(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.description,
      required this.price});

  String imagePath;
  String title;
  String description;
  String price;

  @override
  State<NewestItemWidget> createState() => _NewestItemWidgetState();
}

class _NewestItemWidgetState extends State<NewestItemWidget> {
  int? stars;

  bool isFavt = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: 350,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(3, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "ItemPageSTEAK");
              },
              child: Image.asset(
                widget.imagePath,
                height: 120,
                width: 120,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Hello",
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 16,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  RatingBar.builder(
                    initialRating: 4,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemSize: 18,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.red,
                    ),
                    onRatingUpdate: (index) {},
                  ),
                  Text(
                    "\$${widget.price}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (isFavt == false) {
                          isFavt = true;
                        } else {
                          isFavt = false;
                        }
                      });
                    },
                    child: Icon(
                      isFavt ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                      size: 26,
                    ),
                  ),
                  const Icon(
                    CupertinoIcons.cart,
                    color: Colors.red,
                    size: 26,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
