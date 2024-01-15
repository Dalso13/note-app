import 'package:flutter/material.dart';
import 'package:note_app/domain/model/note_model.dart';
import 'package:note_app/view/view_model/main_state.dart';
import '../../data/dao/note_repository.dart';
import 'package:uuid/uuid.dart';

class MainViewModel extends ChangeNotifier {
  final now = DateTime.now().millisecondsSinceEpoch;
  final NoteRepository _noteRepository;
  final Uuid _uuid = const Uuid();
  List<NoteModel> _noteList = [];
  MainState _state = const MainState();

  MainState get state => _state;

  MainViewModel({
    required NoteRepository dao,
  }) : _noteRepository = dao;

  List<NoteModel> get noteList => _noteList;

  Future<void> getAllNote() async {
   _noteList =  await _noteRepository.getAllNote();
   notifyListeners();
  }

  Future<void> setNote(
      {required String title,
      required String content,
      required int color,
      String? uuid}) async {
    if (uuid == null) {
      await _noteRepository.updateNote(note: NoteModel(id: _uuid.v1(), title: title, content: content, hexColor: color, dateTime: now));
    } else {
      await _noteRepository.updateNote(note: NoteModel(id: uuid, title: title, content: content, hexColor: color, dateTime: now));
    }
    notifyListeners();
  }

  Future<void> deleteNote(String uuid) async {
    await _noteRepository.deleteNote(uuid: uuid);
    _noteList.removeWhere((NoteModel e) => e.id == uuid);
    notifyListeners();
  }

  void sortOpen() {
    _state = _state.copyWith(isOpen: !_state.isOpen);
    notifyListeners();
  }

  void changeIsOrder() {
    _state = _state.copyWith(isOrder: !_state.isOrder);
    notifyListeners();
  }

  void changeIsMenu(int index) {
    List<bool> menu = _state.isMenu.map((e) => e).toList();
    if (menu.lastIndexOf(true) != -1) {
      menu[menu.lastIndexOf(true)] = false;
    }

    switch (index) {
      case 0:
        !_state.isOrder
            ? _noteList.sort((a, b) => a.title.compareTo(b.title))
            : _noteList.sort((a, b) => b.title.compareTo(a.title));
      case 1:
        !_state.isOrder
            ? _noteList.sort((a, b) => a.dateTime.compareTo(b.dateTime))
            : _noteList.sort((a, b) => b.dateTime.compareTo(a.dateTime));
      case 2:
        !_state.isOrder
            ? _noteList.sort((a, b) => a.hexColor.compareTo(b.hexColor))
            : _noteList.sort((a, b) => b.hexColor.compareTo(a.hexColor));
    }

    menu[index] = !menu[index];
    _state = _state.copyWith(isMenu: menu);

    notifyListeners();
  }
}
