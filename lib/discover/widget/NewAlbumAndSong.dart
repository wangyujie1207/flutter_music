import 'package:flutter/material.dart';
import 'package:flutter_music/commonWidgets/CustomSliverGrid.dart';
import 'package:flutter_music/httpRequest.dart';
import 'package:flutter_music/redux/actions.dart';
import 'package:flutter_music/redux/appState.dart';
import 'package:flutter_music/viewModel/albumItem.dart';
import 'package:flutter_music/viewModel/artistItem.dart';
import 'package:flutter_music/viewModel/songItem.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class NewAlbumAndSong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StoreConnector<AppState, bool>(
                  distinct: true,
                  converter: (Store store) => store.state.showNewSong,
                  builder: (BuildContext context, bool showNewSong) {
                    return GestureDetector(
                      onTap: () {
                        StoreProvider.of<AppState>(context)
                            .dispatch(ShowNewSongAction(false));
                      },
                      child: Text(
                        '新碟',
                        style: TextStyle(
                          fontSize: showNewSong ? 14 : 16,
                          color: showNewSong ? Colors.grey : Colors.black,
                        ),
                      ),
                    );
                  },
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  width: 2,
                  child: Text(
                    '|',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                StoreConnector<AppState, bool>(
                  distinct: true,
                  converter: (Store store) => store.state.showNewSong,
                  builder: (BuildContext context, bool showNewSong) {
                    return GestureDetector(
                      onTap: () {
                        StoreProvider.of<AppState>(context)
                            .dispatch(ShowNewSongAction(true));
                      },
                      child: Text(
                        '新歌',
                        style: TextStyle(
                          fontSize: showNewSong ? 16 : 14,
                          color: showNewSong ? Colors.black : Colors.grey,
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
            StoreConnector<AppState, bool>(
                distinct: true,
                converter: (Store store) => store.state.showNewSong,
                builder: (BuildContext context, bool showNewSong) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
                      decoration: ShapeDecoration(
                        shape: StadiumBorder(
                          side: BorderSide(
                            color: Theme
                                .of(context)
                                .dividerColor,
                          ),
                        ),
                      ),
                      child: Text(
                        showNewSong ? '更多新歌' : '更多新碟',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}


class NewAlbumGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List>(
      distinct: true,
      converter: (Store store) => store.state.newAlbum,
      onInit: (Store store){
        httpRequest
            .get('/top/album', queryParameters: {'limit': 3}).then((response) {
          List albums = response.data['albums']
              .map((album) => AlbumItem(
              id: album['id'],
              picUrl: album['picUrl'],
              name: album['name'],
              artists: (album['artists'] as List)
                  .map((artist) =>
                  ArtistItem(id: artist['id'], name: artist['name']))
                  .toList()))
              .toList();
          store.dispatch(SetNewAlbumAction(albums));
        });
      },
      builder: (BuildContext context, List newAlibum) {
        return SliverPadding(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
          sliver: CustomSliverGrid(
            children: newAlibum.map((item) =>
                Container(child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: FadeInImage.assetNetwork(
                        fit: BoxFit.cover,
                        image: item.picUrl,
                        placeholder: 'images/placeholder.png',
                      ),
                    ),
                    Text(
                      item.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Expanded(
                      child: Text(
                        item.artists.join('-'),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  ],
                ),)).toList(),
          ),
        );
      },
    );
  }
}

class NewSongGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List>(
      distinct: true,
      converter: (Store store) => store.state.newSong,
      builder: (BuildContext context, List newSong) {
        return SliverPadding(
          sliver: CustomSliverGrid(
            children: newSong
                .map((item) => Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: FadeInImage.assetNetwork(
                      fit: BoxFit.cover,
                      image: item.album.picUrl,
                      placeholder: 'images/placeholder.png',
                    ),
                  ),
                  Text(
                    item.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Expanded(
                    child: Text(
                      item.artists.join('-'),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
            ))
                .toList(),
          ),
          padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20.0),
        );
      },
      onInit: (Store store) {
        httpRequest
            .get('/top/song', queryParameters: {'type': 0}).then((response) {
          List songs = response.data['data']
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
          store.dispatch(SetNewSongAction(songs));
        });
      },
    );
  }
}
