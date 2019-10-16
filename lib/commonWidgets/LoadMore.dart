import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadMore extends StatelessWidget {
  final bool noMore;

  LoadMore({this.noMore = false});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          alignment: Alignment.center,
          child: noMore
              ? Text('已加载全部')
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                child: CupertinoActivityIndicator(
                  radius: 7.0,
                ),
                padding: EdgeInsets.only(right: 5.0),
              ),
              Text('正在加载')
            ],
          ),
        ));
  }
}
