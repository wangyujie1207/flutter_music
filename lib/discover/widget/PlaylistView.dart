import 'package:flutter/material.dart';
import 'package:flutter_music/commonWidgets/CustomPlaylistItem.dart';
import 'package:flutter_music/commonWidgets/CustomScrollContainer.dart';
import 'package:flutter_music/commonWidgets/CustomSliverGrid.dart';
import 'package:flutter_music/commonWidgets/LoadMore.dart';
import 'package:flutter_music/viewModel/recommendPlaylitItem.dart';

import '../../httpRequest.dart';

class PlaylistView extends StatefulWidget {
  final String cat;

  const PlaylistView({Key key, this.cat}) : super(key: key); //分类

  @override
  _PlaylistViewState createState() => _PlaylistViewState();
}

class _PlaylistViewState extends State<PlaylistView>
    with AutomaticKeepAliveClientMixin {
  List _playlist = [];
  bool _hasMore = true;
  bool _isLoading = false;
  ScrollController _scrollController = ScrollController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _getPlaylist();
    _scrollController.addListener(() {
      if (_hasMore &&
          _scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !_isLoading) {
        _isLoading = true;
        _getPlaylist();
      }
    });
    super.initState();
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollContainer(
      child: CustomScrollView(
        controller: _scrollController,
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.all(10.0),
            sliver: CustomSliverGrid(
              children: _playlist
                  .map((item) => CustomPlaylistItem(
                        id: item.id,
                        playCount: item.playCount,
                        picUrl: item.picUrl,
                        name: item.name,
                      ))
                  .toList(),
            ),
          ),
          LoadMore(noMore: !_hasMore,)
        ],
      ),
    );
  }

  //获取歌单列表
  _getPlaylist() {
    httpRequest.get('/top/playlist', queryParameters: {
      'cat': widget.cat,
      'limit': 21,
      'offset': _playlist.length
    }).then((response) {
      var data = response.data;
      setState(() {
        _playlist.addAll(data['playlists']
            .map((playlist) => RecommendPlaylistItem(
                id: playlist['id'],
                name: playlist['name'],
                picUrl: playlist['coverImgUrl'],
                playCount: playlist['playCount']))
            .toList());
        _hasMore = data['more'];
        _isLoading = false;
      });
    });
  }
}
