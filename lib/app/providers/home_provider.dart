import 'dart:convert';
import 'package:dartz/dartz.dart';

// Models
import 'package:asdshop/app/models/error.dart';
import 'package:asdshop/app/models/product.dart';
import 'package:asdshop/app/models/shopping.dart';

// Resource
import 'package:asdshop/app/resources/http_resource.dart';
import 'package:asdshop/app/resources/home_resource.dart';

class HomeProvider implements HomeResource {

  final HttpResource _http;

  HomeProvider(this._http);

  @override
  Future<Either<AsdError, List<Product>>> getListProducts() async {
    String error = 'Error al traer los productos.';
    try {
      final response = await _http.httpGet('product/getAllProduts');
      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        final List<Product> products = Product.fromJsonList(data['products']);
        return Right(products);
      } else {
        error = data?['message'] ?? error;
        return Left(AsdError(error));
      }      
    } catch (e) {
      return Left(AsdError(error));
    }
  }

  @override
  Future<Either<AsdError, List<Shopping>>> getListPurchase() async {
    String error = 'Error al traer las compras.';
    try {
      final response = await _http.httpGet('shopping/getAllShopping');
      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        final List<Shopping> shopping = Shopping.fromJsonList(data['shopping']);
        return Right(shopping);
      } else {
        error = data?['message'] ?? error;
        return Left(AsdError(error));
      }      
    } catch (e) {
      return Left(AsdError(error));
    }
  }

}