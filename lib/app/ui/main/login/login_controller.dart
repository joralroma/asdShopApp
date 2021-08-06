import 'package:get/get.dart';
import 'package:dartz/dartz.dart';

// Models
import 'package:asdshop/app/models/input.dart';
import 'package:asdshop/app/models/error.dart';

// Storage
import 'package:asdshop/app/store/store.dart';

// Resources
import 'package:asdshop/app/resources/main_resource.dart';

// Utils
import 'package:asdshop/app/utils/extencions.dart';

class LoginController extends GetxController {

  final MainResource _mainResource;

  LoginController(this._mainResource);

  final InputModel username = InputModel();
  final InputModel password = InputModel(isSecure: true);

  final AsdStore store = Get.find<AsdStore>();

  @override
  void onClose() {
    username.dispose();
    password.dispose();
    super.onClose();
  }

  bool get verifyForm => ( username.text.valid && password.text.valid );

  Future<String> doLogin() async {
    String _error = '';
    final Map<String, String> _data = { 'email': username.text, 'password': password.text };
    Either<AsdError, String> _result = await _mainResource.login(_data);
    _result.fold(
      (l) => _error = l.message,
      (r) async => await store.setToken(r)
    );
    return _error;
  }





}