import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class FirebaseConfig {
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
// Import the functions you need from the SDKs you need

// import { initializeApp } from "firebase/app";

// import { getAnalytics } from "firebase/analytics";

// // TODO: Add SDKs for Firebase products that you want to use

// // https://firebase.google.com/docs/web/setup#available-libraries


// // Your web app's Firebase configuration

// // For Firebase JS SDK v7.20.0 and later, measurementId is optional

// const firebaseConfig = {

//   apiKey: "AIzaSyDIs01gT1MvkNOGuA4Cv_jA7SJQtjEqVhw",

//   authDomain: "flutter-app-b3daf.firebaseapp.com",

//   projectId: "flutter-app-b3daf",

//   storageBucket: "flutter-app-b3daf.appspot.com",

//   messagingSenderId: "73844772548",

//   appId: "1:73844772548:web:10bb15c8b1c590fd3a0391",

//   measurementId: "G-TKFPNZ31F5"

// };


// // Initialize Firebase

// const app = initializeApp(firebaseConfig);

// const analytics = getAnalytics(app);



