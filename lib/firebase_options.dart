// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
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
        return windows;
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
    apiKey: 'AIzaSyBkZA34RNdGU4j2HIFKM1uAu2m0PwA4cYc',
    appId: '1:451171401671:web:45b0d34badf30192dbe3e2',
    messagingSenderId: '451171401671',
    projectId: 'travelstay-66d67',
    authDomain: 'travelstay-66d67.firebaseapp.com',
    storageBucket: 'travelstay-66d67.appspot.com',
    measurementId: 'G-QZNFVEQ09R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDNM9ih_C_t1BCc816NogbCHoflE_KsSUk',
    appId: '1:451171401671:android:91d9e1743d31cea2dbe3e2',
    messagingSenderId: '451171401671',
    projectId: 'travelstay-66d67',
    storageBucket: 'travelstay-66d67.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAvnv-ngBXjlHBqGkRXffb6QtaMvQBMbSc',
    appId: '1:451171401671:ios:0ec38014dfa63f9cdbe3e2',
    messagingSenderId: '451171401671',
    projectId: 'travelstay-66d67',
    storageBucket: 'travelstay-66d67.appspot.com',
    iosBundleId: 'com.example.travelstay',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAvnv-ngBXjlHBqGkRXffb6QtaMvQBMbSc',
    appId: '1:451171401671:ios:0ec38014dfa63f9cdbe3e2',
    messagingSenderId: '451171401671',
    projectId: 'travelstay-66d67',
    storageBucket: 'travelstay-66d67.appspot.com',
    iosBundleId: 'com.example.travelstay',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBkZA34RNdGU4j2HIFKM1uAu2m0PwA4cYc',
    appId: '1:451171401671:web:dca56f4c9a4e5379dbe3e2',
    messagingSenderId: '451171401671',
    projectId: 'travelstay-66d67',
    authDomain: 'travelstay-66d67.firebaseapp.com',
    storageBucket: 'travelstay-66d67.appspot.com',
    measurementId: 'G-ZXD5L3MWDS',
  );
}
