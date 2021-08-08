import 'package:get/get.dart';
import 'package:dartz/dartz.dart';

// Store
import 'package:asdshop/app/store/store.dart';

// Models
import 'package:asdshop/app/models/error.dart';
import 'package:asdshop/app/models/input.dart';

// Resource
import 'package:asdshop/app/resources/main_resource.dart';

// Utils
import 'package:asdshop/app/utils/extencions.dart';

class RegisterController extends GetxController {

  final MainResource _mainResource;

  RegisterController(this._mainResource);

  final InputModel name = InputModel();
  final InputModel lastName = InputModel();
  final InputModel username = InputModel();
  final InputModel password = InputModel(isSecure: true);

  final RxInt role = RxInt(2);

  final AsdStore store = Get.find<AsdStore>();

  bool get verifyForm => ( name.text.valid && lastName.text.valid && username.text.valid && password.text.valid );

  @override
  void onClose() {
    name.dispose();
    lastName.dispose();
    username.dispose();
    password.dispose();
    super.onClose();
  }


  Future<AsdError?> doRegister() async {
    AsdError? _error;
    final Map<String, dynamic> _data = { 'name': name.text, 'lastName': lastName.text, 'email': username.text, 'password': password.text, 'role': role.value };
    Either<AsdError, String> _result = await _mainResource.register(_data);
    _result.fold(
      (l) => _error = l,
      (r) async => await store.setToken(r)
    );
    return _error;
  }

}