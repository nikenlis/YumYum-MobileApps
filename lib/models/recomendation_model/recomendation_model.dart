class RecomendationResponseModel {
  List<RecomendationProductModel>? data;

  RecomendationResponseModel({this.data});

  RecomendationResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <RecomendationProductModel>[];
      json['data'].forEach((v) {
        data!.add(RecomendationProductModel.fromJson(v));
      });
    }
  }

}

class RecomendationProductModel {
  String? name;
  String? image;
  String? description;
  String? price;
  String? estimate;
  int? active;
  String? encryptedId;
  RecomendationMerchantModel? merchant;

  RecomendationProductModel(
      {this.name,
      this.image,
      this.description,
      this.price,
      this.estimate,
      this.active,
      this.encryptedId,
      this.merchant});

  RecomendationProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    description = json['description'];
    price = json['price'];
    estimate = json['estimate'];
    active = json['active'];
    encryptedId = json['encrypted_id'];
    merchant = json['merchant'] != null
        ? RecomendationMerchantModel.fromJson(json['merchant'])
        : null;
  }
}

class RecomendationMerchantModel {
  String? username;
  String? name;
  String? photo;
  String? description;
  int? isOpen;
  String? deviceId;
  String? encryptedId;

  RecomendationMerchantModel(
      {this.username,
      this.name,
      this.photo,
      this.description,
      this.isOpen,
      this.deviceId,
      this.encryptedId});

  RecomendationMerchantModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    name = json['name'];
    photo = json['photo'];
    description = json['description'];
    isOpen = json['is_open'];
    deviceId = json['device_id'];
    encryptedId = json['encrypted_id'];
  }
}
