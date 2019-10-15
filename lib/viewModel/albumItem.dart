
import 'artistItem.dart';

class AlbumItem {
  int id;
  String picUrl;
  String name;
  List<ArtistItem> artists;

  AlbumItem({this.name, this.picUrl, this.id, this.artists});
}
