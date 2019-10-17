import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/account/account.dart';
import 'package:flutter_music/commonWidgets/CustomIcons.dart';
import 'package:flutter_music/discover/discover.dart';
import 'package:flutter_music/friends/friends.dart';
import 'package:flutter_music/home/widget/PlayerButton.dart';
import 'package:flutter_music/mine/mine.dart';
import 'package:flutter_music/video/video.dart';

class Home extends StatelessWidget {
  final List _tabs = [
    {'icon': CustomIcons.discovery, 'text': '发现'},
    {'icon': CustomIcons.video, 'text': '视频'},
    {'icon': CustomIcons.music, 'text': '我的'},
    {'icon': CustomIcons.friends, 'text': '朋友'},
    {'icon': CustomIcons.user, 'text': '账号'}
  ];
  final List<Widget> _pages = [
    Discover(),
    Video(),
    Mine(),
    Friends(),
    Account()
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            activeColor: Theme.of(context).primaryColor,
            items: _tabs
                .map((tab) => BottomNavigationBarItem(
                icon: Icon(tab['icon']), title: Text(tab['text'])))
                .toList(),
          ),
          tabBuilder: (BuildContext context, int index) {
            return _pages[index];
          },
        ),
        Positioned(
          top: 26,
          right: 0.0,
          child: PlayerButton(),
        )
      ],
    );
  }
}
