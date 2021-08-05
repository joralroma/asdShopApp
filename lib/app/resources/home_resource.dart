import 'package:dartz/dartz.dart';

// Models
import 'package:asdshop/app/models/error.dart';
import 'package:asdshop/app/models/product.dart';

abstract class HomeResource {
  
  Future<Either<AsdError, List<Product>>> getListProducts(String url);

}