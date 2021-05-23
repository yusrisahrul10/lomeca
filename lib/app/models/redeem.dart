import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'redeem.g.dart';

@JsonSerializable()
class ResultRedeem extends Equatable {
  final String status;
  final String message;
  final int status_code;
  final String todo;
  final List<DataRedeem> data;

  ResultRedeem({
    this.status,
    this.message,
    this.status_code,
    this.todo,
    this.data,
  });


  factory ResultRedeem.fromJson(Map<String, dynamic> json) => _$ResultRedeemFromJson(json);

  Map<String, dynamic> toJson() => _$ResultRedeemToJson(this);

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
class DataRedeem extends Equatable {
  final String id;
  final String title;
  final String descr;
  final String descr2;
  final int redeem_point;
  final int voucher_amount;
  final String start_at;
  final String end_at;
  final dynamic created_by;
  final String created_at;
  final String updated_at;
  final int vouchertype_id;
  final int is_broadcast;
  final dynamic broadcast_at;
  final String banner_image_path;

  DataRedeem({
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
    this.banner_image_path});

  factory DataRedeem.fromJson(Map<String, dynamic> json) => _$DataRedeemFromJson(json);

  Map<String, dynamic> toJson() => _$DataRedeemToJson(this);

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
    banner_image_path
  ];
}