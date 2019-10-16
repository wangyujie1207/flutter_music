import 'package:flutter/material.dart';
import 'package:flutter_music/commonWidgets/CustomIcons.dart';
import 'package:flutter_music/utils/handleCount.dart';

class PlaylistButtons extends StatelessWidget {
  final int commentCount;
  final int shareCount;

  PlaylistButtons({this.commentCount, this.shareCount});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(bottom: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Buttons(
              icon: CustomIcons.comment,
              text: calculateCount(commentCount),
            ),
            Buttons(
              icon: CustomIcons.share,
              text: calculateCount(shareCount),
            ),
            Buttons(
              icon: CustomIcons.download,
              text: '下载',
            ),
            Buttons(
              icon: CustomIcons.checkbox,
              text: '多选',
            ),
          ],
        ),
      ),
    );
  }
}

//按钮样式
class Buttons extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  Buttons({this.onTap, this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
      child: Column(
        children: <Widget>[
          Icon(icon, color: Colors.white),
          Text(text, style: TextStyle(color: Colors.white, height: 1.5))
        ],
      ),
    ));
  }
}
