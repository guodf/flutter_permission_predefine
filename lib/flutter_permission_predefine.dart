import 'dart:io';
import 'package:flutter_permission_predefine/android.dart' as android;
import 'package:flutter_permission_predefine/ios.dart' as ios;
import 'package:path/path.dart';

import 'package:yaml/yaml.dart';

const String configFile = "pubspec.yaml";

String printVersion(String version) => '''
  ════════════════════════════════════════════
     FLUTTER PERMISSION PREDEFINE (v$version)
  ════════════════════════════════════════════
  ''';

void printPackageInfo() {
  String versionFile = Platform.script.toFilePath(windows: Platform.isWindows);
  versionFile = join(normalize(join(versionFile, "../../")), configFile);
  final File file = File(versionFile);
  final String yamlString = file.readAsStringSync();
  final Map yamlMap = loadYaml(yamlString);
  final String version = yamlMap["version"];
  print("════════════════════════════════════════════");
  print("   FLUTTER PERMISSION PREDEFINE (v$version) ");
  print("════════════════════════════════════════════");
}

void generator() {
  final File file = File(configFile);
  final String yamlString = file.readAsStringSync();
  final Map yamlMap = loadYaml(yamlString);
  if (yamlMap.containsKey("permission_perdefine")) {
    final permission_perdefine = yamlMap["permission_perdefine"];
    if (permission_perdefine.containsKey("android")) {
      final YamlList list = permission_perdefine["android"];
      android
          .merge_permissions(list.map((element) => element.toString()).toSet());
    }
    if (permission_perdefine.containsKey("ios")) {
      // final YamlList list = permission_perdefine["ios"];
      ios.merge_permissions();
    }
  }
}
