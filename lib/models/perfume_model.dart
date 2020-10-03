
class Result {

  List<Perfume> results;

  Result.fromJson(Map<String, dynamic> parsed ) {
    if(parsed['results'] != null ) {
      results = parsed['results'].map<Perfume>( (result) {
        return Perfume.fromJsonMap(result);
      }).toList();
    }
  }

}

class Perfume {
  int id;
  String name;
  String desc;
  double score;
  double price;
  String imgPath;

  Perfume.fromJsonMap(Map<String, dynamic> parsed) {
    id      = parsed['id'];
    name    = parsed['name'];
    desc    = parsed['desc'];
    score   = parsed['score'];
    price   = parsed['price'];
    imgPath = parsed['imgPath'];
  }
}
