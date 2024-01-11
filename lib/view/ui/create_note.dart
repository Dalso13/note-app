import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/view/view_model/main_view_model.dart';

import '../../di/di_setup.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final List<int> _hexList = [
    0xffd0e0e3,
    0xfff7a583,
    0xfffb958b,
    0xffd9d2e9,
    0xffc39999,
    0xffaebbc7
  ];
  final List<bool> _isSelected = List.generate(6, (_) => false);
  late int _selectedColor;

  @override
  void initState() {
    super.initState();
    setState(() {
      _isSelected[0] = true;
      _selectedColor = _hexList[0];
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(_selectedColor),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ToggleButtons(
                  isSelected: _isSelected,
                  children: _hexList.map((e) => getButton(e)).toList(),
                  onPressed: (int index) {
                    if (_isSelected[index] == false &&
                        _isSelected.lastIndexOf(true) != -1) {
                      _isSelected[_isSelected.lastIndexOf(true)] = false;
                    }
                    setState(() {
                      _isSelected[index] = !_isSelected[index];
                      _selectedColor = _hexList[index];
                    });
                  },
                  selectedBorderColor: Colors.black,

                )),
            TextField(
              controller: _titleController,
              maxLength: 20,
              decoration: InputDecoration(
                hintText: 'Enter title...',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(_selectedColor)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(_selectedColor)),
                ),
              ),
            ),
            TextField(
              maxLines: 20,
              controller: _contentController,
              decoration: InputDecoration(
                hintText: 'Enter some content',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(_selectedColor)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(_selectedColor)),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_titleController.text.isEmpty &&
              _contentController.text.isEmpty) {
            const snackBar = SnackBar(
              content: Text('작성해주세요'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            return;
          }
          getIt<MainViewModel>().setBox(title: _titleController.text,
              content: _contentController.text,
              color: _selectedColor);
          context.push('/');
        },
        child: const Icon(Icons.save),
      ),
    );
  }

  Widget getButton(int hex) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Color(hex),
        ),
        width: 50,
        height: 50,
      ),
    );
  }
}
