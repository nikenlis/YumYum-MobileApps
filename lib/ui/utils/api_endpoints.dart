class ApiEndpoints {
  static const String baseUrl = 'https://yumyum.beliaplikasi.shop/api/';
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
  static _Merchant merchant = _Merchant();
}

class _AuthEndPoints {
  final String login = 'auth/login';
}

class _Merchant{
  final String allData = 'merchant';
}