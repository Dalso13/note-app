import 'package:flutter/material.dart';
import 'package:note_app/domain/model/note_model.dart';
import 'package:note_app/view/view_model/main_state.dart';
import '../../data/dao/box_dao.dart';

class MainViewModel extends ChangeNotifier {
  final now = DateTime.now().millisecondsSinceEpoch;
  final BoxDao _dao;
  List<NoteModel> _box;
  MainState _state = const MainState();

  MainState get state => _state;

  MainViewModel({
    required BoxDao dao,
  }) : _dao = dao, _box = dao.values.toList();

  List<NoteModel> get box => _box;

  void setBox(
      {required String title,
      required String content,
      required int color,
      int? index}) {
    if (index != null) {
      _dao.box.putAt(
          index,
          NoteModel(
              title: title, content: content, hexColor: color, dateTime: now));
    } else {
      _dao.box.add(NoteModel(
          title: title, content: content, hexColor: color, dateTime: now));
    }
    notifyListeners();
  }

  void deleteBox(int index) {
    _dao.box.deleteAt(index);
    _box.removeAt(index);
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
            ? _box.sort((a, b) => a.title.compareTo(b.title))
            : _box.sort((a, b) => b.title.compareTo(a.title));
      case 1:
        !_state.isOrder
            ? _box.sort((a, b) => a.dateTime.compareTo(b.dateTime))
            : _box.sort((a, b) => b.dateTime.compareTo(a.dateTime));
      case 2:
        !_state.isOrder
            ? _box.sort((a, b) => a.hexColor.compareTo(b.hexColor))
            : _box.sort((a, b) => b.hexColor.compareTo(a.hexColor));
    }

    menu[index] = !menu[index];
    _state = _state.copyWith(isMenu: menu);

    notifyListeners();
  }
}
