import 'package:atm_test/data/storage_util.dart';
import 'package:atm_test/domain/models/settings.dart';

abstract class StorageRepository {
  Future<void> saveSettings({required Settings settings});
  Future<Settings> loadSettings();
}

class StorageDataRepository implements StorageRepository{
  final StorageUtil storage;

  StorageDataRepository({required this.storage});

  @override
  Future<Settings> loadSettings() {
    return storage.loadSettings();
  }

  @override
  Future<void> saveSettings({required Settings settings}) async {
    await storage.saveSettings(settings);
  }

}