import 'package:flutter/material.dart';
import 'package:flutter_music/commonWidgets/CustomPlaylistItem.dart';
import 'package:flutter_music/commonWidgets/CustomSliverGrid.dart';
import 'package:flutter_music/httpRequest.dart';
import 'package:flutter_music/redux/actions.dart';
import 'package:flutter_music/redux/appState.dart';
import 'package:flutter_music/viewModel/recommendPlaylitItem.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class RecommendPlayListHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 16, 10, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '推荐歌单',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                decoration: ShapeDecoration(
                  shape: StadiumBorder(
                    side: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
                child: Text(
                  '歌单广场',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RecommendPlaylistGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List>(
      distinct: true,
      converter: (Store store) => store.state.recommendPlaylist,
      onInit: (Store store) {
        httpRequest.get('/personalized', queryParameters: {'limit': 6}).then(
            (playlist) {
          List recommendPlaylist = playlist.data['result']
              .map((item) => RecommendPlaylistItem(
                  id: item['id'],
                  picUrl: item['picUrl'],
                  name: item['name'],
                  playCount: item['playCount']))
              .toList();
          store.dispatch(SetRecommendPlaylistAction(recommendPlaylist));
        });
      },
      builder: (BuildContext context, List recommendPlaylist) {
        return SliverPadding(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
          sliver: CustomSliverGrid(
              children: recommendPlaylist
                  .map((item) => CustomPlaylistItem(
                      id: item.id,
                      name: item.name,
                      playCount: item.playCount,
                      picUrl: item.picUrl))
                  .toList()),
        );
      },
    );
  }
}
