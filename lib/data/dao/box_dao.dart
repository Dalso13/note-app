import 'package:hive/hive.dart';

import '../../domain/model/note_model.dart';

class BoxDao {
  final _box = Hive.box<NoteModel>('modelBox');

  get box => _box;
  Iterable<NoteModel> get values => _box.values;
}