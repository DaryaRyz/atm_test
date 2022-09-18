import 'dart:convert';
import 'package:atm_test/domain/models/settings.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StorageUtil {
  Box? _storage;
  static const _versionStorage = 'v1.0';

  Future<void> _init() async {
    await Hive.initFlutter();
    _storage = await Hive.openBox(_versionStorage);
  }

  Future<void> saveSettings(Settings settings) async {
    _storage ?? await _init();
    final result = jsonEncode(settings.toMap());
    await _storage!.delete('settings');
    await _storage!.put('settings', result);
  }

  Future<Settings> loadSettings() async {
    _storage ?? await _init();
    final result = _storage!.get('settings');
    if (result == null) {
      return Settings.empty();
    } else {
      return Settings.fromMap(jsonDecode(result));
    }
  }
}
