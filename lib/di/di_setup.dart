import 'package:get_it/get_it.dart';
import 'package:note_app/data/dao/note_repository.dart';
import 'package:note_app/view/ui/sort_bar.dart';
import 'package:note_app/view/view_model/main_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<NoteRepository>(NoteRepository());
  getIt.registerFactory<MainViewModel>(() => MainViewModel(dao: getIt<NoteRepository>()));
  getIt.registerFactory<SortBar>(() => SortBar());
}