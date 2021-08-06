import 'package:asdshop/app/models/user.dart';
import 'package:dartz/dartz.dart';

// Models
import 'package:asdshop/app/models/error.dart';

abstract class MainResource {
  
  Future<Either<AsdError, String>> login(Map<String, dynamic> body);
  
  Future<Either<AsdError, String>> register(Map<String, dynamic> body);

  Future<Either<AsdError, User>> getDataUser();


}