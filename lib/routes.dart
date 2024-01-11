import 'package:go_router/go_router.dart';
import 'package:note_app/view/ui/create_note.dart';
import 'package:note_app/view/ui/main_screen.dart';
import 'package:provider/provider.dart';

import 'di/di_setup.dart';
import 'view/view_model/main_view_model.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ChangeNotifierProvider(
          create: (_) {
            return getIt<MainViewModel>();
          },
          child: const MainScreen()),
    ),
    GoRoute(
      path: '/create',
      builder: (context, state) {
        return const CreateNote();
      },
    ),
  ],
);
