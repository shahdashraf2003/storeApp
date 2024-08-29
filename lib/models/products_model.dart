class ProductsModel {
  final dynamic id;
  final String title;
  final dynamic price;
  final String category;
  final String image;
  final String description;
  final RatingModel? rating;

  ProductsModel({
    required this.title,
    required this.price,
    required this.category,
    required this.image,
    required this.description,
    required this.id,
    required this.rating,
  });

  factory ProductsModel.fromJson(json) {
    return ProductsModel(
      title: json['title'],
      price: json['price'],
      category: json['category'],
      image: json['image'],
      description: json['description'],
      id: json['id'],
      rating:
          json['rating'] == null ? null : RatingModel.fromJson(json['rating']),
    );
  }
}

class RatingModel {
  final num rate;
  final num count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(json) {
    return RatingModel(
      rate: json['rate'],
      count: json['count'],
    );
  }
}
