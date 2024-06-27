// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginRequestModel {
  final bool? asMerchant;
  final String? username;
  final String? password;
  final String? deviceId;

  LoginRequestModel({
    this.asMerchant,
    this.username,
    this.password,
    this.deviceId,
  });


  //   Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['as_merchant'] = asMerchant;
  //   data['username'] = username;
  //   data['password'] = password;
  //   data['device_id'] = deviceId;
  //   return data;
  // }

  Map<String, dynamic> toJson() {
    return {
      'as_merchant' : asMerchant,
      'username' : username,
      'password' : password,
      'device_id' : deviceId
    };
  }

}
