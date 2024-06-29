import 'package:yumyum_amicta/models/merchant_model/merchant_model.dart';

class SuperMerchantResponseModel{
  List<MerchantModel>? merchantModel;

  SuperMerchantResponseModel({this.merchantModel});

  SuperMerchantResponseModel.fromJson(Map<String, dynamic> json) {
     if (json['data'] != null) {
      var data = json['data'] as List; 
      merchantModel = data.map((e) => MerchantModel.fromJson(e)).toList();
    }
  }
}
