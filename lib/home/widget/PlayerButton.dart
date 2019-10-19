import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/commonWidgets/CustomIcons.dart';
import 'package:flutter_music/player/player.dart';
import 'package:flutter_music/redux/appState.dart';
import 'package:flutter_music/redux/models.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class PlayerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: StoreConnector<AppState,AudioPlayer>(
        distinct: true,
        converter: (Store store) => store.state.audioPlayer,
        builder: (BuildContext context, audioPlayer) {
          return IconButton(
            icon: Icon(CustomIcons.rank),
            onPressed: () {
              Navigator.of(context)
                  .push(CupertinoPageRoute(builder: (BuildContext context) {
                return Player();
              }));
            },
          );
        },
        onInit: (Store store){
          store.state.audioPlayer
            ..onAudioPositionChanged.listen((p) {
              print(p);
            })..onPlayerError.listen((String msg){
              print(msg);
          })..onDurationChanged.listen((d){
            print(d);
          })..onPlayerStateChanged.listen((state){
            print(state);
          })..onPlayerCompletion.listen((e){
            print(e);
          });
        },
      ),
    );
  }
}
