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
    apiKey: 'AIzaSyDcXavFhCciidzCaolB_AxE9lTiXSpCGCQ',
    appId: '1:230462451232:web:dfd046a0778017960e5645',
    messagingSenderId: '230462451232',
    projectId: 'login-logros',
    authDomain: 'login-logros.firebaseapp.com',
    storageBucket: 'login-logros.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBwClAIkQUBCoCighMr-mEXN3pcAvAXkMM',
    appId: '1:230462451232:android:e826c042e931ff0f0e5645',
    messagingSenderId: '230462451232',
    projectId: 'login-logros',
    storageBucket: 'login-logros.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCRm9bN-p2C3LFWSW7kloVcht0LBJ8EJIM',
    appId: '1:230462451232:ios:b423905ca271c8f40e5645',
    messagingSenderId: '230462451232',
    projectId: 'login-logros',
    storageBucket: 'login-logros.appspot.com',
    iosBundleId: 'com.example.logrosApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCRm9bN-p2C3LFWSW7kloVcht0LBJ8EJIM',
    appId: '1:230462451232:ios:4ab2462bf14a3cc60e5645',
    messagingSenderId: '230462451232',
    projectId: 'login-logros',
    storageBucket: 'login-logros.appspot.com',
    iosBundleId: 'com.example.logrosApp.RunnerTests',
  );
}
