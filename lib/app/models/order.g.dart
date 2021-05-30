// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultOrder _$ResultOrderFromJson(Map<String, dynamic> json) {
  return ResultOrder(
    status: json['status'] as String,
    message: json['message'] as String,
    status_code: json['status_code'] as int,
    todo: json['todo'] as String,
    data: json['data'] == null
        ? null
        : Order.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResultOrderToJson(ResultOrder instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'status_code': instance.status_code,
      'todo': instance.todo,
      'data': instance.data,
    };

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
    orderno: json['orderno'] as String,
    totalamount: (json['totalamount'] as num)?.toDouble(),
    detail: (json['detail'] as List)
        ?.map((e) =>
            e == null ? null : DetailOrder.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'orderno': instance.orderno,
      'totalamount': instance.totalamount,
      'detail': instance.detail,
    };

DetailOrder _$DetailOrderFromJson(Map<String, dynamic> json) {
  return DetailOrder(
    id: json['id'] as int,
    loginId: json['loginId'] as int,
    orderno: json['orderno'] as String,
    menuid: json['menuid'] as String,
    qty: json['qty'] as int,
    hjual: (json['hjual'] as num)?.toDouble(),
    discamount: json['discamount'] as int,
    detailamount: (json['detailamount'] as num)?.toDouble(),
    seqno: json['seqno'] as int,
    detailseqno: json['detailseqno'] as int,
    ref_menuid: json['ref_menuid'] as String,
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
    menuname: json['menuname'] as String,
    cart_status: json['cart_status'] as int,
  );
}

Map<String, dynamic> _$DetailOrderToJson(DetailOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'loginId': instance.loginId,
      'orderno': instance.orderno,
      'menuid': instance.menuid,
      'qty': instance.qty,
      'hjual': instance.hjual,
      'discamount': instance.discamount,
      'detailamount': instance.detailamount,
      'seqno': instance.seqno,
      'detailseqno': instance.detailseqno,
      'ref_menuid': instance.ref_menuid,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'menuname': instance.menuname,
      'cart_status': instance.cart_status,
    };
