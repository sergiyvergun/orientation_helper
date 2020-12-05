import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: true,
      backgroundColor: Colors.grey[700],
      builder: (_) {
        return SafeArea(
          child: Wrap(
            children: [
              BottomSheetTile(),
              BottomSheetTile(),
            ],
          ),
        );
      },
      onClosing: () {},
    );
  }
}

class BottomSheetTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.black87,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    );
  }
}
