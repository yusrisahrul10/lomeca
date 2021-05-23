import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';


@JsonSerializable()
class ResultLogin extends Equatable {

  ResultLogin({
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
  final DataLogin data;

  factory ResultLogin.fromJson(Map<String, dynamic> json) => _$ResultLoginFromJson(json);

  Map<String, dynamic> toJson() => _$ResultLoginToJson(this);

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
class DataLogin extends Equatable {

  DataLogin({
    this.access_token,
    this.user,
  });

  final String access_token;
  final DataUser user;

  factory DataLogin.fromJson(Map<String, dynamic> json) => _$DataLoginFromJson(json);

  Map<String, dynamic> toJson() => _$DataLoginToJson(this);

  @override
  List<Object> get props => [
    access_token,
    user
  ];

}

@JsonSerializable()
class DataUser extends Equatable {

  DataUser({
    this.id,
    this.name,
    this.email,
    this.email_verified_at,
    this.created_at,
    this.updated_at,
    this.role,
    this.active,
    this.current_log_in_at,
    this.last_log_in_at,
    this.provider,
    this.provider_id,
    this.client_key,
    this.profile_pict,
  });

  final int id;
  final String name;
  final String email;
  final String email_verified_at;
  final String created_at;
  final String updated_at;
  final int role;
  final int active;
  final String current_log_in_at;
  final String last_log_in_at;
  final String provider;
  final String provider_id;
  final String client_key;
  final String profile_pict;

  factory DataUser.fromJson(Map<String, dynamic> json) => _$DataUserFromJson(json);

  Map<String, dynamic> toJson() => _$DataUserToJson(this);

  @override
  List<Object> get props => [
    id,
    name,
    email,
    email_verified_at,
    created_at,
    updated_at,
    role,
    active,
    current_log_in_at,
    last_log_in_at,
    provider,
    provider_id,
    client_key,
    profile_pict,
  ];

}
