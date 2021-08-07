
import 'dart:developer';

import 'package:socket_io_client/socket_io_client.dart' as IO;

// Store
import 'config.dart';

class AsdSocket {

  final Config _config = Config();

  late final String _baseUrl;

  late IO.Socket socket;

  AsdSocket() {
    _baseUrl = _config.prod ? _config.urlSocketProd : _config.urlSocketDev;
  }

  void initState() {
    socket = IO.io(_baseUrl, IO.OptionBuilder()
      .setTransports(['websocket'])
      .disableAutoConnect()
      .build());
    socket.connect();
  }

  void onListenerEvent(String event, Function(dynamic) onAction) {
    socket.on(event, (data) => onAction(data));    
  }



}