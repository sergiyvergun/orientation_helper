import 'package:flutter/material.dart';

import 'custom_bottom_sheet.dart';

class MoreButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.more_horiz,
        color: Colors.white,
      ),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (_) {
              return CustomBottomSheet();
            });
      },
    );
  }
}
