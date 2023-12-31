// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyBWH_UvgM5szSMJPO0gnXDHoaeLIsGHhz4',
    appId: '1:164428891023:web:2f74042ac6fc41b1b141fa',
    messagingSenderId: '164428891023',
    projectId: 'emart-b8d10',
    authDomain: 'emart-b8d10.firebaseapp.com',
    storageBucket: 'emart-b8d10.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDZUv4EYBg94ClvrXU46xKYeRpHUqYomCI',
    appId: '1:164428891023:android:367257ecdd341e4eb141fa',
    messagingSenderId: '164428891023',
    projectId: 'emart-b8d10',
    storageBucket: 'emart-b8d10.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD3z0dj7zGNXe6gSUuJC7iW-0lEapRPJpg',
    appId: '1:164428891023:ios:1fa318c5327ba5e6b141fa',
    messagingSenderId: '164428891023',
    projectId: 'emart-b8d10',
    storageBucket: 'emart-b8d10.appspot.com',
    iosBundleId: 'com.example.flutterfinal',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD3z0dj7zGNXe6gSUuJC7iW-0lEapRPJpg',
    appId: '1:164428891023:ios:5cd42e3128f82cafb141fa',
    messagingSenderId: '164428891023',
    projectId: 'emart-b8d10',
    storageBucket: 'emart-b8d10.appspot.com',
    iosBundleId: 'com.example.flutterfinal.RunnerTests',
  );
}
