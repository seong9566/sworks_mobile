import 'package:sworks_mobile/network/dio_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// DioClient Provider
final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient();
});
