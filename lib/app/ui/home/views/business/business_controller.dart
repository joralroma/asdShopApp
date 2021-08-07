import 'package:get/get.dart';
import 'package:dartz/dartz.dart';

// Store
import 'package:asdshop/app/store/data.dart';

// Models
import 'package:asdshop/app/models/input.dart';
import 'package:asdshop/app/models/error.dart';
import 'package:asdshop/app/models/product.dart';
import 'package:asdshop/app/models/category.dart';

// Controller
import 'package:asdshop/app/ui/home/home_controller.dart';

// Resource
import 'package:asdshop/app/resources/home_resource.dart';

// Utils
import 'package:asdshop/app/utils/extencions.dart';

class BusinessController extends GetxController {

  final HomeResource _homeResource;

  BusinessController(this._homeResource);

  final HomeController _homeController = Get.find<HomeController>();

  final AsdData data = AsdData.instance;

  final RxBool _readyView = RxBool(false);

  final RxList<Product> _products = RxList([]);

  final InputModel name = InputModel();
  final InputModel description = InputModel();
  final InputModel stock = InputModel();
  final InputModel price = InputModel();

  final Rx<Category> category = Rx<Category>(Category('', ''));

  List<String> imgs = [];

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  @override
  void onClose() {
    category.close();
    _products.close();
    name.dispose();
    description.dispose();
    stock.dispose();
    price.dispose();
    super.onClose();
  }

  bool get readyView => _readyView.value;
  set readyView(bool value) => _readyView.value = value;

  List<Product> get products => _products.value;
  set products(List<Product> value) => _products.value = value;

  bool get verifyForm => (
    name.text.valid &&
    description.text.valid &&
    category.value.id.valid &&
    imgs.isNotEmpty
  );

  void _initData() {
    products.clear();
    final String _userId = data.user!.id;
    _homeController.products.forEach((p) {
      if(p.user == _userId) {
        products.add(p);
      }
    });
  }

  void resetData() {
    name.text = '';
    description.text = '';
    stock.text = '';
    price.text = '';
    category.value = Category('', '');
    imgs = [];
  }

  Future<AsdError?> getListCategory() async {
    AsdError? _error;
    if(data.categories.isEmpty) {
      final Either<AsdError, List<Category>> result = await _homeResource.getListCategory();
      result.fold(
        (l) => _error = l,
        (r) => _doSuccessGetListCategory(r)
      );
    } else {
      readyView = true;
    }
    return _error;
  }

  void _doSuccessGetListCategory(List<Category> list) {
    data.categories = list;
    readyView = true;
  }

  void toggleUrl(String url) {
    if(imgs.contains(url)) {
      imgs.remove(url);
    } else {
      imgs.add(url);
    }
  }

  Future<AsdError?> saveProduct() async {
    AsdError? _error;
    final Map<String, dynamic> _data = {
      'name': name.text,
      'stock': int.parse(stock.text),
      'price': double.parse(price.text.replaceAll(',', '.')),
      'description': description.text,
      "imgs": imgs,
      "caterogy": category.value.id      
    };
    final Either<AsdError, String> result = await _homeResource.saveProduct(_data);
    result.fold(
      (l) => _error = l,
      (r) => _doSaveProduct(r, _data)
    );
    return _error;
  }

  void _doSaveProduct(String id, Map<String, dynamic> body) {
    final Product _product = Product(
      id,
      body['name'],
      body['description'],
      body['price'],
      body['stock'],
      body['imgs'],
      data.user!.id,
      body['caterogy']
    );    
    _products.add(_product);
    _homeController.products.add(_product);
    resetData();
  }

}