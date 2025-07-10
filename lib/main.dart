import 'dart:async';
import 'package:sworks_mobile/core/storage/secure_storage_util.dart';
import 'package:sworks_mobile/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app.dart';

Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await Future.wait([SecureStorageUtil.saveFcmToken("test")]);

      runApp(const ProviderScope(child: MyApp()));
    },
    (error, stackTrace) {
      Logger().d("Error: $error");
      Logger().d("Stack trace: $stackTrace");
    },
  );
}
