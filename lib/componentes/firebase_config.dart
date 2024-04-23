import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class FirebaseConfig {

  /// CONFIGURACIONES REQUERIDAS PARA USAR LA BASE DE DATOS FIREBASE
  /// 
    static Future<FirebaseApp> initialize() async {

    FirebaseApp app = await Firebase.initializeApp();

    return app;

  }

  static FirebaseOptions get currentPlatform {
    if (Platform.isAndroid) {
      return const FirebaseOptions(
        apiKey: "AIzaSyDIs01gT1MvkNOGuA4Cv_jA7SJQtjEqVhw",
        appId: "1:73844772548:android:b8a766048304a9ff3a0391",
        messagingSenderId: "73844772548 ",
        projectId: "flutter-app-b3daf",
        storageBucket: "flutter-app-b3daf.appspot.com",
      );
    } else if (Platform.isIOS) {
      return const FirebaseOptions(
        apiKey: "YOUR_API_KEY",
        appId: "YOUR_APP_ID",
        messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
        projectId: "YOUR_PROJECT_ID",
        storageBucket: "YOUR_STORAGE_BUCKET",
        iosBundleId: "com.example.yourApp",
      );
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}

