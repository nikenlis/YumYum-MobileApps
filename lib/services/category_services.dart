import 'dart:convert';

import 'package:yumyum_amicta/models/category_model/category_detail_model.dart';
import 'package:yumyum_amicta/models/category_model/home_category_model.dart';
import 'package:yumyum_amicta/ui/auth/core/cache_manager.dart';
import 'package:yumyum_amicta/ui/utils/api_endpoints.dart';
import 'package:http/http.dart' as http;

class CategoryServices with CacheManager {
  Future<HomeCategoryResponseModel?> fetchHomeCategoryItem() async {
    final token = getToken();
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Secret': 'yUmYuM1!',
        'Authorization': 'Bearer $token',
      };

      Map model = {
        "limit_product": 0,
        "search": "",
        "hide_merchant": false,
        "hide_inacticve_product": false
      };

      var url =
          Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.category.allData);
      http.Response response =
          await http.post(url, body: jsonEncode(model), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        // print(json);
        return HomeCategoryResponseModel.fromJson(json);
      } else {
        print(jsonDecode(response.body)["message"]);
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }


  Future<CategoryModel?> fetchCategoryDetail(CategoryDetailRequestModel model) async {
    final token = getToken();
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Secret': 'yUmYuM1!',
        'Authorization': 'Bearer $token',
      };

      var url =
          Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.category.specificCategory);
      http.Response response =
          await http.post(url, body: jsonEncode(model), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return CategoryModel.fromJson(json['data']);
      } else {
        print(jsonDecode(response.body)["message"]);
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
