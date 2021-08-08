import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:get/instance_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

// Store
import 'package:asdshop/app/store/data.dart';

// Models
import 'package:asdshop/app/models/user.dart';
import 'package:asdshop/app/models/error.dart';
import 'package:asdshop/app/models/product.dart';

// Controller
import 'package:asdshop/app/ui/home/home_controller.dart';
import 'package:asdshop/app/ui/home/views/business/business_controller.dart';

// Mocks
import 'mocks/resource_mocks.dart';

void main() {

  final mainMock = MockMainResource();
  final homeMock = MockHomeResource();

  final AsdError _error = AsdError('');
  final User _user = User('', 1, '', '', '', '');
  final Product _product = Product('', '', '', 0.0, 0, [], '', '');

  final AsdData data = AsdData.instance;

  data.user = _user;  

  BindingsBuilder(
    () {     
      Get.put<HomeController>(HomeController(mainMock, homeMock));
      Get.put<BusinessController>(BusinessController(homeMock));
    }
  ).builder();

  final BusinessController _businessController = Get.find<BusinessController>();

  test('Get list categories fail', () async {

    when(homeMock.getListCategory()).thenAnswer((_) async => Future.value(Left(_error)) );

    final AsdError? error = await _businessController.getListCategory();

    expect(error, equals(_error));

    expect(_businessController.readyView, isFalse);

  });

  test('Get list categories success', () async {

    when(homeMock.getListCategory()).thenAnswer((_) async => Future.value(Right([])) );

    final AsdError? error = await _businessController.getListCategory();

    expect(error, isNull);

    expect(_businessController.readyView, isTrue);

  });

  test('Add or remove urls from product images', () {

    expect(_businessController.imgs, isEmpty);

    _businessController.toggleUrl('url-example');

    expect(_businessController.imgs, isNotEmpty);

    _businessController.toggleUrl('url-example');

    expect(_businessController.imgs, isEmpty);

  });

  test('Save product fail', () async {

    when(homeMock.saveProduct(any)).thenAnswer((_) async => Future.value(Left(_error)) );

    _businessController.name.text = 'name';
    _businessController.stock.text = '1';
    _businessController.price.text = '2,0';
    _businessController.description.text = 'description';
    _businessController.imgs = ['url-example'];

    final AsdError? error = await _businessController.saveProduct();

    expect(error, equals(_error));

  });

  test('Save product success', () async {

    when(homeMock.saveProduct(any)).thenAnswer((_) async => Future.value(Right(_product)) );

    _businessController.name.text = 'name';
    _businessController.stock.text = '1';
    _businessController.price.text = '2,0';
    _businessController.description.text = 'description';
    _businessController.imgs = ['url-example'];

    final AsdError? error = await _businessController.saveProduct();

    expect(error, isNull);
  
    expect(_businessController.products, isNotEmpty);

    expect(_businessController.name.text, equals(''));

    expect(_businessController.stock.text, equals(''));

    expect(_businessController.price.text, equals(''));

    expect(_businessController.description.text, equals(''));

    expect(_businessController.imgs, isEmpty);

  });

}