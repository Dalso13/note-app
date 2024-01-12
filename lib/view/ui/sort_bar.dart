import 'package:flutter/material.dart';
import 'package:note_app/view/view_model/main_view_model.dart';

class SortBar {
  Widget getMenu(MainViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ToggleButtons(
          isSelected: viewModel.state.isMenu,
          children: [
            Text('제목'),
            Text('날짜'),
            Text('색상'),
          ],
          onPressed: (int index) {
            if (viewModel.state.isMenu[index]) {
              return;
            }
            viewModel.changeIsMenu(index);
          },
        ),
        Row(
          children: [
            Container(
              color: !viewModel.state.isOrder ? Colors.deepPurple[50] : Colors.white,
              child: TextButton(
                onPressed: () {
                  if (viewModel.state.isOrder) {
                    viewModel.changeIsOrder();
                  }
                },
                child: Text('오름차순'),
              ),
            ),
            Container(
              color: viewModel.state.isOrder ? Colors.deepPurple[50] : Colors.white,
              child: TextButton(
                  onPressed: () {
                    if (!viewModel.state.isOrder) {
                      viewModel.changeIsOrder();
                    }
                  },
                  child: Text('오름차순')),
            )
          ],
        ),
      ],
    );
  }
}
