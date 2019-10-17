import 'package:flutter_music/viewModel/palylistDetailModel.dart';
import 'package:flutter_music/viewModel/songItem.dart';

//播放列表
class PlaylistModel {
  int id;
  List<SongItem> songList;

  PlaylistModel({this.id, this.songList});
}

//歌曲url
class URLModel {
  int id;
  String url;
  int fee;

  URLModel({this.url, this.id, this.fee});

  factory URLModel.fromJson(Map<String, dynamic> json) {
    return URLModel(id: json['id'], url: json['url'], fee: json['fee']);
  }
}

//播放模式
enum PlayMode { loop, singleLoop, random }
enum ButtonColor { white, black }

//按钮样式
class PlayerButtonModel {
  bool show;
  ButtonColor color;

  PlayerButtonModel(this.show, this.color);
}

//用户信息
class UserInfoModel {
  int loginType;
  ProfileModel profile;

  UserInfoModel({this.loginType, this.profile});

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
        loginType: json['loginType'],
        profile: ProfileModel.fromJson(json['profile']));
  }
}

//用户信息profile
class ProfileModel {
  int userId;
  int playlistCount;
  int followeds;
  int follows;
  int playlistBeSubscribedCount;
  int eventCount;
  String backgroundUrl;
  String avatarUrl;
  String nickname;

  ProfileModel(
      {this.nickname,
        this.avatarUrl,
        this.backgroundUrl,
        this.followeds,
        this.playlistBeSubscribedCount,
        this.follows,
        this.playlistCount,
        this.userId,
        this.eventCount});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
        nickname: json['nickname'],
        avatarUrl: json['avatarUrl'],
        backgroundUrl: json['backgroundUrl'],
        followeds: json['followeds'],
        follows: json['follows'],
        playlistBeSubscribedCount: json['playlistBeSubscribedCount'],
        userId: json['userId'],
        playlistCount: json['playlistCount'],
        eventCount: json['eventCount']);
  }
}

//用户歌单
class UserPlaylistModel {
  int id;
  int trackCount; //歌曲数量
  String name;
  String coverImgUrl;
  bool subscribed; //是否订阅，标志是否是由用户自己创建
  Creator creator;

  UserPlaylistModel(
      {this.trackCount,
        this.name,
        this.coverImgUrl,
        this.id,
        this.subscribed,
        this.creator});

  factory UserPlaylistModel.fromJson(Map<String, dynamic> json) {
    return UserPlaylistModel(
        trackCount: json['trackCount'],
        id: json['id'],
        name: json['name'],
        coverImgUrl: json['coverImgUrl'],
        subscribed: json['subscribed'],
        creator: Creator.fromJson(json['creator']));
  }
}

//用户统计
class UserSubCountModel {
  int programCount;
  int djRadioCount;
  int mvCount;
  int artistCount;
  int newProgramCount;
  int createDjRadioCount;
  int createdPlaylistCount;
  int subPlaylistCount;

  UserSubCountModel(
      {this.djRadioCount,
        this.artistCount,
        this.createDjRadioCount,
        this.createdPlaylistCount,
        this.mvCount,
        this.newProgramCount,
        this.programCount,
        this.subPlaylistCount});

  factory UserSubCountModel.fromJson(Map<String, dynamic> json) {
    return UserSubCountModel(
        artistCount: json['artistCount'],
        programCount: json['programCount'],
        djRadioCount: json['djRadioCount'],
        mvCount: json['mvCount'],
        createDjRadioCount: json['createDjRadioCount'],
        newProgramCount: json['newProgramCount'],
        createdPlaylistCount: json['createdPlaylistCount'],
        subPlaylistCount: json['subPlaylistCount']);
  }
}
