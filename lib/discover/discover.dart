import 'package:flutter/material.dart';
import 'package:flutter_music/commonWidgets/CustomIcons.dart';
import 'package:flutter_music/discover/widget/CategoryButton.dart';
import 'package:flutter_music/discover/widget/DiscoverBanner.dart';
import 'package:flutter_music/discover/widget/RecommendPlayList.dart';

class Discover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CustomIcons.microPhone),
          onPressed: () {},
        ),
        title: Text('发现'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          DiscoverBanner(), //轮播图
          CategoryButton(), //分类按钮
          RecommendPlayListHeader(), //推荐歌单头
          RecommendPlaylistGrid(), //推荐歌单Grid
        ],
      ),
    );
  }
}
