import 'package:flutter/material.dart';
import 'package:food_app/pages/ItemDetailsPage.dart';
import 'package:food_app/Models/Product_Model.dart';

class PopularItemWidget extends StatefulWidget {
  String imagePath;
  String title;
  String description;
  String price;

  PopularItemWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  State<PopularItemWidget> createState() => _PopularItemWidgetState();
}

class _PopularItemWidgetState extends State<PopularItemWidget> {
  bool isFavt = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: Container(
            width: 170,
            height: 225,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return ItemDetailsPage(
                            imagePath: widget.imagePath,
                            title: widget.title,
                            description: widget.description,
                            price: widget.price,
                          );
                        }),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        widget.imagePath,
                        height: 130,
                      ),
                    ),
                  ),
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.description,
                    style: const TextStyle(
                      fontSize: 15,
                      //fontWeight: FontWeight.bold,
                    ),
                    softWrap: false,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${widget.price}",
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (isFavt == false) {
                              isFavt = true;
                              favorites.add(
                                Product(
                                  imagePath: widget.imagePath,
                                  title: widget.title,
                                  description: widget.description,
                                  price: widget.price,
                                ),
                              );
                            } else {
                              isFavt = false;
                            }
                          });
                        },
                        child: Icon(
                          isFavt == true
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                          size: 26,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
