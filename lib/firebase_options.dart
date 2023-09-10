import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC_pHz3z_ROFV8cZz6LwxaC71IeaqeplwM',
    appId: '1:911757792742:web:7d08cc6e51116f7d4ff227',
    messagingSenderId: '911757792742',
    projectId: 'sih-waqi',
    authDomain: 'sih-waqi.firebaseapp.com',
    storageBucket: 'sih-waqi.appspot.com',
    measurementId: 'G-WRGTTH6V3W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAOTp-uAUFmiph-bh3PD03EiN-pV0WGLhQ',
    appId: '1:911757792742:android:d2d36b0bbd40a6a24ff227',
    messagingSenderId: '911757792742',
    projectId: 'sih-waqi',
    storageBucket: 'sih-waqi.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAoxfzovib_BqVHtTWXsuEZuBuJQoZsaV0',
    appId: '1:911757792742:ios:18ccd345471292d74ff227',
    messagingSenderId: '911757792742',
    projectId: 'sih-waqi',
    storageBucket: 'sih-waqi.appspot.com',
    iosBundleId: 'com.example.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAoxfzovib_BqVHtTWXsuEZuBuJQoZsaV0',
    appId: '1:911757792742:ios:407eaeebcf5984b24ff227',
    messagingSenderId: '911757792742',
    projectId: 'sih-waqi',
    storageBucket: 'sih-waqi.appspot.com',
    iosBundleId: 'com.example.app.RunnerTests',
  );
}
