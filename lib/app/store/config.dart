const bool isProduction = bool.fromEnvironment('dart.vm.product');

class Config {

  bool prod = isProduction;
  String urlBackDev   = 'http://192.168.1.7:3000/api/';
  String urlBackProd  = 'https://asdshopback.herokuapp.com/api/';
  String urlSocketDev   = 'http://192.168.1.7:3000';
  String urlSocketProd   = 'https://asdshopback.herokuapp.com';

}
