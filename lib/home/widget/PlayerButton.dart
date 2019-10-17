import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/commonWidgets/CustomIcons.dart';
import 'package:flutter_music/player/player.dart';

class PlayerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: IconButton(
        icon: Icon(CustomIcons.rank),
        onPressed: () {
          Navigator.of(context)
              .push(CupertinoPageRoute(builder: (BuildContext context) {
            return Player();
          }));
        },
      ),
    );
  }
}
