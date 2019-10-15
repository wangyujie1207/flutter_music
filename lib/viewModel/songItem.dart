
import 'artistItem.dart';

class SongItem {
  int id;
  int mvId;
  String name;
  AlbumModel album;
  List<ArtistItem> artists;

  SongItem({this.name, this.id, this.artists, this.mvId, this.album});

  factory SongItem.fromJson(Map<String, dynamic> json) {
    var singers = json['ar'] as List;
    return SongItem(
        id: json['id'],
        mvId: json['mv'],
        name: json['name'],
        album: AlbumModel.fromJson(json['al']),
        artists: singers
            .map((singer) => ArtistItem(id: singer['id'], name: singer['name']))
            .toList());
  }
}

//专辑
class AlbumModel {
  int id;
  String name;
  String picUrl;

  AlbumModel({this.id, this.name, this.picUrl});

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
        id: json['id'], name: json['name'], picUrl: json['picUrl']);
  }
}
