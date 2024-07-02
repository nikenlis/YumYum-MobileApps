
import 'package:yumyum_amicta/models/merchant_model/merchant_model.dart';

class MerchantResponseModel {
  List<MerchantModel>? merchantModel;


  MerchantResponseModel({
    this.merchantModel
});

  MerchantResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      var data = json['data'] as List; // Assuming 'data' is a list in JSON
      merchantModel = data.map((e) => MerchantModel.fromJson(e)).toList();
    }
  } //response

}