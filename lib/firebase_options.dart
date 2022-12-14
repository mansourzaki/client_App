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
    apiKey: 'AIzaSyCU4sLdCH1eI9QmbRIfobaE3P6tphqpgJ8',
    appId: '1:292105415443:web:21326dd051529fa0fb88e6',
    messagingSenderId: '292105415443',
    projectId: 'ecommerce-app-c13b6',
    authDomain: 'ecommerce-app-c13b6.firebaseapp.com',
    storageBucket: 'ecommerce-app-c13b6.appspot.com',
    measurementId: 'G-88J2K3NW5Y',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCQB10w5pZpvvlJT8wBP2_wZI_qxWJLr0g',
    appId: '1:292105415443:android:8f052016e4329d4afb88e6',
    messagingSenderId: '292105415443',
    projectId: 'ecommerce-app-c13b6',
    storageBucket: 'ecommerce-app-c13b6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZP3PYIZt2Ioc3O7RXuIzsO-FogB8vN1E',
    appId: '1:292105415443:ios:699544f0acf5f1e9fb88e6',
    messagingSenderId: '292105415443',
    projectId: 'ecommerce-app-c13b6',
    storageBucket: 'ecommerce-app-c13b6.appspot.com',
    iosClientId: '292105415443-d2daa2lohvmhqeevs3u4jf8q91lgu2t8.apps.googleusercontent.com',
    iosBundleId: 'com.example.adminApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCZP3PYIZt2Ioc3O7RXuIzsO-FogB8vN1E',
    appId: '1:292105415443:ios:699544f0acf5f1e9fb88e6',
    messagingSenderId: '292105415443',
    projectId: 'ecommerce-app-c13b6',
    storageBucket: 'ecommerce-app-c13b6.appspot.com',
    iosClientId: '292105415443-d2daa2lohvmhqeevs3u4jf8q91lgu2t8.apps.googleusercontent.com',
    iosBundleId: 'com.example.adminApp',
  );
}
