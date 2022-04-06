class wallpaperModel{

  String ?photographer;
  String ?photographer_url;
  int ?photographer_id;

  srcModel ?src;

  wallpaperModel({this.photographer, this.photographer_url, this.photographer_id, this.src});
  
  factory wallpaperModel.fromMap(Map<String, dynamic> jsonData) {
    return wallpaperModel(
        photographer_url: jsonData["photographer_url"],
        photographer_id: jsonData["photographer_id"],
        photographer: jsonData["photographer"],
        src: srcModel.fromMap(jsonData["src"]
        ));
  }

}

class srcModel{

  String ?original;
  String ?small;
  String ?portrait;

  srcModel({this.small, this.original, this.portrait});

  factory srcModel.fromMap(Map<String, dynamic> jsonData) {
    return srcModel(
        small: jsonData["small"],
        original: jsonData["original"],
        portrait: jsonData["portrait"]);
  }
  
}
