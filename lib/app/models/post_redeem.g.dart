// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_redeem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultPostRedeem _$ResultPostRedeemFromJson(Map<String, dynamic> json) {
  return ResultPostRedeem(
    status: json['status'] as String,
    message: json['message'] as String,
    status_code: json['status_code'] as int,
    todo: json['todo'] as String,
    data: json['data'] == null
        ? null
        : DataPostRedeem.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResultPostRedeemToJson(ResultPostRedeem instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'status_code': instance.status_code,
      'todo': instance.todo,
      'data': instance.data,
    };

DataPostRedeem _$DataPostRedeemFromJson(Map<String, dynamic> json) {
  return DataPostRedeem(
    id: json['id'] as String,
    member_id: json['member_id'] as String,
    redeem_id: json['redeem_id'] as String,
    member_point: json['member_point'] as int,
    start_at: json['start_at'] as String,
    end_at: json['end_at'] as String,
    updated_at: json['updated_at'] as String,
    created_at: json['created_at'] as String,
    voucher_title: json['voucher_title'] as String,
    voucher_descr: json['voucher_descr'] as String,
    voucher_descr2: json['voucher_descr2'] as String,
    voucher_amount: json['voucher_amount'] as int,
    voucher_banner_image_path: json['voucher_banner_image_path'] as String,
    qr_text: json['qr_text'] as String,
    redeem_coupon: json['redeem_coupon'] == null
        ? null
        : RedeemCoupon.fromJson(json['redeem_coupon'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DataPostRedeemToJson(DataPostRedeem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'member_id': instance.member_id,
      'redeem_id': instance.redeem_id,
      'member_point': instance.member_point,
      'start_at': instance.start_at,
      'end_at': instance.end_at,
      'updated_at': instance.updated_at,
      'created_at': instance.created_at,
      'voucher_title': instance.voucher_title,
      'voucher_descr': instance.voucher_descr,
      'voucher_descr2': instance.voucher_descr2,
      'voucher_amount': instance.voucher_amount,
      'voucher_banner_image_path': instance.voucher_banner_image_path,
      'qr_text': instance.qr_text,
      'redeem_coupon': instance.redeem_coupon,
    };

RedeemCoupon _$RedeemCouponFromJson(Map<String, dynamic> json) {
  return RedeemCoupon(
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

Map<String, dynamic> _$RedeemCouponToJson(RedeemCoupon instance) =>
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
