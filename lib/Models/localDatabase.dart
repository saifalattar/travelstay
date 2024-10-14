import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:universal_platform/universal_platform.dart';
import "dart:html" as html;

abstract class _LocalDataInterface {
  Future saveData(String key, String data);
  Future deleteData(String key);
  Future getData(String key);
  Future deleteAll();
  Future<bool> containsKey(String key);
}

class LocalData implements _LocalDataInterface {
  FlutterSecureStorage? _appInstance;
  html.Storage? _webInstance;

  LocalData() {
    if (UniversalPlatform.isWeb) {
      _webInstance = html.window.localStorage;
    } else {
      _appInstance = const FlutterSecureStorage();
    }
  }

  @override
  Future<bool> deleteAll() async {
    try {
      if (UniversalPlatform.isWeb) {
        _webInstance!.clear();
      } else {
        await _appInstance!.deleteAll();
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteData(String key) async {
    try {
      if (UniversalPlatform.isWeb) {
        _webInstance!.remove(key);
      } else {
        await _appInstance!.delete(key: key);
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> saveData(String key, String data) async {
    try {
      if (UniversalPlatform.isWeb) {
        _webInstance!.addAll({key: data});
      } else {
        await _appInstance!.write(key: key, value: data);
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future getData(String key) async {
    if (UniversalPlatform.isWeb) {
      return _webInstance![key];
    } else {
      return await _appInstance!.read(key: key);
    }
  }

  @override
  Future<bool> containsKey(String key) async {
    if (UniversalPlatform.isWeb) {
      return _webInstance!.containsKey(key);
    } else {
      return await _appInstance!.containsKey(key: key);
    }
  }
}
