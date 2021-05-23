// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostOrder _$PostOrderFromJson(Map<String, dynamic> json) {
  return PostOrder(
    menuid: json['menuid'] as String,
    qty: json['qty'] as int,
    hjual: (json['hjual'] as num)?.toDouble(),
    discamount: json['discamount'] as int,
    detailamount: json['detailamount'] as int,
    seqno: json['seqno'] as int,
    detailseqno: json['detailseqno'] as int,
    ref_menuid: json['ref_menuid'] as String,
    menuname: json['menuname'] as String,
  );
}

Map<String, dynamic> _$PostOrderToJson(PostOrder instance) => <String, dynamic>{
      'menuid': instance.menuid,
      'qty': instance.qty,
      'hjual': instance.hjual,
      'discamount': instance.discamount,
      'detailamount': instance.detailamount,
      'seqno': instance.seqno,
      'detailseqno': instance.detailseqno,
      'ref_menuid': instance.ref_menuid,
      'menuname': instance.menuname,
    };
