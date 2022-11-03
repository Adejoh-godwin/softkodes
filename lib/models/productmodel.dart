class ProductModel {
  dynamic id, title, image, price;

  ProductModel({
    this.id,
    this.title,
    this.image,
    this.price,
  });

  static ProductModel fromJson(json) => ProductModel(
        id: json['id']['S'].toString(),
        image: json['image']['S'].toString(),
        title: json['title']['S'].toString(),
        price: json['price']['N'].toString(),
      );
}
