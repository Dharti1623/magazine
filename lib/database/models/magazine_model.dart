/// Model based on you table inside MySQL

class MagazineDatabaseModel {
  const MagazineDatabaseModel({
    this.id,
    this.name,
    this.description,
    this.thumbnail,
    this.url,
  });

  // fromJSON
  factory MagazineDatabaseModel.fromJson(Map<String, dynamic> json) {
    return MagazineDatabaseModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      thumbnail: json['thumbnail'] as String,
      url: json['url'] as String,
    );
  }

  // Create an DatabaseModel given a row.assoc() map
  factory MagazineDatabaseModel.fromRowAssoc(Map<String, String?> json) {
    return MagazineDatabaseModel(
      id: int.tryParse(json['id'].toString()) ,
      name: json['name'],
      description: json['description'],
      thumbnail: json['thumbnail'],
      url: json['url'],
    );
  }

  // toJSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name.toString(),
      'description': description.toString(),
      'thumbnail': thumbnail.toString(),
      'url': url.toString(),
    };
  }

  final int? id;
  final String? name;
  final String? description;
  final String? thumbnail;
  final String? url;
}