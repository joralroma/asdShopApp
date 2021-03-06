// Models
import 'package:asdshop/app/models/product.dart';

class Shopping {

  final String id;
  final String user;
  final Product? product;
  final double total;
  final String createdAt;

  Shopping(
    this.id,
    this.user,
    this.product,
    this.total,
    this.createdAt
  );

  static Shopping fromJson(json) {
    Shopping shopping = new Shopping(
      json['_id'],
      json['user'],
      (json['product'] != null) ? Product.fromJson(json['product']) : null,
      double.parse('${json['total']}'),
      json['createdAt'],
    );
    return shopping;
  }

  static List<Shopping> fromJsonList(Iterable data) {
    List<Shopping> list = [];
    for (var e in data) list.add(fromJson(e));
    return list;
  }

}