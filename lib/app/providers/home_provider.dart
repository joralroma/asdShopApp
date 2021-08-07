import 'dart:convert';
import 'package:asdshop/app/models/category.dart';
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
      print('eeee $e');
      return Left(AsdError(error));
    }
  }

  @override
  Future<Either<AsdError, List<Shopping>>> getListShopping() async {
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


  @override
  Future<Either<AsdError, List<Category>>> getListCategory() async {
    String error = 'Error al traer las compras.';
    try {
      final response = await _http.httpGet('category/getAllCategories');
      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        final List<Category> categories = Category.fromJsonList(data['categories']);
        return Right(categories);
      } else {
        error = data?['message'] ?? error;
        return Left(AsdError(error));
      }      
    } catch (e) {
      return Left(AsdError(error));
    }
  }

  @override
  Future<Either<AsdError, String>> saveShopping(Map<String, dynamic> body) async {
    String error = 'Error al crear la compra.';
    try {
      final response = await _http.httpPost('shopping/saveShopping', body);
      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        final String _id = data['shopping']['_id'];
        return Right(_id);
      } else {
        error = data?['message'] ?? error;
        return Left(AsdError(error));
      }      
    } catch (e) {
      return Left(AsdError(error));
    }
  }

  @override
  Future<Either<AsdError, String>> saveProduct(Map<String, dynamic> body) async {
    String error = 'Error al crear el producto.';
    try {
      final response = await _http.httpPost('product/saveProduct', body);
      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        final String _id = data['product']['_id'];
        return Right(_id);
      } else {
        error = data?['message'] ?? error;
        return Left(AsdError(error));
      }      
    } catch (e) {
      return Left(AsdError(error));
    }
  }

}