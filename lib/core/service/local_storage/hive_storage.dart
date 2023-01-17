// ignore_for_file: type_annotate_public_apis

import 'package:hive/hive.dart';
import 'package:test_mobile/core/core.dart';

class HiveStorage<E> implements LocalStorage<E> {
  HiveStorage(this.box);
  final Box<E> box;
  @override
  Future<void> clear() async {
    await box.clear();
  }

  @override
  bool containKey(String key) {
    return box.containsKey(key);
  }

  @override
  Iterable<MapEntry<String, E>> get entries =>
      box.toMap().entries as Iterable<MapEntry<String, E>>;

  @override
  bool get isEmpty => box.isEmpty;

  @override
  E? read(String key) {
    _guard();
    return box.get(key);
  }

  @override
  Future<void> remove(String key) async {
    _guard();
    await box.delete(key);
  }

  @override
  Future<void> write(String key, value) async {
    _guard();
    if (box.containsKey(key)) {
      await box.delete(key);
    }
    logger.i('saving = ${value.toString()}');
    await box.put(key, value);
  }

  void _guard() {
    assert(box.isOpen, 'Box with name ${box.name} is not opened');
  }
}
