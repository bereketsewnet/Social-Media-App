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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBJlKkKYTo7hIMNoM-s5r8jmBtYySBEDHM',
    appId: '1:270481626793:web:b748c5859c10b6709bfbb8',
    messagingSenderId: '270481626793',
    projectId: 'minimal-eba9a',
    authDomain: 'minimal-eba9a.firebaseapp.com',
    storageBucket: 'minimal-eba9a.appspot.com',
    measurementId: 'G-4KJRWP5T4F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD4Xl8uZ6GcI21E0K0nHdCv7QGjI2dczKo',
    appId: '1:270481626793:android:3aaf42b12c9344309bfbb8',
    messagingSenderId: '270481626793',
    projectId: 'minimal-eba9a',
    storageBucket: 'minimal-eba9a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyATQpL_0CKLh3nv7JYaqAA14Blw89Wz994',
    appId: '1:270481626793:ios:92d87d4b551e33509bfbb8',
    messagingSenderId: '270481626793',
    projectId: 'minimal-eba9a',
    storageBucket: 'minimal-eba9a.appspot.com',
    iosBundleId: 'com.example.socialMediaApp',
  );
}
