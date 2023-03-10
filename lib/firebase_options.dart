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
    apiKey: 'AIzaSyBMD2VdVlsWU44Efdhn-sjqrUh3MUHsRYU',
    appId: '1:107105803701:web:b4fed72583ebf2a867cdfc',
    messagingSenderId: '107105803701',
    projectId: 'foggle-18d3f',
    authDomain: 'foggle-18d3f.firebaseapp.com',
    storageBucket: 'foggle-18d3f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBq6aXGpNI85jWG03bZLw1vgKuyCfpYV3g',
    appId: '1:107105803701:android:f454fd467e8af30367cdfc',
    messagingSenderId: '107105803701',
    projectId: 'foggle-18d3f',
    storageBucket: 'foggle-18d3f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC6C0r9ROqiidGGOzHV4MTThzzxNG5eXec',
    appId: '1:107105803701:ios:53767ec435545c2a67cdfc',
    messagingSenderId: '107105803701',
    projectId: 'foggle-18d3f',
    storageBucket: 'foggle-18d3f.appspot.com',
    iosClientId: '107105803701-121hhuhokndthj0i2mic9j1r17ul2i92.apps.googleusercontent.com',
    iosBundleId: 'com.oaklib.foggle',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC6C0r9ROqiidGGOzHV4MTThzzxNG5eXec',
    appId: '1:107105803701:ios:53767ec435545c2a67cdfc',
    messagingSenderId: '107105803701',
    projectId: 'foggle-18d3f',
    storageBucket: 'foggle-18d3f.appspot.com',
    iosClientId: '107105803701-121hhuhokndthj0i2mic9j1r17ul2i92.apps.googleusercontent.com',
    iosBundleId: 'com.oaklib.foggle',
  );
}
