import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yumyum_amicta/models/merchant_model/super_merchant_request_model.dart';
import 'package:yumyum_amicta/models/merchant_model/super_merchant_response_model.dart';
import 'package:yumyum_amicta/ui/auth/core/cache_manager.dart';
import 'package:yumyum_amicta/ui/utils/api_endpoints.dart';

class GetMerchantOverview with CacheManager {
  Future<SuperMerchantResponseModel?> fetchMerchants(
      SuperMerchantRequestModel model) async {
    final token = getToken();
    print('Token buat ambil data merchant: $token');
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
        //print('Datanya: ${json['data']}');
        return SuperMerchantResponseModel.fromJson(json);
      } else {
        print(jsonDecode(response.body)["message"]);
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
