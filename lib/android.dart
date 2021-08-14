import 'dart:io';

import 'package:xml/xml.dart';

const String androidConfigFile = "android/app/src/main/AndroidManifest.xml";

void merge_permissions(Set<String> permissions) {
  final File file = File(androidConfigFile);
  final String xmlStr = file.readAsStringSync();
  final xmlDoc = XmlDocument.parse(xmlStr);
  xmlDoc.rootElement.children.removeWhere((node) {
    if (node is XmlElement) {
      var ele = node;
      if (ele.name.local == "uses-permission") {
        return true;
      }
    }
    return false;
  });

  permissions.toList().sort((left, right) {
    return left.compareTo(right);
  });
  for (var permission in permissions) {
    xmlDoc.rootElement.children.insert(
        0,
        XmlElement(XmlName("uses-permission"),
            [XmlAttribute(XmlName("android:name"), permission)]));
    xmlDoc.rootElement.children.insert(0, XmlText("\r\n"));
  }
  file.writeAsStringSync(xmlDoc.toXmlString());
}
