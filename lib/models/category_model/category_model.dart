class CategoryModel {
  String? name;
  String? image;
  String? description;
  String? encryptedId;

  CategoryModel({this.name, this.image, this.description, this.encryptedId});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    description = json['description'];
    encryptedId = json['encrypted_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['description'] = description;
    data['encrypted_id'] = encryptedId;
    return data;
  }
}