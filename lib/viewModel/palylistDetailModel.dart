
import 'package:flutter_music/viewModel/songItem.dart';

class PlaylistDetailModel {
  int id;
  int commentCount;
  int shareCount;
  int subscribedCount;
  num playCount;
  String name;
  String description;
  String coverImgUrl;
  Creator creator;
  List<SongItem> songList;
  List<Subscriber> subscribers;

  PlaylistDetailModel(
      {this.creator,
      this.id,
      this.name,
      this.playCount,
      this.songList,
      this.commentCount,
      this.shareCount,
      this.description,
      this.coverImgUrl,
      this.subscribedCount,
      this.subscribers});

  factory PlaylistDetailModel.fromJson(Map<String, dynamic> json) {
    var songs = json['tracks'] as List;
    var subs = json['subscribers'] as List;
    return PlaylistDetailModel(
        id: json['id'],
        commentCount: json['commentCount'],
        shareCount: json['shareCount'],
        subscribedCount: json['subscribedCount'],
        playCount: json['playCount'],
        name: json['name'],
        description: json['description'],
        coverImgUrl: json['coverImgUrl'],
        creator: Creator.fromJson(json['creator']),
        songList: songs.map((song) => SongItem.fromJson(song)).toList(),
        subscribers: subs
            .map((subscriber) => Subscriber(
                id: subscriber['id'], avatarUrl: subscriber['avatarUrl']))
            .toList());
  }
}

//创建者信息
class Creator {
  int id;
  String nickname;
  String avatarUrl;

  Creator({this.id, this.avatarUrl, this.nickname});

  factory Creator.fromJson(Map<String, dynamic> json) {
    return Creator(
        id: json['id'],
        nickname: json['nickname'],
        avatarUrl: json['avatarUrl']);
  }
}

//收藏者信息
class Subscriber {
  int id;
  String avatarUrl;

  Subscriber({this.avatarUrl, this.id});
}
