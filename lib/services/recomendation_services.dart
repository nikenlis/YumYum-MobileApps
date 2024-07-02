import 'package:yumyum_amicta/models/recomendation_model/recomendation_model.dart';
import 'package:yumyum_amicta/ui/auth/core/cache_manager.dart';
import 'package:yumyum_amicta/ui/utils/api_endpoints.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RecomendationServices with CacheManager {
  Future<RecomendationResponseModel?> fetchHomeProductRecomendation() async {
    final token = getToken();
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Secret': 'yUmYuM1!',
        'Authorization': 'Bearer $token',
      };

      Map model = {
        "limit_product": 8,
        "search": "",
        "hide_merchant": false,
        "hide_category": true,
        "hide_inacticve_product": true
      };

      var url = Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.recomendation.allData);
      http.Response response =
          await http.post(url, body: jsonEncode(model), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        // print(json);
        return RecomendationResponseModel.fromJson(json);
      } else {
        print(jsonDecode(response.body)["message"]);
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
