import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAP4fT7BgZvV-9ZMtLgyWjALX3Db9AVP2I",
            authDomain: "quis-c7624.firebaseapp.com",
            projectId: "quis-c7624",
            storageBucket: "quis-c7624.appspot.com",
            messagingSenderId: "263957136102",
            appId: "1:263957136102:web:8613848edd46c60cdc7127",
            measurementId: "G-WFKK1WRQP8"));
  } else {
    await Firebase.initializeApp();
  }
}
