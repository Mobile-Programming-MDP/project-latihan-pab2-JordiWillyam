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
    apiKey: 'AIzaSyDogXTHprevWL9qu1sSxd4RgBrbWWszvJk',
    appId: '1:784425301648:web:9e86c5d5bafd86a98d0a15',
    messagingSenderId: '784425301648',
    projectId: 'fasum-app-jordi',
    authDomain: 'fasum-app-jordi.firebaseapp.com',
    storageBucket: 'fasum-app-jordi.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAqcKh_hxEjcOrSLYJBX8TlshjWqeW2nE0',
    appId: '1:784425301648:android:579df0abc64cf9bc8d0a15',
    messagingSenderId: '784425301648',
    projectId: 'fasum-app-jordi',
    storageBucket: 'fasum-app-jordi.firebasestorage.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDogXTHprevWL9qu1sSxd4RgBrbWWszvJk',
    appId: '1:784425301648:web:897ee617a34b512d8d0a15',
    messagingSenderId: '784425301648',
    projectId: 'fasum-app-jordi',
    authDomain: 'fasum-app-jordi.firebaseapp.com',
    storageBucket: 'fasum-app-jordi.firebasestorage.app',
  );

}