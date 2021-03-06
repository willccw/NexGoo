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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAZ6N4vOfT99kVp-0lKkXRUqPtQ_OhGA70',
    appId: '1:240960389340:android:70701e6117012045303419',
    messagingSenderId: '240960389340',
    projectId: 'nexgoo',
    storageBucket: 'nexgoo.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAOoVMwBgVxFhKdPOQwvmNNOEfu221QhTk',
    appId: '1:240960389340:ios:60bc17150c0007e4303419',
    messagingSenderId: '240960389340',
    projectId: 'nexgoo',
    storageBucket: 'nexgoo.appspot.com',
    iosClientId: '240960389340-bt33ihod7lvjj0v4cvvvesam7ic0dclk.apps.googleusercontent.com',
    iosBundleId: 'com.example.NexGoo',
  );
}
