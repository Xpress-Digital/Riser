import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD5DwfyTe9toGs-p-tzPnnE07ke5p4lFus",
            authDomain: "riser-7cf5b.firebaseapp.com",
            projectId: "riser-7cf5b",
            storageBucket: "riser-7cf5b.appspot.com",
            messagingSenderId: "80648292475",
            appId: "1:80648292475:web:b29f78d845fd5ea8783ade",
            measurementId: "G-QDJZ195DJ6"));
  } else {
    await Firebase.initializeApp();
  }
}
