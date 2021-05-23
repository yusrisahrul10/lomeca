// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultRegister _$ResultRegisterFromJson(Map<String, dynamic> json) {
  return ResultRegister(
    status: json['status'] as String,
    message: json['message'] as String,
    status_code: json['status_code'] as int,
    todo: json['todo'] as String,
    data: json['data'] == null
        ? null
        : DataRegister.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResultRegisterToJson(ResultRegister instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'status_code': instance.status_code,
      'todo': instance.todo,
      'data': instance.data,
    };

DataRegister _$DataRegisterFromJson(Map<String, dynamic> json) {
  return DataRegister(
    access_token: json['access_token'] as String,
    user: json['user'] == null
        ? null
        : DataUser.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DataRegisterToJson(DataRegister instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'user': instance.user,
    };

DataUser _$DataUserFromJson(Map<String, dynamic> json) {
  return DataUser(
    active: json['active'] as int,
    created_at: json['created_at'] as String,
    email: json['email'] as String,
    id: json['id'] as int,
    name: json['name'] as String,
    profile_pict: json['profile_pict'] as String,
    updated_at: json['updated_at'] as String,
  );
}

Map<String, dynamic> _$DataUserToJson(DataUser instance) => <String, dynamic>{
      'active': instance.active,
      'created_at': instance.created_at,
      'email': instance.email,
      'id': instance.id,
      'name': instance.name,
      'profile_pict': instance.profile_pict,
      'updated_at': instance.updated_at,
    };
