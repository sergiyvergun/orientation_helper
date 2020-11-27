import 'package:flutter/material.dart';

import '../app/routes.dart';
import '../widgets/cover.dart';
import '../widgets/head.dart';
import '../widgets/subhead.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.pink,
      ),
      body: ListView.builder(
          itemCount: 15,
          padding: EdgeInsets.only(top: 15),
          itemBuilder: (context, int index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 13, vertical: 7),
              color: Colors.grey[900],
              height: 120,
              child: FlatButton(
                onPressed: () {
                  /// Navigate with pushNamed
                  Navigator.of(context).pushNamed(AppRoutes.details.name);
                },
                padding: EdgeInsets.all(0),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Cover(),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, bottom: 20, top: 22, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Head(),
                            Container(height: 15),
                            Subhead(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
