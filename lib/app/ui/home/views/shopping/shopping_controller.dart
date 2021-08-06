import 'dart:developer';

import 'package:get/get.dart';
import 'package:dartz/dartz.dart';

// Models
import 'package:asdshop/app/models/error.dart';
import 'package:asdshop/app/models/shopping.dart';

// Store
import 'package:asdshop/app/store/data.dart';

// Resource
import 'package:asdshop/app/resources/home_resource.dart';

// Utils
import 'package:asdshop/app/utils/extencions.dart';

class ShoppingController extends GetxController {

  final HomeResource _homeResource;

  ShoppingController(this._homeResource);

  final RxBool _readyView = RxBool(false);

  bool get readyView => _readyView.value;
  set readyView(bool value) => _readyView.value = value;  

  final AsdData data = AsdData.instance;

  Future<AsdError?> getListPurchase() async {
    AsdError? error;
    if(data.shopping.isNull) {
      final Either<AsdError, List<Shopping>> result = await _homeResource.getListPurchase();
      result.fold(
        (l) => error = l,
        (r) => _doSuccessGetListPurchase(r)
      );
    } else {
      readyView = true;  
    }
    return error;
  }

  void _doSuccessGetListPurchase(List<Shopping> list) {
    data.shopping = list;
    readyView = true;
  }

}