import 'package:flutter/material.dart';
import 'package:flutter_music/commonWidgets/CustomBackButton.dart';
import 'package:flutter_music/discover/widget/PlaylistView.dart';
import 'package:flutter_music/httpRequest.dart';
import 'package:flutter_music/viewModel/playlistTag.dart';

class PlaylistSquare extends StatefulWidget {
  @override
  _PlaylistSquareState createState() => _PlaylistSquareState();
}

class _PlaylistSquareState extends State<PlaylistSquare> {
  List _hotPlaylistCategory = [];

  @override
  void initState() {
    httpRequest.get('/playlist/hot').then((response) {
      setState(() {
        _hotPlaylistCategory = response.data['tags']
            .map((tag) => PlaylistTag(id: tag['id'], name: tag['name']))
            .toList();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_hotPlaylistCategory.length > 0) {
      return DefaultTabController(
        length: _hotPlaylistCategory.length,
        child: Scaffold(
          appBar: AppBar(
            leading: CustomBackButton(),
            title: Text('歌单广场'),
            elevation: 1.0,
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: TabBar(
                      isScrollable: true,
                      indicatorColor: Theme.of(context).primaryColor,
                      tabs: _hotPlaylistCategory
                          .map((item) => Tab(
                                text: item.name,
                              ))
                          .toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Icon(
                      Icons.category,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: _hotPlaylistCategory
                .map((item) => PlaylistView(cat: item.name))
                .toList(),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
