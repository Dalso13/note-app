import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/domain/model/note_model.dart';
import 'package:note_app/view/ui/main_screen.dart';
import 'package:note_app/view/view_model/main_view_model.dart';
import 'package:provider/provider.dart';

import 'di/di_setup.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  final box = await Hive.openBox<NoteModel>('modelBox');
  diSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(create: (BuildContext context) { return getIt<MainViewModel>(); },
      child: const MainScreen()),
    );
  }
}
