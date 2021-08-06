import 'dart:developer';

class Product {

  final String id;
  final String name;
  final String description;
  final double price;
  final int stock;
  final List<String> imgs;

  Product(
    this.id,
    this.name,
    this.description,
    this.price,
    this.stock,
    this.imgs,
  );

  static Product fromJson(json) {
    Product product = new Product(
      json['_id'],
      json['name'],
      json['description'],
      json['price'],
      json['stock'],
      json['imgs'].map<String>((e) => '$e').toList(),
    );
    return product;
  }

  static List<Product> fromJsonList(Iterable data) {
    inspect(data);
    List<Product> list = [];
    for (var e in data) list.add(fromJson(e));
    return list;
  }

}