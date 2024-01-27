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
    apiKey: 'AIzaSyC9pm6ue2R_5ZRX4LJcYBAuBesneNKw2Es',
    appId: '1:228071097009:web:80284ab86a6c14aedd5890',
    messagingSenderId: '228071097009',
    projectId: 'chat-app-7752a',
    authDomain: 'chat-app-7752a.firebaseapp.com',
    storageBucket: 'chat-app-7752a.appspot.com',
    measurementId: 'G-GDL095VHYS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDNsodtiTVnRnQtXCc4hGB8KPqiE0IYcro',
    appId: '1:228071097009:android:52a084ff52a46488dd5890',
    messagingSenderId: '228071097009',
    projectId: 'chat-app-7752a',
    storageBucket: 'chat-app-7752a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCTYifayA0qF2i-1-9VL5ngd7XRFJu0Hmw',
    appId: '1:228071097009:ios:8a58fa9d9ed8643fdd5890',
    messagingSenderId: '228071097009',
    projectId: 'chat-app-7752a',
    storageBucket: 'chat-app-7752a.appspot.com',
    iosBundleId: 'com.example.untitled1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCTYifayA0qF2i-1-9VL5ngd7XRFJu0Hmw',
    appId: '1:228071097009:ios:3dca3c16cf402718dd5890',
    messagingSenderId: '228071097009',
    projectId: 'chat-app-7752a',
    storageBucket: 'chat-app-7752a.appspot.com',
    iosBundleId: 'com.example.untitled1.RunnerTests',
  );
}