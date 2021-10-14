<!-- 本文件由 ./readme.make.md 自动生成，请不要直接修改此文件 -->

# intranet_ip

get local intranet ip with tcp bind

## use

```dart
import 'package:intranet_ip/intranet_ip.dart';

void main() async {
  final ip = await localIpv4();
  print(ip);
  print(ip.rawAddress);
}

```
