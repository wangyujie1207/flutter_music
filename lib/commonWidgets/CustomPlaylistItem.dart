import 'package:flutter/material.dart';
import 'package:flutter_music/commonWidgets/CustomIcons.dart';
import 'package:flutter_music/utils/handleCount.dart';

class CustomPlaylistItem extends StatelessWidget {
  final String name;
  final String picUrl;
  final num playCount;
  final int id;

  const CustomPlaylistItem(
      {Key key,
      @required this.name,
      @required this.picUrl,
      @required this.playCount,
      @required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: FadeInImage.assetNetwork(
                  placeholder: 'images/placeholder.png',
                  image: picUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 2,
                right: 4,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      CustomIcons.play_line,
                      size: 14,
                      color: Colors.white,
                    ),
                    Text(
                      calculateCount(playCount),
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    )
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12.0),
            ),
          )
        ],
      ),
    );
  }
}
