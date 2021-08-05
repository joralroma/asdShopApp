import 'dart:convert';
import 'dart:developer';
import 'package:asdshop/app/models/product.dart';
import 'package:dartz/dartz.dart';

// Models
import 'package:asdshop/app/models/error.dart';

// Resource
import 'package:asdshop/app/resources/http_resource.dart';
import 'package:asdshop/app/resources/home_resource.dart';

class HomeProvider implements HomeResource {

  final HttpResource _http;

  HomeProvider(this._http);

  @override
  Future<Either<AsdError, List<Product>>> getListProducts(String url) async {
    String error = 'Error al traer los productos.';
    try {
      final response = await _http.httpGet(url);
      final data = json.decode(response.body);
      inspect(data);
      if (response.statusCode == 200) {
        final List<Product> products = Product.fromJsonList(data['products']);
        return Right(products);
      } else {
        error = data?['message'] ?? error;
        return Left(AsdError(error));
      }      
    } catch (e) {
      print('eeee $e');
      return Left(AsdError(error));
    }
  }

}