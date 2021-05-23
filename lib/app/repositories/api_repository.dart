import 'dart:convert';

import 'package:ancol_taking_order/app/models/login.dart';
import 'package:ancol_taking_order/app/models/master_menu.dart';
import 'package:ancol_taking_order/app/models/order.dart';
import 'package:ancol_taking_order/app/models/post_order.dart';
import 'package:ancol_taking_order/app/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'dart:developer';


class ApiRepository {
  Future<ResultMasterMenu> getMasterMenu(String branchid,
      {http.Client client}) async {
    String url = "http://testresto.pointdd.com/api/allmenu?branchid=$branchid";

    client ??= http.Client();

    var response = await client.get(url);

    var data = json.decode(response.body);

    return ResultMasterMenu.fromJson(data);
  }

  Future<ResultMasterMenu> getMasterMenuFavorite(String branchid,
      {http.Client client}) async {
    String url = "http://testresto.pointdd.com/api/favoritemenu?branchid=$branchid";

    client ??= http.Client();

    var response = await client.get(url);

    var data = json.decode(response.body);

    return ResultMasterMenu.fromJson(data);
  }



  Future<ResultMasterMenu> getAdditionalMenu(String branchId, String menuId,
      {http.Client client}) async {
    String url =
        "http://testresto.pointdd.com/api/menuadd?branchid=$branchId&menuid=$menuId";

    client ??= http.Client();

    var response = await client.get(url);

    var data = json.decode(response.body);

    return ResultMasterMenu.fromJson(data);
  }



  Future<ResultUser> postLoginTable(
      String branchId, String phoneNumber, String tableNo,
      {http.Client client}) async {
    String url = "http://testresto.pointdd.com/api/logintable";

    client ??= http.Client();

    var response = await client.post(url, body: {
      'branchid': branchId,
      'phonenumber': phoneNumber,
      'tableno': tableNo
    });

    var data = json.decode(response.body);

    return ResultUser.fromJson(data);
  }

