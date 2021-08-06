import 'dart:convert';
import 'package:dartz/dartz.dart';

// Store
import 'package:asdshop/app/store/data.dart';

// Models
import 'package:asdshop/app/models/user.dart';
import 'package:asdshop/app/models/error.dart';

// Resource
import 'package:asdshop/app/resources/http_resource.dart';
import 'package:asdshop/app/resources/main_resource.dart';

class MainProvider implements MainResource {

  final HttpResource _http;

  MainProvider(this._http);

  @override
  Future<Either<AsdError, String>> login(Map<String, dynamic> body) async {
    String error = 'Error en el login.';
    try {
      final response = await _http.httpPost('user/login', body);
      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        final AsdData _data = AsdData.instance;
        final User _user = User.fromJson(data['user']);
        _data.user = _user;
        return Right(data['token']);
      } else {
        error = data?['message'] ?? error;
        return Left(AsdError(error));
      }      
    } catch (e) {
      return Left(AsdError(error));
    }
  }


  @override
  Future<Either<AsdError, String>> register(Map<String, dynamic> body) async{
    String error = 'Error en el registro.';
    try {
      final response = await _http.httpPost('user/registerUser', body);
      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        final AsdData _data = AsdData.instance;
        final User _user = User.fromJson(data['user']);
        _data.user = _user;
        return Right(data['token']);
      } else {
        error = data?['message'] ?? error;
        return Left(AsdError(error));
      }      
    } catch (e) {
      return Left(AsdError(error));
    }
  }


  @override
  Future<Either<AsdError, User>> getDataUser() async {
    String error = 'Error al traer la información del usuario.';
    try {
      final response = await _http.httpGet('user/getDataUser');
      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        final AsdData _data = AsdData.instance;
        final User _user = User.fromJson(data['user']);
        _data.user = _user;
        return Right(_user);
      } else {
        error = data?['message'] ?? error;
        return Left(AsdError(error));
      }      
    } catch (e) {
      return Left(AsdError(error));
    }
  }
}