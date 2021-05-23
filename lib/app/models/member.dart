import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'member.g.dart';


@JsonSerializable()
class ResultMember extends Equatable {
  ResultMember({
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
  final DataMember data;

  factory ResultMember.fromJson(Map<String, dynamic> json) => _$ResultMemberFromJson(json);

  Map<String, dynamic> toJson() => _$ResultMemberToJson(this);

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
class DataMember extends Equatable {

  DataMember({
    this.id,
    this.user_id,
    this.member_type_id,
    this.gender,
    this.phone_number,
    this.point,
    this.balance,
    this.birthday,
    this.address,
    this.zipcode,
    this.city,
    this.country,
    this.state,
    this.village_id,
    this.created_at,
    this.updated_at,
    this.device_token,
    this.member_email,
    this.member_name,
    this.profile_pict,
    this.member_type_name,
    this.card_front_image_path,
    this.card_back_image_path,
    this.startup_banner,
    this.notif_unread,
    this.qr_text,
    this.gender_name,
  });

  final String id;
  final int user_id;
  final int member_type_id;
  final int gender;
  final String phone_number;
  final int point;
  final int balance;
  final String birthday;
  final String address;
  final String zipcode;
  final String city;
  final String country;
  final String state;
  final String village_id;
  final String created_at;
  final String updated_at;
  final String device_token;
  final String member_email;
  final String member_name;
  final String profile_pict;
  final String member_type_name;
  final String card_front_image_path;
  final String card_back_image_path;
  final StartupBanner startup_banner;
  final int notif_unread;
  final String qr_text;
  final String gender_name;

  factory DataMember.fromJson(Map<String, dynamic> json) => _$DataMemberFromJson(json);

  Map<String, dynamic> toJson() => _$DataMemberToJson(this);

  @override
  List<Object> get props => [
    id,
    user_id,
    member_type_id,
    gender,
    phone_number,
    point,
    balance,
    birthday,
    address,
    zipcode,
    city,
    country,
    state,
    village_id,
    created_at,
    updated_at,
    device_token,
    member_email,
    member_name,
    profile_pict,
    member_type_name,
    card_front_image_path,
    card_back_image_path,
    startup_banner,
    notif_unread,
    qr_text,
    gender_name,
  ];

}

@JsonSerializable()
class StartupBanner extends Equatable{
  StartupBanner({
    this.id,
    this.link,
    this.banner_image_path,
  });

  final String id;
  final String link;
  final String banner_image_path;

  factory StartupBanner.fromJson(Map<String, dynamic> json) => _$StartupBannerFromJson(json);

  Map<String, dynamic> toJson() => _$StartupBannerToJson(this);

  @override
  List<Object> get props => [
    id,
    link,
    banner_image_path,
  ];

}
