class HomeCategoryResponseModel {
  List<HomeCategoryModel>? data;

  HomeCategoryResponseModel({this.data});

  HomeCategoryResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <HomeCategoryModel>[];
      json['data'].forEach((v) {
        data!.add(HomeCategoryModel.fromJson(v));
      });
    }
  }

}

class HomeCategoryModel {
  String? name;
  String? image;
  String? description;
  String? encryptedId;

  HomeCategoryModel({this.name, this.image, this.description, this.encryptedId});

  HomeCategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    description = json['description'];
    encryptedId = json['encrypted_id'];
  }

}
