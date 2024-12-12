import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _ChildProfile =
          await secureStorage.getStringList('ff_ChildProfile') ?? _ChildProfile;
    });
    await _safeInitAsync(() async {
      _affirmationCategories =
          await secureStorage.getStringList('ff_affirmationCategories') ??
              _affirmationCategories;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<String> _ChildProfile = [];
  List<String> get ChildProfile => _ChildProfile;
  set ChildProfile(List<String> value) {
    _ChildProfile = value;
    secureStorage.setStringList('ff_ChildProfile', value);
  }

  void deleteChildProfile() {
    secureStorage.delete(key: 'ff_ChildProfile');
  }

  void addToChildProfile(String value) {
    ChildProfile.add(value);
    secureStorage.setStringList('ff_ChildProfile', _ChildProfile);
  }

  void removeFromChildProfile(String value) {
    ChildProfile.remove(value);
    secureStorage.setStringList('ff_ChildProfile', _ChildProfile);
  }

  void removeAtIndexFromChildProfile(int index) {
    ChildProfile.removeAt(index);
    secureStorage.setStringList('ff_ChildProfile', _ChildProfile);
  }

  void updateChildProfileAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    ChildProfile[index] = updateFn(_ChildProfile[index]);
    secureStorage.setStringList('ff_ChildProfile', _ChildProfile);
  }

  void insertAtIndexInChildProfile(int index, String value) {
    ChildProfile.insert(index, value);
    secureStorage.setStringList('ff_ChildProfile', _ChildProfile);
  }

  List<String> _affirmationCategories = [];
  List<String> get affirmationCategories => _affirmationCategories;
  set affirmationCategories(List<String> value) {
    _affirmationCategories = value;
    secureStorage.setStringList('ff_affirmationCategories', value);
  }

  void deleteAffirmationCategories() {
    secureStorage.delete(key: 'ff_affirmationCategories');
  }

  void addToAffirmationCategories(String value) {
    affirmationCategories.add(value);
    secureStorage.setStringList(
        'ff_affirmationCategories', _affirmationCategories);
  }

  void removeFromAffirmationCategories(String value) {
    affirmationCategories.remove(value);
    secureStorage.setStringList(
        'ff_affirmationCategories', _affirmationCategories);
  }

  void removeAtIndexFromAffirmationCategories(int index) {
    affirmationCategories.removeAt(index);
    secureStorage.setStringList(
        'ff_affirmationCategories', _affirmationCategories);
  }

  void updateAffirmationCategoriesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    affirmationCategories[index] = updateFn(_affirmationCategories[index]);
    secureStorage.setStringList(
        'ff_affirmationCategories', _affirmationCategories);
  }

  void insertAtIndexInAffirmationCategories(int index, String value) {
    affirmationCategories.insert(index, value);
    secureStorage.setStringList(
        'ff_affirmationCategories', _affirmationCategories);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
