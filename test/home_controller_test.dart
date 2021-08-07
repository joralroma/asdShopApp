import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:get/instance_manager.dart';
import 'package:flutter_test/flutter_test.dart';

// Resource
import 'package:asdshop/app/resources/home_resource.dart';
import 'package:asdshop/app/resources/main_resource.dart';

// Models
import 'package:asdshop/app/models/user.dart';
import 'package:asdshop/app/models/error.dart';
import 'package:asdshop/app/models/product.dart';

// Controller
import 'package:asdshop/app/ui/home/home_controller.dart';

// Mock
import 'mocks/home_controller_test.mocks.dart';

@GenerateMocks([MainResource, HomeResource]) //new
void main() {

  final mainMock = MockMainResource();
  // final mainMock = MainResourceMock();
  final homeMock = MockHomeResource();

  BindingsBuilder(
    () {     
      Get.put<HomeController>(HomeController(mainMock, homeMock));
    }
  ).builder();

  final HomeController _homeController = Get.find<HomeController>();

  final List<Product> _products = [];
  final AsdError _error = AsdError('');
  final User _user = User('', 1, '', '', '', '');
  final Product _product = Product('', '', '', 0.0, 0, [], '', '');

  test('Get Data User fail', () async {

    when(mainMock.getDataUser()).thenAnswer((_) async => Future.value(Left(_error)) );

    final AsdError? error = await _homeController.getDataUser();

    expect(error, equals(_error));

  });
  test('Get Data User success', () async {

    when(mainMock.getDataUser()).thenAnswer((_) async => Future.value(Right(_user)) );

    final AsdError? error = await _homeController.getDataUser();

    expect(error, isNull);

  });
  test('Get List Products fail', () async {

    when(homeMock.getListProducts()).thenAnswer((_) async => Future.value(Left(_error)) );

    final AsdError? error = await _homeController.getListPrducts();

    expect(error, equals(_error));

  });
  
  test('Get List Products success', () async {

    when(homeMock.getListProducts()).thenAnswer((_) async => Future.value(Right(_products)) );

    final AsdError? error = await _homeController.getListPrducts();

    expect(error, isNull);

  });
  
  test('Save shopping fail', () async {

    when(homeMock.saveShopping(any)).thenAnswer((_) async => Future.value(Left(_error)) );

    final AsdError? error = await _homeController.saveShopping({}, _product);

    expect(error, equals(_error));

  });
  
  test('Save shopping success', () async {

    when(homeMock.saveShopping(any)).thenAnswer((_) async => Future.value(Right('')) );

    final AsdError? error = await _homeController.saveShopping({}, _product);

    expect(error, isNull);

  });

}
