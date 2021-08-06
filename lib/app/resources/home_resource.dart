import 'package:dartz/dartz.dart';

// Models
import 'package:asdshop/app/models/error.dart';
import 'package:asdshop/app/models/product.dart';
import 'package:asdshop/app/models/shopping.dart';

abstract class HomeResource {
  
  Future<Either<AsdError, List<Product>>> getListProducts();
  Future<Either<AsdError, List<Shopping>>> getListShopping();
  Future<Either<AsdError, String>> saveShopping(Map<String, dynamic> body);

}