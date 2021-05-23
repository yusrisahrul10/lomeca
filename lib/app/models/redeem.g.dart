// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redeem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultRedeem _$ResultRedeemFromJson(Map<String, dynamic> json) {
  return ResultRedeem(
    status: json['status'] as String,
    message: json['message'] as String,
    status_code: json['status_code'] as int,
    todo: json['todo'] as String,
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : DataRedeem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResultRedeemToJson(ResultRedeem instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'status_code': instance.status_code,
      'todo': instance.todo,
      'data': instance.data,
    };

DataRedeem _$DataRedeemFromJson(Map<String, dynamic> json) {
  return DataRedeem(
    id: json['id'] as String,
    title: json['title'] as String,
    descr: json['descr'] as String,
    descr2: json['descr2'] as String,
    redeem_point: json['redeem_point'] as int,
    voucher_amount: json['voucher_amount'] as int,
    start_at: json['start_at'] as String,
    end_at: json['end_at'] as String,
    created_by: json['created_by'],
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
    vouchertype_id: json['vouchertype_id'] as int,
    is_broadcast: json['is_broadcast'] as int,
    broadcast_at: json['broadcast_at'],
    banner_image_path: json['banner_image_path'] as String,
  );
}

Map<String, dynamic> _$DataRedeemToJson(DataRedeem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'descr': instance.descr,
      'descr2': instance.descr2,
      'redeem_point': instance.redeem_point,
      'voucher_amount': instance.voucher_amount,
      'start_at': instance.start_at,
      'end_at': instance.end_at,
      'created_by': instance.created_by,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'vouchertype_id': instance.vouchertype_id,
      'is_broadcast': instance.is_broadcast,
      'broadcast_at': instance.broadcast_at,
      'banner_image_path': instance.banner_image_path,
    };
