library intranet_ip;

import 'dart:core';
import 'dart:async';
import 'dart:io';
import 'package:random_uint8list/random_uint8list.dart';
import 'package:collection/collection.dart';

Future<InternetAddress> intranetIpv4() async {
  const len = 16;
  final token = randomUint8List(len);
  final socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);
  socket.readEventsEnabled = true;
  socket.broadcastEnabled = true;
  final ret = socket.timeout(Duration(milliseconds: 500), onTimeout: (sink) {
    sink.close();
  }).expand<InternetAddress>((event) {
    if (event == RawSocketEvent.read) {
      final dg = socket.receive();
      if (dg != null &&
          dg.data.length == len &&
          ListEquality().equals(dg.data, token)) {
        socket.close();
        return [dg.address];
      }
    }
    return [];
  }).first;

  socket.send(token, InternetAddress("255.255.255.255"), socket.port);
  return ret;
}
