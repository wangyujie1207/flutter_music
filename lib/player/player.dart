import 'package:flutter/material.dart';
import 'package:flutter_music/commonWidgets/CustomBackButton.dart';
import 'package:flutter_music/player/widget/PlayControl.dart';
import 'package:flutter_music/player/widget/SeekBar.dart';
import 'package:flutter_music/player/widget/ShareButtons.dart';

class Player extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: CustomBackButton(
          color: Colors.white,
        ),
        title: Text('ss'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(),
          ),
          ShareButtons(),
          SeekBar(),
          PlayControl()
        ],
      ),
    );
  }
}
