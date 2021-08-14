# flutter_permission_predefine

A command line tool simplifies the addition of Android permissions.

## Getting Started

**And Platforms permissions in `pubspec.yaml`**

[example](example/pubspec.yaml)

```yaml
dev_dependencies:
  flutter_permission_predefine: ^0.0.1

permission_perdefine:
  android:
    - android.permission.INTERNET
``` 

**command**

```cmd
flutter pub get
flutter pub run flutter_permission_predefine:main
```

**IOS Not Support: Welcome to perfect!**

`Plant:`

```yaml
dev_dependencies:
  flutter_permission_predefine: ^0.0.1

permission_perdefine:
  ios:
    key:
      - string1
      - string2
```