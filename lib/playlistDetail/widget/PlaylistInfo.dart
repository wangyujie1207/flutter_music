import 'package:flutter/material.dart';
import 'package:flutter_music/commonWidgets/CustomIcons.dart';
import 'package:flutter_music/utils/handleCount.dart';

class PlaylistInfo extends StatelessWidget {
  final String name;
  final String cover;
  final String avatar;
  final String nickname;
  final String description;
  final num playCount;

  const PlaylistInfo(
      {Key key,
      this.name,
      this.cover,
      this.avatar,
      this.nickname,
      this.description,
      this.playCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.fromLTRB(10.0, 16.0, 10.0, 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 140.0,
              height: 140.0,
              margin: EdgeInsets.only(right: 16.0),
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'images/placeholder.png',
                      image: cover,
                    ),
                  ),
                  Positioned(
                    top: 4.0,
                    right: 4.0,
                    child: Row(
                      children: <Widget>[
                        Icon(CustomIcons.play_line,
                            color: Colors.white, size: 14.0),
                        Text(
                          calculateCount(playCount),
                          style: TextStyle(fontSize: 12.0, color: Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(name,
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                  Container(
                    margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: CircleAvatar(
                              radius: 12.0,
                              backgroundImage: NetworkImage(avatar)),
                        ),
                        Text(
                          nickname,
                          style: TextStyle(color: Colors.white.withOpacity(0.5)),
                        )
                      ],
                    ),
                  ),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.3), fontSize: 12.0),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
