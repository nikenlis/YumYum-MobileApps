class MerchantModel {
  String? username;
  String? name;
  String? photo;
  String? description;
  int? isOpen;
  String? encryptedId;


  MerchantModel(
      {this.username,
      this.name,
      this.photo,
      this.description,
      this.isOpen,
      this.encryptedId,
});

  MerchantModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    name = json['name'];
    photo = json['photo'];
    description = json['description'];
    isOpen = json['is_open'];
    encryptedId = json['encrypted_id'];
  } //response

}