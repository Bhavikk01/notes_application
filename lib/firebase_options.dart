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
    apiKey: 'AIzaSyAXmUEhPIT7psv_BD7LWZ0nRSx7jRGj0Qs',
    appId: '1:204046078805:web:5814eb55ee13a0f255d5dc',
    messagingSenderId: '204046078805',
    projectId: 'notes-555c4',
    authDomain: 'notes-555c4.firebaseapp.com',
    storageBucket: 'notes-555c4.appspot.com',
    measurementId: 'G-DD3VTD3LE0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDal52azDYzgQdF0TH9gjbohWXAFCCwFy0',
    appId: '1:204046078805:android:bb29a62cf6bd0ede55d5dc',
    messagingSenderId: '204046078805',
    projectId: 'notes-555c4',
    storageBucket: 'notes-555c4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD_A0FKKEMpcp7vISOJTgFfnXLl4ua6vs0',
    appId: '1:204046078805:ios:6bc7087d0d17cefb55d5dc',
    messagingSenderId: '204046078805',
    projectId: 'notes-555c4',
    storageBucket: 'notes-555c4.appspot.com',
    iosClientId: '204046078805-iq75via0bj3399c0olk84q3on09mddke.apps.googleusercontent.com',
    iosBundleId: 'com.example.notesApplication',
  );
}