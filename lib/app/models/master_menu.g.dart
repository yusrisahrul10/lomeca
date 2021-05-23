// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultMasterMenu _$ResultMasterMenuFromJson(Map<String, dynamic> json) {
  return ResultMasterMenu(
    status: json['status'] as String,
    message: json['message'] as String,
    statusCode: json['statusCode'] as int,
    todo: json['todo'] as String,
    data: (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Menu.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResultMasterMenuToJson(ResultMasterMenu instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'statusCode': instance.statusCode,
      'todo': instance.todo,
      'data': instance.data,
    };

Menu _$MenuFromJson(Map<String, dynamic> json) {
  return Menu(
    menuid: json['menuid'] as String,
    categorymenuid: json['categorymenuid'] as String,
    menuname: json['menuname'] as String,
    menuname1: json['menuname1'] as String,
    cousetype: json['cousetype'] as int,
    uomid: json['uomid'] as String,
    sellingprice: (json['sellingprice'] as num)?.toDouble(),
    discamount: (json['discamount'] as num)?.toDouble(),
    disckind: (json['disckind'] as num)?.toDouble(),
    hppmenu: (json['hppmenu'] as num)?.toDouble(),
    Statusaktif: json['Statusaktif'] as int,
    promostatus: json['promostatus'] as int,
    menupict: json['menupict'] as String,
    kitchenid: json['kitchenid'] as String,
    mandatoryaddmenu: (json['mandatoryaddmenu'] as num)?.toDouble(),
    create_userid: json['create_userid'] as String,
    create_date: json['create_date'] as String,
    lastupdate_userid: json['lastupdate_userid'] as String,
    lastupdate_date: json['lastupdate_date'] as String,
    servecount: json['servecount'] as int,
    ismainmenu: json['ismainmenu'] as int,
    trans: json['trans'] as int,
    redeempoint: json['redeempoint'] as int,
    isquickmenu: json['isquickmenu'] as int,
    mmn_uploadeddt_byho: json['mmn_uploadeddt_byho'] as String,
  );
}

Map<String, dynamic> _$MenuToJson(Menu instance) => <String, dynamic>{
      'menuid': instance.menuid,
      'categorymenuid': instance.categorymenuid,
      'menuname': instance.menuname,
      'menuname1': instance.menuname1,
      'cousetype': instance.cousetype,
      'uomid': instance.uomid,
      'sellingprice': instance.sellingprice,
      'discamount': instance.discamount,
      'disckind': instance.disckind,
      'hppmenu': instance.hppmenu,
      'Statusaktif': instance.Statusaktif,
      'promostatus': instance.promostatus,
      'menupict': instance.menupict,
      'kitchenid': instance.kitchenid,
      'mandatoryaddmenu': instance.mandatoryaddmenu,
      'create_userid': instance.create_userid,
      'create_date': instance.create_date,
      'lastupdate_userid': instance.lastupdate_userid,
      'lastupdate_date': instance.lastupdate_date,
      'servecount': instance.servecount,
      'ismainmenu': instance.ismainmenu,
      'trans': instance.trans,
      'redeempoint': instance.redeempoint,
      'isquickmenu': instance.isquickmenu,
      'mmn_uploadeddt_byho': instance.mmn_uploadeddt_byho,
    };
