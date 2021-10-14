import 'package:intranet_ip/intranet_ip.dart';

void main() async {
  final ip = await localIpv4();
  print(ip);
  print(ip.rawAddress);
}
