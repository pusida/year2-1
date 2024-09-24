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
    apiKey: 'AIzaSyBwWnt9SlAtBiuSskU1hbTV-Z8-WoUZK-4',
    appId: '1:240011497183:web:f0e75f7080b25743d4a36a',
    messagingSenderId: '240011497183',
    projectId: 'expensetracker-b5418',
    authDomain: 'expensetracker-b5418.firebaseapp.com',
    storageBucket: 'expensetracker-b5418.appspot.com',
    measurementId: 'G-0K66E1KCJ6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyASp3QQ_HBCkC-EEHi-z5h4WesBiggXubo',
    appId: '1:240011497183:android:2c425b58058288f1d4a36a',
    messagingSenderId: '240011497183',
    projectId: 'expensetracker-b5418',
    storageBucket: 'expensetracker-b5418.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCQdCTjtLVaa-LYugjuNn_VzYOCX4enaOU',
    appId: '1:240011497183:ios:289d9e07f1e17ffad4a36a',
    messagingSenderId: '240011497183',
    projectId: 'expensetracker-b5418',
    storageBucket: 'expensetracker-b5418.appspot.com',
    iosBundleId: 'com.example.flutterExpenseTracker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCQdCTjtLVaa-LYugjuNn_VzYOCX4enaOU',
    appId: '1:240011497183:ios:289d9e07f1e17ffad4a36a',
    messagingSenderId: '240011497183',
    projectId: 'expensetracker-b5418',
    storageBucket: 'expensetracker-b5418.appspot.com',
    iosBundleId: 'com.example.flutterExpenseTracker',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBwWnt9SlAtBiuSskU1hbTV-Z8-WoUZK-4',
    appId: '1:240011497183:web:4fb2b810ee830d79d4a36a',
    messagingSenderId: '240011497183',
    projectId: 'expensetracker-b5418',
    authDomain: 'expensetracker-b5418.firebaseapp.com',
    storageBucket: 'expensetracker-b5418.appspot.com',
    measurementId: 'G-E92W0N5VS1',
  );
}