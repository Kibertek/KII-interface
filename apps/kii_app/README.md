# KII Flutter app

This is the shared Flutter client for Windows and Android.

## Generate platform folders

From this directory, with Flutter SDK installed:

```bash
flutter create --platforms=windows,android .
flutter pub get
```

Then run on Windows:

```bash
flutter run -d windows
```

Or on a connected Android device:

```bash
flutter devices
flutter run -d <device-id>
```

The initial source contains a minimal home screen and a static Presence placeholder. Platform folders are generated locally by Flutter and should be committed after verifying the local toolchain and target platforms.
