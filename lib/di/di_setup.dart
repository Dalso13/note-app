import 'package:get_it/get_it.dart';
import 'package:note_app/view/view_model/main_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerFactory<MainViewModel>(() => MainViewModel());
}