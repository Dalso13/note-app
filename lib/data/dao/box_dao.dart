import 'package:hive/hive.dart';

import '../../domain/model/note_model.dart';

class BoxDao {
  final Box<NoteModel> _box = Hive.box<NoteModel>('modelBox');

  Box<NoteModel> get box => _box;
  Iterable<NoteModel> get values => _box.values;
}