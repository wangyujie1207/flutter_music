class SongCommentsModel {
  List<SongCommentItemModel> topComments;
  List<SongCommentItemModel> hotComments;
  List<SongCommentItemModel> comments;
  bool moreHot;
  bool more;
  int total;

  SongCommentsModel(
      {this.total,
      this.topComments,
      this.comments,
      this.hotComments,
      this.more,
      this.moreHot});

  factory SongCommentsModel.fromJson(Map<String, dynamic> json) {
    return SongCommentsModel(
        topComments: (json['topComments'] as List)
            .map((comment) => SongCommentItemModel.fromJson(comment))
            .toList(),
        hotComments: json['hotComments'] == null
            ? []
            : (json['hotComments'] as List)
                .map((comment) => SongCommentItemModel.fromJson(comment))
                .toList(),
        comments: (json['comments'] as List)
            .map((comment) => SongCommentItemModel.fromJson(comment))
            .toList(),
        more: json['more'],
        moreHot: json['moreHot'],
        total: json['total']);
  }
}

//歌曲评论
class SongCommentItemModel {
  bool liked;
  int likedCount;
  String content;
  List beReplied;
  UserModel user;
  int time;

  SongCommentItemModel(
      {this.user,
      this.beReplied,
      this.content,
      this.liked,
      this.likedCount,
      this.time});

  factory SongCommentItemModel.fromJson(Map<String, dynamic> json) {
    return SongCommentItemModel(
        liked: json['liked'],
        likedCount: json['likedCount'],
        content: json['content'],
        beReplied: (json['beReplied'] as List)
            .map((reply) => ReplyModel.fromJson(reply))
            .toList(),
        user: UserModel.fromJson(json['user']),
        time: json['time']);
  }
}

//用户信息
class UserModel {
  String nickname;
  String avatarUrl;

  UserModel({this.avatarUrl, this.nickname});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(nickname: json['nickname'], avatarUrl: json['avatarUrl']);
  }
}

//回复
class ReplyModel {
  String content;
  UserModel user;

  ReplyModel({this.content, this.user});

  factory ReplyModel.fromJson(Map<String, dynamic> json) {
    return ReplyModel(
        content: json['content'], user: UserModel.fromJson(json['user']));
  }
}
