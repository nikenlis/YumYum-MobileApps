import 'dart:convert';
import 'package:yumyum_amicta/ui/auth/models/login_request_model.dart';
import 'package:yumyum_amicta/ui/auth/models/login_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:yumyum_amicta/ui/utils/api_endpoints.dart';

class LoginService {
  Future<LoginResponseModel?> fetchLogin(LoginRequestModel model) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Secret': 'yUmYuM1!',
      };
      var url =
          Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.authEndPoints.login);
      http.Response response =
          await http.post(url, body: jsonEncode(model), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        var token = json["data"][ "token"];
        
        return LoginResponseModel(token: token);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
