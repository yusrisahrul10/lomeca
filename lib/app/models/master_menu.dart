import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'master_menu.g.dart';

@JsonSerializable()
class ResultMasterMenu extends Equatable {
  final String status;
  final String message;
  final int statusCode;
  final String todo;
  final List<Menu> data;

  ResultMasterMenu({
    this.status,
    this.message,
    this.statusCode,
    this.todo,
    this.data,
  });

  factory ResultMasterMenu.fromJson(Map<String, dynamic> json) => _$ResultMasterMenuFromJson(json);

  Map<String, dynamic> toJson() => _$ResultMasterMenuToJson(this);

  @override
  List<Object> get props => [
    status,
    message,
    statusCode,
    todo,
    data,
  ];

}

@JsonSerializable()
class Menu extends Equatable {
  final String menuid;
  final String categorymenuid;
  final String menuname;
  final String menuname1;
  final int cousetype;
  final String uomid;
  final double sellingprice;
  final double discamount;
  final double disckind;
  final double hppmenu;
  final int Statusaktif;
  final int promostatus;
  final String menupict;
  final String kitchenid;
  final double mandatoryaddmenu;
  final String create_userid;
  final String create_date;
  final String lastupdate_userid;
  final String lastupdate_date;
  final int servecount;
  final int ismainmenu;
  final int trans;
  final int redeempoint;
  final int isquickmenu;
  final String mmn_uploadeddt_byho;

  Menu({this.menuid,
    this.categorymenuid,
    this.menuname,
    this.menuname1,
    this.cousetype,
    this.uomid,
    this.sellingprice,
    this.discamount,
    this.disckind,
    this.hppmenu,
    this.Statusaktif,
    this.promostatus,
    this.menupict,
    this.kitchenid,
    this.mandatoryaddmenu,
    this.create_userid,
    this.create_date,
    this.lastupdate_userid,
    this.lastupdate_date,
    this.servecount,
    this.ismainmenu,
    this.trans,
    this.redeempoint,
    this.isquickmenu,
    this.mmn_uploadeddt_byho});

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);

  Map<String, dynamic> toJson() => _$MenuToJson(this);

  @override
  List<Object> get props => [
    menuid,
    categorymenuid,
    menuname,
    menuname1,
    cousetype,
    uomid,
    sellingprice,
    discamount,
    disckind,
    hppmenu,
    Statusaktif,
    promostatus,
    menupict,
    kitchenid,
    mandatoryaddmenu,
    create_userid,
    create_date,
    lastupdate_userid,
    lastupdate_date,
    servecount,
    ismainmenu,
    trans,
    redeempoint,
    isquickmenu,
    mmn_uploadeddt_byho
  ];
}