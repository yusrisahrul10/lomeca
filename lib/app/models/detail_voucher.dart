import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'detail_voucher.g.dart';

@JsonSerializable()
class ResultDetailVoucher extends Equatable {
  ResultDetailVoucher({
    this.status,
    this.message,
    this.status_code,
    this.todo,
    this.data,
  });

  final String status;
  final String message;
  final int status_code;
  final String todo;
  final DataVoucher data;

  factory ResultDetailVoucher.fromJson(Map<String, dynamic> json) => _$ResultDetailVoucherFromJson(json);

  Map<String, dynamic> toJson() => _$ResultDetailVoucherToJson(this);

  @override
  List<Object> get props => [
    status,
    message,
    status_code,
    todo,
    data,
  ];
}

@JsonSerializable()
class DataVoucher extends Equatable{

  DataVoucher({
    this.id,
    this.redeem_id,
    this.member_id,
    this.member_point,
    this.start_at,
    this.end_at,
    this.used_at,
    this.branchid,
    this.strukno,
    this.created_at,
    this.updated_at,
    this.vouchertype_id,
    this.voucher_title,
    this.voucher_descr,
    this.voucher_descr2,
    this.voucher_amount,
    this.voucher_banner_image_path,
    this.qr_text,
    this.redeem_coupon,
  });

  final String id;
  final String redeem_id;
  final String member_id;
  final int member_point;
  final String start_at;
  final String end_at;
  final String used_at;
  final String branchid;
  final String strukno;
  final String created_at;
  final String updated_at;
  final int vouchertype_id;
  final String voucher_title;
  final String voucher_descr;
  final String voucher_descr2;
  final int voucher_amount;
  final String voucher_banner_image_path;
  final String qr_text;
  final RedeemCoupon redeem_coupon;

  factory DataVoucher.fromJson(Map<String, dynamic> json) => _$DataVoucherFromJson(json);

  Map<String, dynamic> toJson() => _$DataVoucherToJson(this);

  @override
  List<Object> get props => [
    id,
    redeem_id,
    member_id,
    member_point,
    start_at,
    end_at,
    used_at,
    branchid,
    strukno,
    created_at,
    updated_at,
    vouchertype_id,
    voucher_title,
    voucher_descr,
    voucher_descr2,
    voucher_amount,
    voucher_banner_image_path,
    qr_text,
    redeem_coupon,
  ];

}

@JsonSerializable()
class RedeemCoupon extends Equatable {
  RedeemCoupon({
    this.id,
    this.title,
    this.descr,
    this.descr2,
    this.redeem_point,
    this.voucher_amount,
    this.start_at,
    this.end_at,
    this.created_by,
    this.created_at,
    this.updated_at,
    this.vouchertype_id,
    this.is_broadcast,
    this.broadcast_at,
    this.banner_image_path,
  });

  final String id;
  final String title;
  final String descr;
  final String descr2;
  final int redeem_point;
  final int voucher_amount;
  final String start_at;
  final String end_at;
  final String created_by;
  final String created_at;
  final String updated_at;
  final int vouchertype_id;
  final int is_broadcast;
  final String broadcast_at;
  final String banner_image_path;

  factory RedeemCoupon.fromJson(Map<String, dynamic> json) => _$RedeemCouponFromJson(json);

  Map<String, dynamic> toJson() => _$RedeemCouponToJson(this);

  @override
  List<Object> get props => [
    id,
    title,
    descr,
    descr2,
    redeem_point,
    voucher_amount,
    start_at,
    end_at,
    created_by,
    created_at,
    updated_at,
    vouchertype_id,
    is_broadcast,
    broadcast_at,
    banner_image_path,
  ];

}