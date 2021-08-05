// Models
import 'package:asdshop/app/models/user.dart';

class AsdData {

  static final AsdData _singleton = new AsdData._internal();
  AsdData._internal();
  static AsdData get instance => _singleton;

  User? user;

}