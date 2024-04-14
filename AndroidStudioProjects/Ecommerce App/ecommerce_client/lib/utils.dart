import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

Future<void> setupFirebase() async {
  await Firebase.initializeApp(
    options: Platform.isAndroid
        ? const FirebaseOptions(
            apiKey: 'AIzaSyBRg_SFfK-BNy23s-ctWxxAyeKa8_-Dqpk',
            appId: '1:421001391518:android:c69c4f5d411892c4a9fa8f',
            messagingSenderId: '421001391518',
            projectId: 'ecommerce-app-6eb1e')
        : const FirebaseOptions(
            apiKey: 'AIzaSyCmwuaHiPk257v43IdBr_nk0fUF-4Cho2Q',
            appId: '1:421001391518:ios:cc14313642b9af76a9fa8f',
            messagingSenderId: '421001391518',
            projectId: 'ecommerce-app-6eb1e',
          ),
  );
}
