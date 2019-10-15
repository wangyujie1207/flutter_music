class RankModel {
  int id;
  String name;
  String coverImgUrl;
  String updateFrequency;
  String toplistType;
  List<RankTracksModel> tracks;

  RankModel(
      {this.id,
        this.name,
      this.coverImgUrl,
      this.tracks,
      this.updateFrequency,
      this.toplistType});

  factory RankModel.fromJson(Map<String, dynamic> json) {
    return RankModel(
        id: json['id'],
        name: json['name'],
        coverImgUrl: json['coverImgUrl'],
        updateFrequency: json['updateFrequency'],
        tracks: (json['tracks'] as List)
            .map((track) => RankTracksModel.fromJson(track))
            .toList(),
        toplistType: json['ToplistType']);
  }
}

class RankTracksModel {
  String first;
  String second;

  RankTracksModel({this.first, this.second});

  factory RankTracksModel.fromJson(Map<String, dynamic> json) {
    return RankTracksModel(first: json['first'], second: json['second']);
  }
}
