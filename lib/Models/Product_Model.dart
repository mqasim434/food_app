class Product {
  String? imagePath;
  String? title;
  String? description;
  String? price;
  bool isPopular = false;
  bool isNewest = false;

  Product({
    this.imagePath,
    this.title,
    this.description,
    this.price,
  });

  Product.fromJson(Map<String, dynamic> json) {
    imagePath = json['imagePath'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imagePath'] = this.imagePath;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    return data;
  }
}

List<Product> products = [
  Product(
    imagePath: 'assets/images/burger.png',
    title: 'Hot Burger',
    description: 'Taste Hot Pizza at low price, this is famous pizza and you will love it. We hope after tasting it you will enjoy alot and will do wish to order every  time.',
    price: '10',
  ),
  Product(
    imagePath: 'assets/images/salan.png',
    title: 'Chicken Salan',
    description: 'Tasty Chicken Salan',
    price: '8',
  ),
  Product(
    imagePath: 'assets/images/pizza.png',
    title: 'Cheesy Pizza',
    description: 'Cheesy Pizza',
    price: '10',
  ),
  Product(
    imagePath: 'assets/images/burger.png',
    title: 'Hot Burger',
    description: 'Tasty Hot Burger',
    price: '10',
  ),
];

List<Product> favorites = [];

