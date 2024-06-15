import 'package:flutter/foundation.dart';

class Merchant with ChangeNotifier{
  final int? id;
  final String? username;
  final String? name;
  final String? imageUrl;
  final String? description;
  final double? password;
  final int? isOpen;
  final String? deviceId;
  final String? rememberToken;

  Merchant({
    @required this.id, 
    @required this.username, 
    @required this.name, 
    @required this.imageUrl, 
    @required this.description,
    @required this.password, 
    this.isOpen = 1, 
    @required this.deviceId, 
    @required this.rememberToken});
}
