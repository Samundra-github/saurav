class Product {
  int id;
  String name;
  double cost;
  double price;
  int quantity;
  String image;
  List<dynamic>? gallery;
  String category;
  String? description;
  int catId;
  List<String> reviews;

  Product({
    required this.id,
    required this.name,
    required this.cost,
    required this.price,
    required this.quantity,
    required this.image,
    this.gallery,
    required this.category,
    this.description,
    required this.catId,
    this.reviews = const [],
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      cost: json['cost'].toDouble(),
      price: json['price'].toDouble(),
      quantity: json['quantity'],
      image: json['image'],
      gallery: json['gallery'],
      category: json['category']['name'],
      catId: json['category']['id'],
      description: json['description'],
    );
  }
}
