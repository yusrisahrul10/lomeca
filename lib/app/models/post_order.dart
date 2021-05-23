import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_order.g.dart';

@JsonSerializable()
class PostOrder extends Equatable {

  PostOrder({
    this.menuid,
    this.qty,
    this.hjual,
    this.discamount,
    this.detailamount,
    this.seqno,
    this.detailseqno,
    this.ref_menuid,
    this.menuname
  });

  final String menuid;
  final int qty;
  final double hjual;
  final int discamount;
  final int detailamount;
  final int seqno;
  final int detailseqno;
  final String ref_menuid;
  final String menuname;

  factory PostOrder.fromJson(Map<String, dynamic> json) => _$PostOrderFromJson(json);

  Map<String, dynamic> toJson() => _$PostOrderToJson(this);
  @override
  List<Object> get props => [
    menuid,
    qty,
    hjual,
    discamount,
    detailamount,
    seqno,
    detailseqno,
    ref_menuid,
    menuname
  ];

}