import 'package:flutter/material.dart';
import 'package:flutter_music/commonWidgets/CustomIconButton.dart';
import 'package:flutter_music/commonWidgets/CustomIcons.dart';

class CategoryButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Theme.of(context).primaryColor, width: 0.5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CustomIconButton(
              icon: Icons.date_range,
              text: '每日推荐',
            ),
            CustomIconButton(
              icon: CustomIcons.list,
              text: '歌单',
              onTap: () {
                Navigator.pushNamed(context, '/playlistSquare');
              },
            ),
            CustomIconButton(
              icon: CustomIcons.rank,
              text: '排行榜',
            ),
            CustomIconButton(
              icon: CustomIcons.radio,
              text: '电台',
            ),
            CustomIconButton(
              icon: Icons.panorama_horizontal,
              text: '直播',
            ),
          ],
        ),
      ),
    );
  }
}
