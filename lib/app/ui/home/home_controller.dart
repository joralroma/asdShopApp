import 'dart:convert';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';

// Store
import 'package:asdshop/app/store/data.dart';
import 'package:asdshop/app/store/socket.dart';

// Models
import 'package:asdshop/app/models/user.dart';
import 'package:asdshop/app/models/error.dart';
import 'package:asdshop/app/models/input.dart';
import 'package:asdshop/app/models/product.dart';
import 'package:asdshop/app/models/shopping.dart';

// Resource
import 'package:asdshop/app/resources/main_resource.dart';
import 'package:asdshop/app/resources/home_resource.dart';

class HomeController extends GetxController {

  final MainResource _mainResource;
  final HomeResource _homeResource;

  HomeController(this._mainResource, this._homeResource);

  final AsdData data = AsdData.instance;

  final RxInt _currentIndex = RxInt(0);
  final RxBool _readyView = RxBool(false);

  final RxList<Product> _products = RxList([]);

  final InputModel search = InputModel();

  final AsdSocket _asdSocket = AsdSocket();

  @override
  void onInit() {
    _initSocket();
    search.onChange(_onChangeSearch);
    super.onInit();
  }

  @override
  void onClose() {
    _currentIndex.close();
    _readyView.close();
    _products.close();
    super.onClose();
  }

  int get currentIndex => _currentIndex.value;
  set currentIndex(int value) => _currentIndex.value = value;

  bool get readyView => _readyView.value;
  set readyView(bool value) => _readyView.value = value;

  List<Product> get products => _products.value;
  set products(List<Product> value) => _products.value = value;

  void setPage(int index) {
    if(readyView && currentIndex != index) {
      currentIndex = index;
    }
  }

  void _onChangeSearch() {
    _products.addAll([]);
  }

  bool filter(Product p) {
    return p.name.toLowerCase().contains(search.text.toLowerCase());
  }

  Future<AsdError?> getDataUser() async {
    AsdError? _error;
    final Either<AsdError, User> result = await _mainResource.getDataUser();
    result.fold(
      (l) => _error = l,
      (r) => data.user = r
    );    
    return _error;
  }

  Future<AsdError?> getListPrducts() async {
    AsdError? _error;
    final Either<AsdError, List<Product>> result = await _homeResource.getListProducts();
    result.fold(
      (l) => _error = l,
      (r) => _doSuccessGetListProducts(r)
    );    
    return _error;
  }

  void _doSuccessGetListProducts(List<Product> products) {
    this.products = products;
    readyView = true;
  }

  Future<AsdError?> saveShopping(Map<String, dynamic> body, Product product) async {
    AsdError? _error;
    final Either<AsdError, String> result = await _homeResource.saveShopping(body);
    result.fold(
      (l) => _error = l,
      (r) => _doSaveShopping(r, product)
    );
    return _error;
  }

  void _doSaveShopping(String id, Product product) {
    final Shopping _shopping = Shopping(
      id,
      '',
      product,
      product.price,
      DateTime.now().toString()
    );
    if(data.shopping != null) {
      data.shopping!.add(_shopping);
    }
  }


  void _initSocket() {
    _asdSocket.initState();
    _asdSocket.onListenerEvent('newProduct', _newProductEvent);
  }

  void _newProductEvent(dynamic data) {
    final Product _product = Product.fromJson(json.decode(json.encode(data)));
    _products.add(_product);
  }

}