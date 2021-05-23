import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class ResultUser extends Equatable {

  ResultUser({
    this.status,
    this.message,
    this.statusCode,
    this.todo,
    this.data,
  });

  final String status;
  final String message;
  final int statusCode;
  final String todo;
  final User data;

  factory ResultUser.fromJson(Map<String, dynamic> json) => _$ResultUserFromJson(json);

  Map<String, dynamic> toJson() => _$ResultUserToJson(this);

  @override
  List<Object> get props => [
    status,
    message,
    statusCode,
    todo,
    data,
  ];

}

@JsonSerializable()
class User extends Equatable {
  User({
    this.id,
    this.phonenumber,
    this.branchid,
    this.tableno,
    this.customername,
    this.orderno,
    this.orderStatus,
    this.paymentStatus,
    this.detailModifiedExportedAt,
    this.kassa,
    this.strukno,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final String phonenumber;
  final String branchid;
  final String tableno;
  final String customername;
  final String orderno;
  final String orderStatus;
  final String paymentStatus;
  final String detailModifiedExportedAt;
  final String kassa;
  final String strukno;
  final String createdAt;
  final String updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object> get props => [
    id,
    phonenumber,
    branchid,
    tableno,
    customername,
    orderno,
    orderStatus,
    paymentStatus,
    detailModifiedExportedAt,
    kassa,
    strukno,
    createdAt,
    updatedAt,
  ];

}