import 'package:example/widgets/more_button.dart';
import 'package:flutter/material.dart';

import '../widgets/cover.dart';
import '../widgets/head.dart';
import '../widgets/subhead.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: OrientationBuilder(
        builder: (context, Orientation orientation) {
          if (orientation == Orientation.portrait) {
            return Column(children: [
              Expanded(child: Cover()),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(height: 10),
                          Head(),
                          Container(height: 11),
                          Subhead(),
                        ],
                      ),
                      Spacer(),
                      MoreButton(),
                    ],
                  ),
                ),
              )
            ]);
          } else {
            return Column(children: [
              Expanded(flex: 5, child: Cover()),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: SafeArea(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(height: 10),
                            Head(),
                            Container(height: 11),
                            Subhead(),
                          ],
                        ),
                        Spacer(),
                        MoreButton(),
                      ],
                    ),
                  ),
                ),
              )
            ]);
          }
        },
      ),
    );
  }
}
