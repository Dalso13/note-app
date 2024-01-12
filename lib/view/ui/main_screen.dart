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
              children: viewModel.box.map((noteModel) {
                return ListTile(
                  onTap: () {
                    context.push(
                      extra: noteModel,
                      Uri(
                        path: '/put',
                        queryParameters: {
                          'index':
                              '${viewModel.box.toList().indexOf(noteModel)}'
                        },
                      ).toString(),
                    );
                  },
                  title: Text(noteModel.title),
                  subtitle: Text(noteModel.content),
                  tileColor: Color(noteModel.hexColor),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      viewModel
                          .deleteBox(viewModel.box.toList().indexOf(noteModel));
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
