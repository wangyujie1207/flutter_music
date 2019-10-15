import 'package:flutter/material.dart';

class CustomSliverGrid extends StatelessWidget {
  final List children;

  const CustomSliverGrid({Key key, @required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 3,
      childAspectRatio: 0.78,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: children,
    );
  }
}
