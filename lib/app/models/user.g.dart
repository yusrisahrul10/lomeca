// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultUser _$ResultUserFromJson(Map<String, dynamic> json) {
  return ResultUser(
    status: json['status'] as String,
    message: json['message'] as String,
    statusCode: json['statusCode'] as int,
    todo: json['todo'] as String,
    data: json['data'] == null
        ? null
        : User.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResultUserToJson(ResultUser instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'statusCode': instance.statusCode,
      'todo': instance.todo,
      'data': instance.data,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    phonenumber: json['phonenumber'] as String,
    branchid: json['branchid'] as String,
    tableno: json['tableno'] as String,
    customername: json['customername'] as String,
    orderno: json['orderno'] as String,
    orderStatus: json['orderStatus'] as String,
    paymentStatus: json['paymentStatus'] as String,
    detailModifiedExportedAt: json['detailModifiedExportedAt'] as String,
    kassa: json['kassa'] as String,
    strukno: json['strukno'] as String,
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'phonenumber': instance.phonenumber,
      'branchid': instance.branchid,
      'tableno': instance.tableno,
      'customername': instance.customername,
      'orderno': instance.orderno,
      'orderStatus': instance.orderStatus,
      'paymentStatus': instance.paymentStatus,
      'detailModifiedExportedAt': instance.detailModifiedExportedAt,
      'kassa': instance.kassa,
      'strukno': instance.strukno,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
