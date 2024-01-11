import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
        title: Text('Your note'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.list))
        ],
      ),
      body: ListView(
        children: viewModel.box.values.map((noteModel) {
          return ListTile(
            title: Text(noteModel.title),
            subtitle: Text(noteModel.content),
            tileColor: Color(noteModel.hexColor),
            trailing: const Icon(Icons.delete),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push("/create");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
