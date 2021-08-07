const bool isProduction = bool.fromEnvironment('dart.vm.product');

class Config {

  bool prod = isProduction;
  String urlBackDev   = 'http://192.168.1.6:3000/api/';
  String urlBackProd  = 'https://us-central1-oncobot.cloudfunctions.net/storageserver';
  String urlSocketDev   = 'http://192.168.1.6:3000';
  String urlSocketProd   = 'http://192.168.1.6:3000';

}
