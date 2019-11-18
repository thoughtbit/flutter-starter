import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class ConfigInfo {
  String version = '1.0';
  String appVersion = '-';
}

class ConfigModel extends ConfigInfo with ChangeNotifier {
  Future getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
    notifyListeners();
  }
}