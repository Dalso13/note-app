import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app/domain/model/note_model.dart';

class MainViewModel extends ChangeNotifier {
  final now = DateTime.now().millisecondsSinceEpoch;
  final box = Hive.box<NoteModel>('modelBox');

  void setBox({required String title, required String content, required int color}){
    box.add(NoteModel(title: title, content: content, hexColor: color, dateTime: now));
    notifyListeners();
  }
}