import 'package:flutter/material.dart';

class WatchListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
      child: Column(children: [
        Center(
          child: Text(
            'Watch list',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ]),
    ));
  }
}
