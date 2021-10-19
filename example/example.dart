import 'package:intranet_ip/intranet_ip.dart';

void main() async {
  final ip = await intranetIpv4();
  print(ip);
  print(ip.rawAddress);
}
