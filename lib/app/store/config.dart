const bool isProduction = bool.fromEnvironment('dart.vm.product');

class Config {

  bool prod = isProduction;
  String urlLoginDev   = 'http://192.168.1.6:3000/api/';
  String urlLoginProd  = 'https://us-central1-oncobot.cloudfunctions.net/storageserver';

}
