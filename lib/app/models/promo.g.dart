// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultPromo _$ResultPromoFromJson(Map<String, dynamic> json) {
  return ResultPromo(
    status: json['status'] as String,
    message: json['message'] as String,
    status_code: json['status_code'] as int,
    todo: json['todo'] as String,
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : DataPromo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResultPromoToJson(ResultPromo instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'status_code': instance.status_code,
      'todo': instance.todo,
      'data': instance.data,
    };

DataPromo _$DataPromoFromJson(Map<String, dynamic> json) {
  return DataPromo(
    id: json['id'] as String,
    title: json['title'] as String,
    subtitle: json['subtitle'] as String,
    message: json['message'] as String,
    flyer_image_link: json['flyer_image_link'] as String,
    is_active: json['is_active'] as int,
    is_broadcast: json['is_broadcast'] as int,
    topics: json['topics'] as String,
    priority: json['priority'] as int,
    broadcast_at: json['broadcast_at'] as String,
    created_by: json['created_by'] as String,
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
    harga_baru: json['harga_baru'] as String,
    harga_lama: json['harga_lama'] as String,
    status: json['status'] as int,
    banner_image_path: json['banner_image_path'] as String,
    flyer_image_path: json['flyer_image_path'] as String,
  );
}

Map<String, dynamic> _$DataPromoToJson(DataPromo instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'message': instance.message,
      'flyer_image_link': instance.flyer_image_link,
      'is_active': instance.is_active,
      'is_broadcast': instance.is_broadcast,
      'topics': instance.topics,
      'priority': instance.priority,
      'broadcast_at': instance.broadcast_at,
      'created_by': instance.created_by,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'harga_baru': instance.harga_baru,
      'harga_lama': instance.harga_lama,
      'status': instance.status,
      'banner_image_path': instance.banner_image_path,
      'flyer_image_path': instance.flyer_image_path,
    };
