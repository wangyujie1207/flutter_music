import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomScrollContainer extends StatelessWidget {
  final Widget child;

  const CustomScrollContainer({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      child: SafeArea(
        child: child,
      ),
    );
  }
}
