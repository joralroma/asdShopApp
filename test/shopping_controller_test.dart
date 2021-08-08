import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:get/instance_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

// Store
import 'package:asdshop/app/store/data.dart';

// Models
import 'package:asdshop/app/models/error.dart';

// Resource
import 'package:asdshop/app/resources/home_resource.dart';
import 'package:asdshop/app/resources/main_resource.dart';

// Controller
import 'package:asdshop/app/ui/home/views/shopping/shopping_controller.dart';

// Mocks
import 'mocks/resource_mocks.dart';

@GenerateMocks([MainResource, HomeResource])
void main() {

  final homeMock = MockHomeResource();

  final AsdError _error = AsdError('');

  final AsdData data = AsdData.instance;

  BindingsBuilder(
    () {     
      Get.put<ShoppingController>(ShoppingController(homeMock));
    }
  ).builder();

  final ShoppingController _shoppingController = Get.find<ShoppingController>();

  test('Get list Shopping fail', () async {

    when(homeMock.getListShopping()).thenAnswer((_) async => Future.value(Left(_error)) );

    final AsdError? error = await _shoppingController.getListPurchase();

    expect(error, equals(_error));

    expect(_shoppingController.readyView, isFalse);

    expect(data.shopping, isNull);

  });

  test('Get list Shopping success', () async {

    when(homeMock.getListShopping()).thenAnswer((_) async => Future.value(Right([])) );

    final AsdError? error = await _shoppingController.getListPurchase();

    expect(error, isNull);

    expect(_shoppingController.readyView, isTrue);

    expect(data.shopping, isNotNull);

  });

}