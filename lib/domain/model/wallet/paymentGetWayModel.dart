import 'dart:convert';
/// Amount : 10000
/// Channel : "0"
/// CurrencyISOCode : "682"
/// Language : "en"
/// MerchantID : "1000004439"
/// MessageID : "1"
/// Quantity : "1"
/// ResponseBackURL : "https://api.cfc.sa/api/response-back"
/// ThemeID : "1000000001"
/// TransactionID : 1747860524977
/// UserID : 173
/// Version : "1.0"
/// SecureHash : "e6a6c1613ff9069f7cffbbbec02aa9589ed82c8a7b026eecc75283cf51b4d3ee"
/// RedirectURL : "https://sr-test.payone.io/SmartRoutePaymentWeb/SRPayMsgHandler"

PaymentGetWayModel paymentGetWayModelFromJson(String str) => PaymentGetWayModel.fromJson(json.decode(str));
String paymentGetWayModelToJson(PaymentGetWayModel data) => json.encode(data.toJson());
class PaymentGetWayModel {
  PaymentGetWayModel({
      num? amount, 
      String? channel, 
      String? currencyISOCode, 
      String? language, 
      String? merchantID, 
      String? messageID, 
      String? quantity, 
      String? responseBackURL, 
      String? themeID, 
      num? transactionID, 
      num? userID, 
      String? version, 
      String? secureHash, 
      String? redirectURL,}){
    _amount = amount;
    _channel = channel;
    _currencyISOCode = currencyISOCode;
    _language = language;
    _merchantID = merchantID;
    _messageID = messageID;
    _quantity = quantity;
    _responseBackURL = responseBackURL;
    _themeID = themeID;
    _transactionID = transactionID;
    _userID = userID;
    _version = version;
    _secureHash = secureHash;
    _redirectURL = redirectURL;
}

  PaymentGetWayModel.fromJson(dynamic json) {
    _amount = json['Amount'];
    _channel = json['Channel'];
    _currencyISOCode = json['CurrencyISOCode'];
    _language = json['Language'];
    _merchantID = json['MerchantID'];
    _messageID = json['MessageID'];
    _quantity = json['Quantity'];
    _responseBackURL = json['ResponseBackURL'];
    _themeID = json['ThemeID'];
    _transactionID = json['TransactionID'];
    _userID = json['UserID'];
    _version = json['Version'];
    _secureHash = json['SecureHash'];
    _redirectURL = json['RedirectURL'];
  }
  num? _amount;
  String? _channel;
  String? _currencyISOCode;
  String? _language;
  String? _merchantID;
  String? _messageID;
  String? _quantity;
  String? _responseBackURL;
  String? _themeID;
  num? _transactionID;
  num? _userID;
  String? _version;
  String? _secureHash;
  String? _redirectURL;
PaymentGetWayModel copyWith({  num? amount,
  String? channel,
  String? currencyISOCode,
  String? language,
  String? merchantID,
  String? messageID,
  String? quantity,
  String? responseBackURL,
  String? themeID,
  num? transactionID,
  num? userID,
  String? version,
  String? secureHash,
  String? redirectURL,
}) => PaymentGetWayModel(  amount: amount ?? _amount,
  channel: channel ?? _channel,
  currencyISOCode: currencyISOCode ?? _currencyISOCode,
  language: language ?? _language,
  merchantID: merchantID ?? _merchantID,
  messageID: messageID ?? _messageID,
  quantity: quantity ?? _quantity,
  responseBackURL: responseBackURL ?? _responseBackURL,
  themeID: themeID ?? _themeID,
  transactionID: transactionID ?? _transactionID,
  userID: userID ?? _userID,
  version: version ?? _version,
  secureHash: secureHash ?? _secureHash,
  redirectURL: redirectURL ?? _redirectURL,
);
  num? get amount => _amount;
  String? get channel => _channel;
  String? get currencyISOCode => _currencyISOCode;
  String? get language => _language;
  String? get merchantID => _merchantID;
  String? get messageID => _messageID;
  String? get quantity => _quantity;
  String? get responseBackURL => _responseBackURL;
  String? get themeID => _themeID;
  num? get transactionID => _transactionID;
  num? get userID => _userID;
  String? get version => _version;
  String? get secureHash => _secureHash;
  String? get redirectURL => _redirectURL;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Amount'] = _amount;
    map['Channel'] = _channel;
    map['CurrencyISOCode'] = _currencyISOCode;
    map['Language'] = _language;
    map['MerchantID'] = _merchantID;
    map['MessageID'] = _messageID;
    map['Quantity'] = _quantity;
    map['ResponseBackURL'] = _responseBackURL;
    map['ThemeID'] = _themeID;
    map['TransactionID'] = _transactionID;
    map['UserID'] = _userID;
    map['Version'] = _version;
    map['SecureHash'] = _secureHash;
    map['RedirectURL'] = _redirectURL;
    return map;
  }

}