// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultMember _$ResultMemberFromJson(Map<String, dynamic> json) {
  return ResultMember(
    status: json['status'] as String,
    message: json['message'] as String,
    status_code: json['status_code'] as int,
    todo: json['todo'] as String,
    data: json['data'] == null
        ? null
        : DataMember.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResultMemberToJson(ResultMember instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'status_code': instance.status_code,
      'todo': instance.todo,
      'data': instance.data,
    };

DataMember _$DataMemberFromJson(Map<String, dynamic> json) {
  return DataMember(
    id: json['id'] as String,
    user_id: json['user_id'] as int,
    member_type_id: json['member_type_id'] as int,
    gender: json['gender'] as int,
    phone_number: json['phone_number'] as String,
    point: json['point'] as int,
    balance: json['balance'] as int,
    birthday: json['birthday'] as String,
    address: json['address'] as String,
    zipcode: json['zipcode'] as String,
    city: json['city'] as String,
    country: json['country'] as String,
    state: json['state'] as String,
    village_id: json['village_id'] as String,
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
    device_token: json['device_token'] as String,
    member_email: json['member_email'] as String,
    member_name: json['member_name'] as String,
    profile_pict: json['profile_pict'] as String,
    member_type_name: json['member_type_name'] as String,
    card_front_image_path: json['card_front_image_path'] as String,
    card_back_image_path: json['card_back_image_path'] as String,
    startup_banner: json['startup_banner'] == null
        ? null
        : StartupBanner.fromJson(
            json['startup_banner'] as Map<String, dynamic>),
    notif_unread: json['notif_unread'] as int,
    qr_text: json['qr_text'] as String,
    gender_name: json['gender_name'] as String,
  );
}

Map<String, dynamic> _$DataMemberToJson(DataMember instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'member_type_id': instance.member_type_id,
      'gender': instance.gender,
      'phone_number': instance.phone_number,
      'point': instance.point,
      'balance': instance.balance,
      'birthday': instance.birthday,
      'address': instance.address,
      'zipcode': instance.zipcode,
      'city': instance.city,
      'country': instance.country,
      'state': instance.state,
      'village_id': instance.village_id,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'device_token': instance.device_token,
      'member_email': instance.member_email,
      'member_name': instance.member_name,
      'profile_pict': instance.profile_pict,
      'member_type_name': instance.member_type_name,
      'card_front_image_path': instance.card_front_image_path,
      'card_back_image_path': instance.card_back_image_path,
      'startup_banner': instance.startup_banner,
      'notif_unread': instance.notif_unread,
      'qr_text': instance.qr_text,
      'gender_name': instance.gender_name,
    };

StartupBanner _$StartupBannerFromJson(Map<String, dynamic> json) {
  return StartupBanner(
    id: json['id'] as String,
    link: json['link'] as String,
    banner_image_path: json['banner_image_path'] as String,
  );
}

Map<String, dynamic> _$StartupBannerToJson(StartupBanner instance) =>
    <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'banner_image_path': instance.banner_image_path,
    };