  Future<dynamic> postOrder(
      String orderNo, String branchId, String tableNo, List detail,
      {http.Client client}) async {
    String url =
        "http://testresto.pointdd.com/api/postorder";

    client ??= http.Client();

    Map<String,String> headers = {
      'Content-type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    };

    final msg = jsonEncode({"orderno": orderNo,
      "tableno": tableNo,
      "branchid": branchId,
      "detail": detail});

    var response = await client.post(url, headers: headers, body: msg,
    );

    var detailData = json.decode(response.body);
    print('LOG DETAIL DATA ' + detailData.toString());

    // ResultOrder order = ResultOrder.fromJson(detailData);

    return detailData;
  }

  Future<ResultOrder> getCheckOrder(
      String orderNo, String branchId, String tableNo,
      {http.Client client}) async {

    String url =
        "http://testresto.pointdd.com/api/checkorder?orderno=$orderNo&branchid=$branchId&tableno=$tableNo";

    client ??= http.Client();

    Map<String,String> headers = {
      'Content-type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    };

    var response = await client.get(url, headers: headers);

    var data = json.decode(response.body);

    print('CHECK ORDER RESULTORDER ' + data.toString());
    print('CHECK ORDER ResultOrder.fromJson(data) ' + ResultOrder.fromJson(data).toString());

    return ResultOrder.fromJson(data);
  }


  Future<ResultOrder> postCloseOrder(
      String branchId, String tableNo, String orderNo,
      {http.Client client}) async {
    String url = "http://testresto.pointdd.com/api/closeorder";

    client ??= http.Client();

    var response = await client.post(url, body: {
      'branchid': branchId,
      'tableno': tableNo,
      'orderno': orderNo
    });

    var data = json.decode(response.body);

    return ResultOrder.fromJson(data);
  }

  Future<dynamic> postLoginMember(String email, String password) async {

    Map<String, String> requestBody = <String,String>{
      'email':email,
      'password': password,
      'client_id': 'test',
    };

    var uri = Uri.parse("http://lomeca.datadigi.id/api/login");

    var requeset = http.MultipartRequest('POST', uri)
      ..fields.addAll(requestBody);

    var response = await requeset.send();

    final respStr = await response.stream.bytesToString();

    var data = json.decode(respStr);
    return data;
  }

  Future<dynamic> postLogoutMember(String token) async {

    Map<String, String> requestBody = <String,String>{
      'client_id': 'test'
    };

    Map<String, String> headers= <String,String>{
      'Authorization':'Bearer $token'
    };

    var uri = Uri.parse("http://lomeca.datadigi.id/api/logout");

    var requeset = http.MultipartRequest('POST', uri)
      ..fields.addAll(requestBody)
      ..headers.addAll(headers);

    var response = await requeset.send();

    final respStr = await response.stream.bytesToString();

    var data = json.decode(respStr);
    return data;
  }

  Future<dynamic> postRegister(String name, String email, String password,
      String passwordConfirmation, String phonenumber, String gender,
  String address) async {

    Map<String, String> requestBody = <String,String>{
      'name':name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'phonenumber': phonenumber,
      'gender': gender,
      'client_id': 'test',
      'app_version': '0',
      'address': address,
      'village_id': '',
      'zipcode': '',
      'birthday': '',
    };

    var uri = Uri.parse("http://lomeca.datadigi.id/api/register");

    var requeset = http.MultipartRequest('POST', uri)
      ..fields.addAll(requestBody);

    var response = await requeset.send();

    final respStr = await response.stream.bytesToString();

    var data = json.decode(respStr);
    return data;
  }

  Future<dynamic> postRedeemVoucher(String redeemId, String token) async {

    Map<String, String> requestBody = <String,String>{
      'redeem_id':redeemId,
      'client_id': 'test',
    };

    Map<String, String> headers= <String,String>{
      'Authorization':'Bearer $token'
    };

    var uri = Uri.parse("http://lomeca.datadigi.id/api/redeempoint");

    var requeset = http.MultipartRequest('POST', uri)
      ..fields.addAll(requestBody)
      ..headers.addAll(headers);

    var response = await requeset.send();

    final respStr = await response.stream.bytesToString();

    var data = json.decode(respStr);
    return data;
  }

  Future<dynamic> postVerifyToken(String verifyMember, String token) async {

    Map<String, String> requestBody = <String,String>{
      'verify_token': verifyMember,
      'client_id': 'test',
    };

    Map<String, String> headers= <String,String>{
      'Authorization':'Bearer $token'
    };

    var uri = Uri.parse("http://lomeca.datadigi.id/api/verifytoken");

    var requeset = http.MultipartRequest('POST', uri)
      ..fields.addAll(requestBody)
      ..headers.addAll(headers);

    var response = await requeset.send();

    final respStr = await response.stream.bytesToString();

    var data = json.decode(respStr);
    return data;
  }

  Future<dynamic> postResentToken(String email, String token) async {

    Map<String, String> requestBody = <String,String>{
      'email':email,
      'client_id': 'test',
    };

    Map<String, String> headers= <String,String>{
      'Authorization':'Bearer $token'
    };

    var uri = Uri.parse("http://lomeca.datadigi.id/api/resendtoken");

    var requeset = http.MultipartRequest('POST', uri)
      ..fields.addAll(requestBody)
      ..headers.addAll(headers);

    var response = await requeset.send();

    final respStr = await response.stream.bytesToString();

    var data = json.decode(respStr);
    return data;
  }


  Future<dynamic> getListRedeemCoupon(String token) async {
    var uri = Uri.parse("http://lomeca.datadigi.id/api/redeemcoupon");

    Map<String, String> headers= <String,String>{
      'Authorization':'Bearer $token'
    };

    var request = http.MultipartRequest('GET', uri)
      ..headers.addAll(headers);

    var response = await request.send();

    final respStr = await response.stream.bytesToString();

    var data = json.decode(respStr);
    return data;
  }

  Future<dynamic> getDetailRedeemCoupon(String token, String idRedeem) async {
    var uri = Uri.parse("http://lomeca.datadigi.id/api/redeemcoupon/$idRedeem");

    Map<String, String> headers= <String,String>{
      'Authorization':'Bearer $token'
    };

    var request = http.MultipartRequest('GET', uri)
      ..headers.addAll(headers);

    var response = await request.send();

    final respStr = await response.stream.bytesToString();

    var data = json.decode(respStr);
    return data;
  }

  Future<dynamic> getListMemberVoucher(String token) async {
    var uri = Uri.parse("http://lomeca.datadigi.id/api/membervoucher");

    Map<String, String> headers= <String,String>{
      'Authorization':'Bearer $token'
    };

    var request = http.MultipartRequest('GET', uri)
      ..headers.addAll(headers);

    var response = await request.send();

    final respStr = await response.stream.bytesToString();

    var data = json.decode(respStr);
    return data;
  }

  Future<dynamic> getDetailMemberVoucher(String token, String idVoucher) async {
    var uri = Uri.parse("http://lomeca.datadigi.id/api/membervoucher/$idVoucher");

    Map<String, String> headers= <String,String>{
      'Authorization':'Bearer $token'
    };

    var request = http.MultipartRequest('GET', uri)
      ..headers.addAll(headers);

    var response = await request.send();

    final respStr = await response.stream.bytesToString();

    var data = json.decode(respStr);
    return data;
  }

  Future<dynamic> getMemberDetail(String token) async {
    var uri = Uri.parse("http://lomeca.datadigi.id/api/memberdetail");

    Map<String, String> headers= <String,String>{
      'Authorization':'Bearer $token'
    };

    var request = http.MultipartRequest('GET', uri)
      ..headers.addAll(headers);

    var response = await request.send();

    final respStr = await response.stream.bytesToString();

    var data = json.decode(respStr);
    return data;
  }

  Future<dynamic> getListPromo(String token) async {
    var uri = Uri.parse("http://lomeca.datadigi.id/api/promopost");

    Map<String, String> headers= <String,String>{
      'Authorization':'Bearer $token'
    };

    var request = http.MultipartRequest('GET', uri)
      ..headers.addAll(headers);

    var response = await request.send();

    final respStr = await response.stream.bytesToString();

    var data = json.decode(respStr);
    return data;
  }

  Future<dynamic> getPromoDetail(String token, String idPromo) async {
    var uri = Uri.parse("http://lomeca.datadigi.id/api/promopost/$idPromo");

    Map<String, String> headers= <String,String>{
      'Authorization':'Bearer $token'
    };

    var request = http.MultipartRequest('GET', uri)
      ..headers.addAll(headers);

    var response = await request.send();

    final respStr = await response.stream.bytesToString();

    var data = json.decode(respStr);
    return data;
  }

}
