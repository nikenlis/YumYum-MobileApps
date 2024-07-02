import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yumyum_amicta/models/merchant_model/merchant_response_model.dart';
import 'package:yumyum_amicta/models/merchant_model/merchant_request_model.dart';
import 'package:yumyum_amicta/models/product_model/product_request_model.dart';
import 'package:yumyum_amicta/models/product_model/merchant_data_model.dart';
import 'package:yumyum_amicta/ui/auth/core/cache_manager.dart';
import 'package:yumyum_amicta/ui/utils/api_endpoints.dart';

class CustomerMerchantService with CacheManager {
  Future<MerchantResponseModel?> fetchMerchants(
      MerchantRequestModel model) async {
    final token = getToken();
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Secret': 'yUmYuM1!',
        'Authorization': 'Bearer $token',
      };

      var url = Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.merchant.allData);
      http.Response response =
          await http.post(url, body: jsonEncode(model), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        // print(json);
        return MerchantResponseModel.fromJson(json);
      } else {
        print(jsonDecode(response.body)["message"]);
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }


  Future<MerchantDataModel?> fetchProducts(
      ProductRequestModel model2) async {
    final token = getToken();
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Secret': 'yUmYuM1!',
        'Authorization': 'Bearer $token',
      };

      var url = Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.merchant.specificMerchant);
      http.Response response =
          await http.post(url, body: jsonEncode(model2), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return MerchantDataModel.fromJson(json['data']);
      } else {
        print(jsonDecode(response.body)["message"]);
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
