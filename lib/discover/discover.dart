import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/commonWidgets/CustomIcons.dart';
import 'package:flutter_music/commonWidgets/CustomScrollContainer.dart';
import 'package:flutter_music/discover/widget/CategoryButton.dart';
import 'package:flutter_music/discover/widget/DiscoverBanner.dart';
import 'package:flutter_music/discover/widget/NewAlbumAndSong.dart';
import 'package:flutter_music/discover/widget/RecommendPlayList.dart';
import 'package:flutter_music/redux/actions.dart';
import 'package:flutter_music/redux/appState.dart';
import 'package:flutter_music/viewModel/albumItem.dart';
import 'package:flutter_music/viewModel/artistItem.dart';
import 'package:flutter_music/viewModel/bannerItem.dart';
import 'package:flutter_music/viewModel/recommendPlaylitItem.dart';
import 'package:flutter_music/viewModel/songItem.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../httpRequest.dart';

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
      body: CustomScrollContainer(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            CupertinoSliverRefreshControl(
              onRefresh: (){
                return _handleRefresh(context);
              },
            ),
            DiscoverBanner(), //轮播图
            CategoryButton(), //分类按钮
            RecommendPlayListHeader(), //推荐歌单头
            RecommendPlaylistGrid(), //推荐歌单Grid
            NewAlbumAndSong(), //新歌新碟
            //新碟新歌Grid
            StoreConnector<AppState, bool>(
              distinct: true,
              converter: (Store store) => store.state.showNewSong,
              builder: (BuildContext context, bool showNewSong) {
                return showNewSong ? NewSongGrid() : NewAlbumGrid();
//              return NewAlbumGrid();
              },
            )
          ],
        ),
      ),
    );
  }
  // 下拉刷新
  _handleRefresh(BuildContext context) async{
    List response = await Future.wait([
      httpRequest.get('/banner', queryParameters: {'type': 2}),
      httpRequest.get('/personalized', queryParameters: {'limit': 6}),
      httpRequest.get('/top/album', queryParameters: {'limit': 3}),
      httpRequest.get('/top/song', queryParameters: {'type': 0})
    ]);
    //轮播图
    List banners = response[0]
        .data['banners']
        .map((banner) => BannerItem(pic: banner['pic']))
        .toList();
    //推荐歌单
    List recommendPlaylist = response[1]
        .data['result']
        .map((item) => RecommendPlaylistItem(
        id: item['id'],
        picUrl: item['picUrl'],
        name: item['name'],
        playCount: item['playCount']))
        .toList();
    //新碟
    List albums = response[2]
        .data['albums']
        .map((album) => AlbumItem(
        id: album['id'],
        picUrl: album['picUrl'],
        name: album['name'],
        artists: (album['artists'] as List)
            .map((artist) =>
            ArtistItem(id: artist['id'], name: artist['name']))
            .toList()))
        .toList();
    //新歌
    List songs = response[3]
        .data['data']
        .sublist(0, 3)
        .map((song) => SongItem(
        id: song['id'],
        name: song['name'],
        album: AlbumModel.fromJson(song['album']),
        artists: (song['artists'] as List)
            .map((artist) =>
            ArtistItem(id: artist['id'], name: artist['name']))
            .toList()))
        .toList();
    Store<AppState> store = StoreProvider.of<AppState>(context);
    store.dispatch(SetBannerAction(banners));
    store.dispatch(SetRecommendPlaylistAction(recommendPlaylist));
    store.dispatch(SetNewAlbumAction(albums));
    store.dispatch(SetNewSongAction(songs));
  }
}
