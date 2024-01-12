import 'package:get_it/get_it.dart';
import 'package:note_app/data/dao/box_dao.dart';
import 'package:note_app/view/ui/sort_bar.dart';
import 'package:note_app/view/view_model/main_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<BoxDao>(BoxDao());
  getIt.registerFactory<MainViewModel>(() => MainViewModel(dao: getIt<BoxDao>()));
  getIt.registerFactory<SortBar>(() => SortBar());
}