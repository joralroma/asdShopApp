import 'package:get/get.dart';

// Store
import 'package:asdshop/app/store/data.dart';

// Models
import 'package:asdshop/app/models/product.dart';

// Controller
import 'package:asdshop/app/ui/home/home_controller.dart';

// Resource
import 'package:asdshop/app/resources/home_resource.dart';

class BusinessController extends GetxController {

  final HomeResource _homeResource;

  BusinessController(this._homeResource);

  final HomeController _homeController = Get.find<HomeController>();

  final AsdData data = AsdData.instance;

  final RxList<Product> _products = RxList([]);

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  @override
  void onClose() {
    _products.close();
    super.onClose();
  }

  List<Product> get products => _products.value;
  set products(List<Product> value) => _products.value = value;

  void _initData() {
    products.clear();
    final String _userId = data.user!.id;
    _homeController.products.forEach((p) {
      if(p.user == _userId) {
        products.add(p);
      }
    });
  }

}