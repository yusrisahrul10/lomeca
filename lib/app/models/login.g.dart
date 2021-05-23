// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultLogin _$ResultLoginFromJson(Map<String, dynamic> json) {
  return ResultLogin(
    status: json['status'] as String,
    message: json['message'] as String,
    status_code: json['status_code'] as int,
    todo: json['todo'] as String,
    data: json['data'] == null
        ? null
        : DataLogin.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResultLoginToJson(ResultLogin instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'status_code': instance.status_code,
      'todo': instance.todo,
      'data': instance.data,
    };

DataLogin _$DataLoginFromJson(Map<String, dynamic> json) {
  return DataLogin(
    access_token: json['access_token'] as String,
    user: json['user'] == null
        ? null
        : DataUser.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DataLoginToJson(DataLogin instance) => <String, dynamic>{
      'access_token': instance.access_token,
      'user': instance.user,
    };

DataUser _$DataUserFromJson(Map<String, dynamic> json) {
  return DataUser(
    id: json['id'] as int,
    name: json['name'] as String,
    email: json['email'] as String,
    email_verified_at: json['email_verified_at'] as String,
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
    role: json['role'] as int,
    active: json['active'] as int,
    current_log_in_at: json['current_log_in_at'] as String,
    last_log_in_at: json['last_log_in_at'] as String,
    provider: json['provider'] as String,
    provider_id: json['provider_id'] as String,
    client_key: json['client_key'] as String,
    profile_pict: json['profile_pict'] as String,
  );
}

Map<String, dynamic> _$DataUserToJson(DataUser instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.email_verified_at,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'role': instance.role,
      'active': instance.active,
      'current_log_in_at': instance.current_log_in_at,
      'last_log_in_at': instance.last_log_in_at,
      'provider': instance.provider,
      'provider_id': instance.provider_id,
      'client_key': instance.client_key,
      'profile_pict': instance.profile_pict,
    };
