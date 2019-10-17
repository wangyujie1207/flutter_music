import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/redux/appState.dart';
import 'package:flutter_music/redux/middleware.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'home/home.dart';

void main() {
  Store store = Store<AppState>(
    appReducer,
    initialState: AppState(
        banners: [],
        recommendPlaylist: [],
        showNewSong: false,
        newAlbum: [],
        newSong: [],
        playlistModel: null,
        audioPlayer: AudioPlayer(),
        currentIndex: null,
        currentSong: null,
        currentUrl: null),
    middleware: appMiddleware(),
  );

  runApp(MyApp(
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  final Store store;

  MyApp({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Music',
        theme: ThemeData(
            primaryColor: Color(0xFFDB2C1F),
            primaryTextTheme: TextTheme(
                title: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    height: 1.5)),
            primaryIconTheme: IconThemeData(color: Colors.black),
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
              color: Colors.white,
              elevation: 0.0, // 去掉阴影
              textTheme: TextTheme(
                  title: TextStyle(color: Colors.black, fontSize: 18)),
              iconTheme: IconThemeData(color: Colors.black),
            ),
            tabBarTheme: TabBarTheme(
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Color(0xFFDB2C1F),
              unselectedLabelColor: Colors.black,
            ),
            disabledColor: Color(0xFFF7F7F7),
            indicatorColor: Colors.white,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent),
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
