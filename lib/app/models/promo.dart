import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'promo.g.dart';


@JsonSerializable()
class ResultPromo extends Equatable {
  ResultPromo({
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
  final List<DataPromo> data;

  factory ResultPromo.fromJson(Map<String, dynamic> json) => _$ResultPromoFromJson(json);

  Map<String, dynamic> toJson() => _$ResultPromoToJson(this);

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
class DataPromo extends Equatable {

  DataPromo({
    this.id,
    this.title,
    this.subtitle,
    this.message,
    this.flyer_image_link,
    this.is_active,
    this.is_broadcast,
    this.topics,
    this.priority,
    this.broadcast_at,
    this.created_by,
    this.created_at,
    this.updated_at,
    this.harga_baru,
    this.harga_lama,
    this.status,
    this.banner_image_path,
    this.flyer_image_path,
  });

  final String id;
  final String title;
  final String subtitle;
  final String message;
  final String flyer_image_link;
  final int is_active;
  final int is_broadcast;
  final String topics;
  final int priority;
  final String broadcast_at;
  final String created_by;
  final String created_at;
  final String updated_at;
  final String harga_baru;
  final String harga_lama;
  final int status;
  final String banner_image_path;
  final String flyer_image_path;

  factory DataPromo.fromJson(Map<String, dynamic> json) => _$DataPromoFromJson(json);

  Map<String, dynamic> toJson() => _$DataPromoToJson(this);

  @override
  List<Object> get props => [
    id,
    title,
    subtitle,
    message,
    flyer_image_link,
    is_active,
    is_broadcast,
    topics,
    priority,
    broadcast_at,
    created_by,
    created_at,
    updated_at,
    harga_baru,
    harga_lama,
    status,
    banner_image_path,
    flyer_image_path,
  ];

}