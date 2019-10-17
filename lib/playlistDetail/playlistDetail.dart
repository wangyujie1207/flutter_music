import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter_music/commonWidgets/CustomBackButton.dart';
import 'package:flutter_music/commonWidgets/CustomScrollContainer.dart';
import 'package:flutter_music/playlistDetail/widget/Playlist.dart';
import 'package:flutter_music/playlistDetail/widget/PlaylistButtons.dart';
import 'package:flutter_music/playlistDetail/widget/PlaylistInfo.dart';
import 'package:flutter_music/playlistDetail/widget/SubscriberList.dart';
import 'package:flutter_music/viewModel/palylistDetailModel.dart';

import '../httpRequest.dart';

class PlaylistDetail extends StatefulWidget {
  final int id;

  const PlaylistDetail({Key key, this.id}) : super(key: key);

  @override
  _PlaylistDetailState createState() => _PlaylistDetailState();
}

class _PlaylistDetailState extends State<PlaylistDetail> {
  PlaylistDetailModel _playlistDetailModel;

  @override
  void initState() {
    httpRequest.get('/playlist/detail',
        queryParameters: {'id': widget.id, 's': 5}).then((response) {
      setState(() {
        _playlistDetailModel =
            PlaylistDetailModel.fromJson(response.data['playlist']);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_playlistDetailModel != null) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(_playlistDetailModel.coverImgUrl),
          ),
        ),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black87.withOpacity(0.3),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  leading: CustomBackButton(
                    color: Colors.white,
                  ),
                  title: Text(
                    '歌单',
                    style: prefix0.TextStyle(color: Colors.white),
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                ),
                body: CustomScrollContainer(
                  child: NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return [
                        PlaylistInfo(
                          playCount: _playlistDetailModel.playCount,
                          nickname: _playlistDetailModel.creator.nickname,
                          cover: _playlistDetailModel.coverImgUrl,
                          avatar: _playlistDetailModel.creator.avatarUrl,
                          name: _playlistDetailModel.name,
                          description: _playlistDetailModel.description,
                        ),
                        PlaylistButtons(
                          commentCount: _playlistDetailModel.commentCount,
                          shareCount: _playlistDetailModel.shareCount,
                        )
                      ];
                    },
                    body: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                      child: Container(
                        color: Colors.white,
                        child: CustomScrollView(
                          physics: BouncingScrollPhysics(),
                          slivers: <Widget>[
                            Playlist(
                              id: _playlistDetailModel.id,
                              songList: _playlistDetailModel.songList,
                              subscribedCount:
                                  _playlistDetailModel.subscribedCount,
                            ),
                            SubscriberList(
                                subscriberCount:
                                    _playlistDetailModel.subscribedCount,
                                subscribers: _playlistDetailModel.subscribers)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
