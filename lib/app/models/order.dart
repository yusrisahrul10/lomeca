import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class ResultOrder extends Equatable {
  ResultOrder({
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
  final Order data;

  factory ResultOrder.fromJson(Map<String, dynamic> json) => _$ResultOrderFromJson(json);

  Map<String, dynamic> toJson() => _$ResultOrderToJson(this);

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
class Order extends Equatable {
  Order({
    this.orderno,
    this.totalamount,
    this.detail,
  });

  final String orderno;
  final double totalamount;
  final List<DetailOrder> detail;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);

  @override
  List<Object> get props => [
    orderno,
    totalamount,
    detail,
  ];

}

@JsonSerializable()
class DetailOrder extends Equatable {
  DetailOrder({
    this.id,
    this.loginId,
    this.orderno,
    this.menuid,
    this.qty,
    this.hjual,
    this.discamount,
    this.detailamount,
    this.seqno,
    this.detailseqno,
    this.ref_menuid,
    this.createdAt,
    this.updatedAt,
    this.menuname,
  });

  final int id;
  final int loginId;
  final String orderno;
  final String menuid;
  final int qty;
  final double hjual;
  final int discamount;
  final double detailamount;
  final int seqno;
  final int detailseqno;
  final String ref_menuid;
  final String createdAt;
  final String updatedAt;
  final String menuname;

  factory DetailOrder.fromJson(Map<String, dynamic> json) => _$DetailOrderFromJson(json);

  Map<String, dynamic> toJson() => _$DetailOrderToJson(this);

  @override
  List<Object> get props => [
    id,
    loginId,
    orderno,
    menuid,
    qty,
    hjual,
    discamount,
    detailamount,
    seqno,
    detailseqno,
    ref_menuid,
    createdAt,
    updatedAt,
    menuname,
  ];

}