import 'package:flutter/material.dart';
import 'package:flutter_music/commonWidgets/CustomIcons.dart';
import 'package:flutter_music/utils/handleCount.dart';
import 'package:flutter_music/viewModel/songItem.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class Playlist extends StatelessWidget {
  final List<SongItem> songList;
  final int subscribedCount;
  final int id;

  const Playlist({Key key, this.songList, this.subscribedCount, this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () {},
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(CustomIcons.play),
                  ),
                  RichText(
                    text: TextSpan(
                        text: '播放全部',
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: '(共${songList.length}首)',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                            ),
                          )
                        ]),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 6.0),
                decoration: ShapeDecoration(
                  shape: StadiumBorder(),
                  shadows: [
                    BoxShadow(
                      color: Colors.redAccent,
                      blurRadius: 2.0, // 模糊半径
                      offset: Offset(1.0, 1.0),
                    )
                  ],
                  gradient: LinearGradient(
                    colors: [Colors.redAccent, Colors.red],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Text(
                  '+ 收藏(${calculateCount(subscribedCount)})',
                  style: TextStyle(fontSize: 12.0, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          SongItem item = songList[index];
          return GestureDetector(
            onTap: () {},
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      (index + 1).toString(),
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          item.name,
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                            item.artists
                                    .map((artist) => artist.name)
                                    .toList()
                                    .join('/') +
                                ' - ${item.album.name}',
                            style:
                                TextStyle(fontSize: 10.0, color: Colors.grey),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis)
                      ],
                    ),
                  )),
                  Row(
                    children: <Widget>[
                      item.mvId > 0
                          ? Icon(
                              CustomIcons.video,
                              color: Colors.grey,
                            )
                          : Container(),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child:
                            Icon(CustomIcons.more_vertical, color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        }, childCount: songList.length),
      ),
    );
  }
}
