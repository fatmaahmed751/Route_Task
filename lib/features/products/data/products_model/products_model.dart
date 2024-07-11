class ProductsModel{
  final String image;
  final String description;
  final double price;
  final double discountPercentage;
  final double rating;

  ProductsModel({
  required this.image,
      required this.description,
      required this.price,
      required this.discountPercentage,
      required this.rating,
      });

  factory ProductsModel.fromJson(Map<String,dynamic> json )=>
    ProductsModel(
      image :json['image'],
        description :json['description'],
      price :json['price'],
        discountPercentage :json['discountPercentage'],
        rating :json['rating'],

    );

}