import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/di/di_setup.dart';
import 'package:note_app/view/ui/sort_bar.dart';
import 'package:note_app/view/view_model/main_view_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await context.read<MainViewModel>().getAllNote();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your note'),
        actions: [
          IconButton(
              onPressed: () {
                viewModel.sortOpen();
              },
              icon: const Icon(Icons.list))
        ],
      ),
      body: Column(
        children: [
          viewModel.state.isOpen
              ? getIt<SortBar>().getMenu(viewModel)
              : Container(),
          Expanded(
            child: ListView(
              children: viewModel.noteList.map((noteModel) {
                return ListTile(
                  onTap: () {
                    context.push(
                      '/put',
                      extra: noteModel,
                    );
                  },
                  title: Text(noteModel.title),
                  subtitle: Text(noteModel.content),
                  tileColor: Color(noteModel.hexColor),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      viewModel
                          .deleteNote(noteModel.id);
                      setState(() {

                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push("/create");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
