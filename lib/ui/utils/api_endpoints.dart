class ApiEndpoints {
  static const String baseUrl = 'https://yumyum.beliaplikasi.shop/api/';
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
  static _MerchantEndPoits merchant = _MerchantEndPoits();
  static _CategoryEndPoits category = _CategoryEndPoits();
  static _RecomendationEndPoits recomendation = _RecomendationEndPoits();
}

class _AuthEndPoints {
  final String login = 'auth/login';
}

class _MerchantEndPoits{
  final String allData = 'merchant';
  final String specificMerchant = 'merchant/detail';
}

class _CategoryEndPoits{
  final String allData = 'category';
  final String specificCategory = 'category/detail';
}

class _RecomendationEndPoits{
  final String allData = 'product';
}
