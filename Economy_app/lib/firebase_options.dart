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
    apiKey: 'AIzaSyCoVulh_Y0m1bbxxnlNCgrTUWnFnTD2ThM',
    appId: '1:153440091164:web:0e8f0d7d94544874b333d9',
    messagingSenderId: '153440091164',
    projectId: 'cursach-f64af',
    authDomain: 'cursach-f64af.firebaseapp.com',
    storageBucket: 'cursach-f64af.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAenkjQ81iccAcWKXe6CIj9wJZtpXj6IsI',
    appId: '1:153440091164:android:168185a63a7fd014b333d9',
    messagingSenderId: '153440091164',
    projectId: 'cursach-f64af',
    storageBucket: 'cursach-f64af.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBRUPB1sCI1Nhd58izCDpaZmcuAiNZ31AQ',
    appId: '1:153440091164:ios:b7aaa43b41df914db333d9',
    messagingSenderId: '153440091164',
    projectId: 'cursach-f64af',
    storageBucket: 'cursach-f64af.appspot.com',
    iosClientId: '153440091164-4iudovmp6rtrpl2pos9r3931u9qvfanr.apps.googleusercontent.com',
    iosBundleId: 'com.example.economyApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBRUPB1sCI1Nhd58izCDpaZmcuAiNZ31AQ',
    appId: '1:153440091164:ios:5fc042df5536af20b333d9',
    messagingSenderId: '153440091164',
    projectId: 'cursach-f64af',
    storageBucket: 'cursach-f64af.appspot.com',
    iosClientId: '153440091164-i9q3himhk72422qndoh309timds64987.apps.googleusercontent.com',
    iosBundleId: 'com.example.project',
  );
}
