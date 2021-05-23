import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register.g.dart';


@JsonSerializable()
class ResultRegister extends Equatable {
  ResultRegister({
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
  final DataRegister data;

  factory ResultRegister.fromJson(Map<String, dynamic> json) => _$ResultRegisterFromJson(json);

  Map<String, dynamic> toJson() => _$ResultRegisterToJson(this);

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
class DataRegister extends Equatable {

  DataRegister({this.access_token,
    this.user,
  });

  final String access_token;
  final DataUser user;

  factory DataRegister.fromJson(Map<String, dynamic> json) => _$DataRegisterFromJson(json);

  Map<String, dynamic> toJson() => _$DataRegisterToJson(this);

  @override
  List<Object> get props => [
    access_token,
    user
  ];

}

@JsonSerializable()
class DataUser extends Equatable {
  DataUser({
    this.active,
    this.created_at,
    this.email,
    this.id,
    this.name,
    this.profile_pict,
    this.updated_at,
  });

  final int active;
  final String created_at;
  final String email;
  final int id;
  final String name;
  final String profile_pict;
  final String updated_at;

  factory DataUser.fromJson(Map<String, dynamic> json) => _$DataUserFromJson(json);

  Map<String, dynamic> toJson() => _$DataUserToJson(this);

  @override
  List<Object> get props => [
    id,
    name,
    email,
    created_at,
    updated_at,
    active,
    profile_pict,
  ];
}