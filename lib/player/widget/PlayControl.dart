import 'package:flutter/material.dart';
import 'package:flutter_music/commonWidgets/CustomIcons.dart';

class PlayControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //播放模式
          IconButton(
            icon: Icon(CustomIcons.loop),
            color: Colors.white,
            onPressed: () {},
          ),
          //上一首
          IconButton(
            icon: Icon(CustomIcons.prev),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
          //播放/暂停
          IconButton(
            icon: Icon(CustomIcons.play),
            iconSize: 60.0,
            color: Colors.white,
            onPressed: () {},
          ),
          //下一首
          IconButton(
            icon: Icon(CustomIcons.next),
            color: Colors.white,
            iconSize: 30.0,
            onPressed: () {},
          ),
          //播放列表
          IconButton(
            icon: Icon(CustomIcons.list),
            color: Colors.white,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
