import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'qr_data_provider.g.dart';

@Riverpod()
Future<String?> qRData(Ref ref) {
  const storage = FlutterSecureStorage();
  return storage.read(key: "QRData");
}
