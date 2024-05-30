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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDVER3c9BcYDEWODopuCfm5DLberruttCw',
    appId: '1:393586675136:web:53bc377f0c02c136250c25',
    messagingSenderId: '393586675136',
    projectId: 'trackin-n-bingein-87e04',
    authDomain: 'trackin-n-bingein-87e04.firebaseapp.com',
    storageBucket: 'trackin-n-bingein-87e04.appspot.com',
    measurementId: 'G-DWD0S6B7SC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBrlF0PQyydoa6sL3TJnzmqJt4K8Vg5xX0',
    appId: '1:393586675136:android:caecf57950df91ec250c25',
    messagingSenderId: '393586675136',
    projectId: 'trackin-n-bingein-87e04',
    storageBucket: 'trackin-n-bingein-87e04.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDVER3c9BcYDEWODopuCfm5DLberruttCw',
    appId: '1:393586675136:web:a5a23b6f3ceaf16b250c25',
    messagingSenderId: '393586675136',
    projectId: 'trackin-n-bingein-87e04',
    authDomain: 'trackin-n-bingein-87e04.firebaseapp.com',
    storageBucket: 'trackin-n-bingein-87e04.appspot.com',
    measurementId: 'G-QV2WNSZKTJ',
  );
}