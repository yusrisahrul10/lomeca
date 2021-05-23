// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ItemCart extends DataClass implements Insertable<ItemCart> {
  final int id;
  final String menuid;
  final String ref_menuid;
  final String image;
  final String name;
  final double price;
  final double qty;
  final int seqno;
  final int detailseqno;
  final int strukno;
  ItemCart(
      {@required this.id,
      @required this.menuid,
      this.ref_menuid,
      @required this.image,
      @required this.name,
      @required this.price,
      @required this.qty,
      @required this.seqno,
      @required this.detailseqno,
      this.strukno});
  factory ItemCart.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return ItemCart(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      menuid:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}menuid']),
      ref_menuid: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}ref_menuid']),
      image:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}image']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      price:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}price']),
      qty: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}qty']),
      seqno: intType.mapFromDatabaseResponse(data['${effectivePrefix}seqno']),
      detailseqno: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}detailseqno']),
      strukno:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}strukno']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || menuid != null) {
      map['menuid'] = Variable<String>(menuid);
    }
    if (!nullToAbsent || ref_menuid != null) {
      map['ref_menuid'] = Variable<String>(ref_menuid);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double>(price);
    }
    if (!nullToAbsent || qty != null) {
      map['qty'] = Variable<double>(qty);
    }
    if (!nullToAbsent || seqno != null) {
      map['seqno'] = Variable<int>(seqno);
    }
    if (!nullToAbsent || detailseqno != null) {
      map['detailseqno'] = Variable<int>(detailseqno);
    }
    if (!nullToAbsent || strukno != null) {
      map['strukno'] = Variable<int>(strukno);
    }
    return map;
  }

  CartCompanion toCompanion(bool nullToAbsent) {
    return CartCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      menuid:
          menuid == null && nullToAbsent ? const Value.absent() : Value(menuid),
      ref_menuid: ref_menuid == null && nullToAbsent
          ? const Value.absent()
          : Value(ref_menuid),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      qty: qty == null && nullToAbsent ? const Value.absent() : Value(qty),
      seqno:
          seqno == null && nullToAbsent ? const Value.absent() : Value(seqno),
      detailseqno: detailseqno == null && nullToAbsent
          ? const Value.absent()
          : Value(detailseqno),
      strukno: strukno == null && nullToAbsent
          ? const Value.absent()
          : Value(strukno),
    );
  }

  factory ItemCart.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ItemCart(
      id: serializer.fromJson<int>(json['id']),
      menuid: serializer.fromJson<String>(json['menuid']),
      ref_menuid: serializer.fromJson<String>(json['ref_menuid']),
      image: serializer.fromJson<String>(json['image']),
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<double>(json['price']),
      qty: serializer.fromJson<double>(json['qty']),
      seqno: serializer.fromJson<int>(json['seqno']),
      detailseqno: serializer.fromJson<int>(json['detailseqno']),
      strukno: serializer.fromJson<int>(json['strukno']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'menuid': serializer.toJson<String>(menuid),
      'ref_menuid': serializer.toJson<String>(ref_menuid),
      'image': serializer.toJson<String>(image),
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<double>(price),
      'qty': serializer.toJson<double>(qty),
      'seqno': serializer.toJson<int>(seqno),
      'detailseqno': serializer.toJson<int>(detailseqno),
      'strukno': serializer.toJson<int>(strukno),
    };
  }

  ItemCart copyWith(
          {int id,
          String menuid,
          String ref_menuid,
          String image,
          String name,
          double price,
          double qty,
          int seqno,
          int detailseqno,
          int strukno}) =>
      ItemCart(
        id: id ?? this.id,
        menuid: menuid ?? this.menuid,
        ref_menuid: ref_menuid ?? this.ref_menuid,
        image: image ?? this.image,
        name: name ?? this.name,
        price: price ?? this.price,
        qty: qty ?? this.qty,
        seqno: seqno ?? this.seqno,
        detailseqno: detailseqno ?? this.detailseqno,
        strukno: strukno ?? this.strukno,
      );
  @override
  String toString() {
    return (StringBuffer('ItemCart(')
          ..write('id: $id, ')
          ..write('menuid: $menuid, ')
          ..write('ref_menuid: $ref_menuid, ')
          ..write('image: $image, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('qty: $qty, ')
          ..write('seqno: $seqno, ')
          ..write('detailseqno: $detailseqno, ')
          ..write('strukno: $strukno')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          menuid.hashCode,
          $mrjc(
              ref_menuid.hashCode,
              $mrjc(
                  image.hashCode,
                  $mrjc(
                      name.hashCode,
                      $mrjc(
                          price.hashCode,
                          $mrjc(
                              qty.hashCode,
                              $mrjc(
                                  seqno.hashCode,
                                  $mrjc(detailseqno.hashCode,
                                      strukno.hashCode))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ItemCart &&
          other.id == this.id &&
          other.menuid == this.menuid &&
          other.ref_menuid == this.ref_menuid &&
          other.image == this.image &&
          other.name == this.name &&
          other.price == this.price &&
          other.qty == this.qty &&
          other.seqno == this.seqno &&
          other.detailseqno == this.detailseqno &&
          other.strukno == this.strukno);
}

class CartCompanion extends UpdateCompanion<ItemCart> {
  final Value<int> id;
  final Value<String> menuid;
  final Value<String> ref_menuid;
  final Value<String> image;
  final Value<String> name;
  final Value<double> price;
  final Value<double> qty;
  final Value<int> seqno;
  final Value<int> detailseqno;
  final Value<int> strukno;
  const CartCompanion({
    this.id = const Value.absent(),
    this.menuid = const Value.absent(),
    this.ref_menuid = const Value.absent(),
    this.image = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.qty = const Value.absent(),
    this.seqno = const Value.absent(),
    this.detailseqno = const Value.absent(),
    this.strukno = const Value.absent(),
  });
  CartCompanion.insert({
    this.id = const Value.absent(),
    @required String menuid,
    this.ref_menuid = const Value.absent(),
    @required String image,
    @required String name,
    @required double price,
    @required double qty,
    @required int seqno,
    @required int detailseqno,
    this.strukno = const Value.absent(),
  })  : menuid = Value(menuid),
        image = Value(image),
        name = Value(name),
        price = Value(price),
        qty = Value(qty),
        seqno = Value(seqno),
        detailseqno = Value(detailseqno);
  static Insertable<ItemCart> custom({
    Expression<int> id,
    Expression<String> menuid,
    Expression<String> ref_menuid,
    Expression<String> image,
    Expression<String> name,
    Expression<double> price,
    Expression<double> qty,
    Expression<int> seqno,
    Expression<int> detailseqno,
    Expression<int> strukno,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (menuid != null) 'menuid': menuid,
      if (ref_menuid != null) 'ref_menuid': ref_menuid,
      if (image != null) 'image': image,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (qty != null) 'qty': qty,
      if (seqno != null) 'seqno': seqno,
      if (detailseqno != null) 'detailseqno': detailseqno,
      if (strukno != null) 'strukno': strukno,
    });
  }

  CartCompanion copyWith(
      {Value<int> id,
      Value<String> menuid,
      Value<String> ref_menuid,
      Value<String> image,
      Value<String> name,
      Value<double> price,
      Value<double> qty,
      Value<int> seqno,
      Value<int> detailseqno,
      Value<int> strukno}) {
    return CartCompanion(
      id: id ?? this.id,
      menuid: menuid ?? this.menuid,
      ref_menuid: ref_menuid ?? this.ref_menuid,
      image: image ?? this.image,
      name: name ?? this.name,
      price: price ?? this.price,
      qty: qty ?? this.qty,
      seqno: seqno ?? this.seqno,
      detailseqno: detailseqno ?? this.detailseqno,
      strukno: strukno ?? this.strukno,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (menuid.present) {
      map['menuid'] = Variable<String>(menuid.value);
    }
    if (ref_menuid.present) {
      map['ref_menuid'] = Variable<String>(ref_menuid.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (qty.present) {
      map['qty'] = Variable<double>(qty.value);
    }
    if (seqno.present) {
      map['seqno'] = Variable<int>(seqno.value);
    }
    if (detailseqno.present) {
      map['detailseqno'] = Variable<int>(detailseqno.value);
    }
    if (strukno.present) {
      map['strukno'] = Variable<int>(strukno.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CartCompanion(')
          ..write('id: $id, ')
          ..write('menuid: $menuid, ')
          ..write('ref_menuid: $ref_menuid, ')
          ..write('image: $image, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('qty: $qty, ')
          ..write('seqno: $seqno, ')
          ..write('detailseqno: $detailseqno, ')
          ..write('strukno: $strukno')
          ..write(')'))
        .toString();
  }
}

class $CartTable extends Cart with TableInfo<$CartTable, ItemCart> {
  final GeneratedDatabase _db;
  final String _alias;
  $CartTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _menuidMeta = const VerificationMeta('menuid');
  GeneratedTextColumn _menuid;
  @override
  GeneratedTextColumn get menuid => _menuid ??= _constructMenuid();
  GeneratedTextColumn _constructMenuid() {
    return GeneratedTextColumn(
      'menuid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ref_menuidMeta = const VerificationMeta('ref_menuid');
  GeneratedTextColumn _ref_menuid;
  @override
  GeneratedTextColumn get ref_menuid => _ref_menuid ??= _constructRefMenuid();
  GeneratedTextColumn _constructRefMenuid() {
    return GeneratedTextColumn(
      'ref_menuid',
      $tableName,
      true,
    );
  }

  final VerificationMeta _imageMeta = const VerificationMeta('image');
  GeneratedTextColumn _image;
  @override
  GeneratedTextColumn get image => _image ??= _constructImage();
  GeneratedTextColumn _constructImage() {
    return GeneratedTextColumn(
      'image',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _priceMeta = const VerificationMeta('price');
  GeneratedRealColumn _price;
  @override
  GeneratedRealColumn get price => _price ??= _constructPrice();
  GeneratedRealColumn _constructPrice() {
    return GeneratedRealColumn(
      'price',
      $tableName,
      false,
    );
  }

  final VerificationMeta _qtyMeta = const VerificationMeta('qty');
  GeneratedRealColumn _qty;
  @override
  GeneratedRealColumn get qty => _qty ??= _constructQty();
  GeneratedRealColumn _constructQty() {
    return GeneratedRealColumn(
      'qty',
      $tableName,
      false,
    );
  }

  final VerificationMeta _seqnoMeta = const VerificationMeta('seqno');
  GeneratedIntColumn _seqno;
  @override
  GeneratedIntColumn get seqno => _seqno ??= _constructSeqno();
  GeneratedIntColumn _constructSeqno() {
    return GeneratedIntColumn(
      'seqno',
      $tableName,
      false,
    );
  }

  final VerificationMeta _detailseqnoMeta =
      const VerificationMeta('detailseqno');
  GeneratedIntColumn _detailseqno;
  @override
  GeneratedIntColumn get detailseqno =>
      _detailseqno ??= _constructDetailseqno();
  GeneratedIntColumn _constructDetailseqno() {
    return GeneratedIntColumn(
      'detailseqno',
      $tableName,
      false,
    );
  }

  final VerificationMeta _struknoMeta = const VerificationMeta('strukno');
  GeneratedIntColumn _strukno;
  @override
  GeneratedIntColumn get strukno => _strukno ??= _constructStrukno();
  GeneratedIntColumn _constructStrukno() {
    return GeneratedIntColumn(
      'strukno',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        menuid,
        ref_menuid,
        image,
        name,
        price,
        qty,
        seqno,
        detailseqno,
        strukno
      ];
  @override
  $CartTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cart';
  @override
  final String actualTableName = 'cart';
  @override
  VerificationContext validateIntegrity(Insertable<ItemCart> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('menuid')) {
      context.handle(_menuidMeta,
          menuid.isAcceptableOrUnknown(data['menuid'], _menuidMeta));
    } else if (isInserting) {
      context.missing(_menuidMeta);
    }
    if (data.containsKey('ref_menuid')) {
      context.handle(
          _ref_menuidMeta,
          ref_menuid.isAcceptableOrUnknown(
              data['ref_menuid'], _ref_menuidMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image'], _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price'], _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('qty')) {
      context.handle(
          _qtyMeta, qty.isAcceptableOrUnknown(data['qty'], _qtyMeta));
    } else if (isInserting) {
      context.missing(_qtyMeta);
    }
    if (data.containsKey('seqno')) {
      context.handle(
          _seqnoMeta, seqno.isAcceptableOrUnknown(data['seqno'], _seqnoMeta));
    } else if (isInserting) {
      context.missing(_seqnoMeta);
    }
    if (data.containsKey('detailseqno')) {
      context.handle(
          _detailseqnoMeta,
          detailseqno.isAcceptableOrUnknown(
              data['detailseqno'], _detailseqnoMeta));
    } else if (isInserting) {
      context.missing(_detailseqnoMeta);
    }
    if (data.containsKey('strukno')) {
      context.handle(_struknoMeta,
          strukno.isAcceptableOrUnknown(data['strukno'], _struknoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ItemCart map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ItemCart.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CartTable createAlias(String alias) {
    return $CartTable(_db, alias);
  }
}

class AdditionalMenuTemp extends DataClass
    implements Insertable<AdditionalMenuTemp> {
  final int id;
  final int menuid;
  final int ref_menuid;
  final int seqno;
  final int detailseqno;
  final String menuname;
  final int qty;
  final double hjual;
  final String menupict;
  AdditionalMenuTemp(
      {@required this.id,
      @required this.menuid,
      @required this.ref_menuid,
      @required this.seqno,
      @required this.detailseqno,
      @required this.menuname,
      @required this.qty,
      @required this.hjual,
      @required this.menupict});
  factory AdditionalMenuTemp.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return AdditionalMenuTemp(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      menuid: intType.mapFromDatabaseResponse(data['${effectivePrefix}menuid']),
      ref_menuid:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}ref_menuid']),
      seqno: intType.mapFromDatabaseResponse(data['${effectivePrefix}seqno']),
      detailseqno: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}detailseqno']),
      menuname: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}menuname']),
      qty: intType.mapFromDatabaseResponse(data['${effectivePrefix}qty']),
      hjual:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}hjual']),
      menupict: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}menupict']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || menuid != null) {
      map['menuid'] = Variable<int>(menuid);
    }
    if (!nullToAbsent || ref_menuid != null) {
      map['ref_menuid'] = Variable<int>(ref_menuid);
    }
    if (!nullToAbsent || seqno != null) {
      map['seqno'] = Variable<int>(seqno);
    }
    if (!nullToAbsent || detailseqno != null) {
      map['detailseqno'] = Variable<int>(detailseqno);
    }
    if (!nullToAbsent || menuname != null) {
      map['menuname'] = Variable<String>(menuname);
    }
    if (!nullToAbsent || qty != null) {
      map['qty'] = Variable<int>(qty);
    }
    if (!nullToAbsent || hjual != null) {
      map['hjual'] = Variable<double>(hjual);
    }
    if (!nullToAbsent || menupict != null) {
      map['menupict'] = Variable<String>(menupict);
    }
    return map;
  }

  AdditionalMenuCompanion toCompanion(bool nullToAbsent) {
    return AdditionalMenuCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      menuid:
          menuid == null && nullToAbsent ? const Value.absent() : Value(menuid),
      ref_menuid: ref_menuid == null && nullToAbsent
          ? const Value.absent()
          : Value(ref_menuid),
      seqno:
          seqno == null && nullToAbsent ? const Value.absent() : Value(seqno),
      detailseqno: detailseqno == null && nullToAbsent
          ? const Value.absent()
          : Value(detailseqno),
      menuname: menuname == null && nullToAbsent
          ? const Value.absent()
          : Value(menuname),
      qty: qty == null && nullToAbsent ? const Value.absent() : Value(qty),
      hjual:
          hjual == null && nullToAbsent ? const Value.absent() : Value(hjual),
      menupict: menupict == null && nullToAbsent
          ? const Value.absent()
          : Value(menupict),
    );
  }

  factory AdditionalMenuTemp.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return AdditionalMenuTemp(
      id: serializer.fromJson<int>(json['id']),
      menuid: serializer.fromJson<int>(json['menuid']),
      ref_menuid: serializer.fromJson<int>(json['ref_menuid']),
      seqno: serializer.fromJson<int>(json['seqno']),
      detailseqno: serializer.fromJson<int>(json['detailseqno']),
      menuname: serializer.fromJson<String>(json['menuname']),
      qty: serializer.fromJson<int>(json['qty']),
      hjual: serializer.fromJson<double>(json['hjual']),
      menupict: serializer.fromJson<String>(json['menupict']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'menuid': serializer.toJson<int>(menuid),
      'ref_menuid': serializer.toJson<int>(ref_menuid),
      'seqno': serializer.toJson<int>(seqno),
      'detailseqno': serializer.toJson<int>(detailseqno),
      'menuname': serializer.toJson<String>(menuname),
      'qty': serializer.toJson<int>(qty),
      'hjual': serializer.toJson<double>(hjual),
      'menupict': serializer.toJson<String>(menupict),
    };
  }

  AdditionalMenuTemp copyWith(
          {int id,
          int menuid,
          int ref_menuid,
          int seqno,
          int detailseqno,
          String menuname,
          int qty,
          double hjual,
          String menupict}) =>
      AdditionalMenuTemp(
        id: id ?? this.id,
        menuid: menuid ?? this.menuid,
        ref_menuid: ref_menuid ?? this.ref_menuid,
        seqno: seqno ?? this.seqno,
        detailseqno: detailseqno ?? this.detailseqno,
        menuname: menuname ?? this.menuname,
        qty: qty ?? this.qty,
        hjual: hjual ?? this.hjual,
        menupict: menupict ?? this.menupict,
      );
  @override
  String toString() {
    return (StringBuffer('AdditionalMenuTemp(')
          ..write('id: $id, ')
          ..write('menuid: $menuid, ')
          ..write('ref_menuid: $ref_menuid, ')
          ..write('seqno: $seqno, ')
          ..write('detailseqno: $detailseqno, ')
          ..write('menuname: $menuname, ')
          ..write('qty: $qty, ')
          ..write('hjual: $hjual, ')
          ..write('menupict: $menupict')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          menuid.hashCode,
          $mrjc(
              ref_menuid.hashCode,
              $mrjc(
                  seqno.hashCode,
                  $mrjc(
                      detailseqno.hashCode,
                      $mrjc(
                          menuname.hashCode,
                          $mrjc(qty.hashCode,
                              $mrjc(hjual.hashCode, menupict.hashCode)))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is AdditionalMenuTemp &&
          other.id == this.id &&
          other.menuid == this.menuid &&
          other.ref_menuid == this.ref_menuid &&
          other.seqno == this.seqno &&
          other.detailseqno == this.detailseqno &&
          other.menuname == this.menuname &&
          other.qty == this.qty &&
          other.hjual == this.hjual &&
          other.menupict == this.menupict);
}

class AdditionalMenuCompanion extends UpdateCompanion<AdditionalMenuTemp> {
  final Value<int> id;
  final Value<int> menuid;
  final Value<int> ref_menuid;
  final Value<int> seqno;
  final Value<int> detailseqno;
  final Value<String> menuname;
  final Value<int> qty;
  final Value<double> hjual;
  final Value<String> menupict;
  const AdditionalMenuCompanion({
    this.id = const Value.absent(),
    this.menuid = const Value.absent(),
    this.ref_menuid = const Value.absent(),
    this.seqno = const Value.absent(),
    this.detailseqno = const Value.absent(),
    this.menuname = const Value.absent(),
    this.qty = const Value.absent(),
    this.hjual = const Value.absent(),
    this.menupict = const Value.absent(),
  });
  AdditionalMenuCompanion.insert({
    this.id = const Value.absent(),
    @required int menuid,
    @required int ref_menuid,
    @required int seqno,
    @required int detailseqno,
    @required String menuname,
    @required int qty,
    @required double hjual,
    @required String menupict,
  })  : menuid = Value(menuid),
        ref_menuid = Value(ref_menuid),
        seqno = Value(seqno),
        detailseqno = Value(detailseqno),
        menuname = Value(menuname),
        qty = Value(qty),
        hjual = Value(hjual),
        menupict = Value(menupict);
  static Insertable<AdditionalMenuTemp> custom({
    Expression<int> id,
    Expression<int> menuid,
    Expression<int> ref_menuid,
    Expression<int> seqno,
    Expression<int> detailseqno,
    Expression<String> menuname,
    Expression<int> qty,
    Expression<double> hjual,
    Expression<String> menupict,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (menuid != null) 'menuid': menuid,
      if (ref_menuid != null) 'ref_menuid': ref_menuid,
      if (seqno != null) 'seqno': seqno,
      if (detailseqno != null) 'detailseqno': detailseqno,
      if (menuname != null) 'menuname': menuname,
      if (qty != null) 'qty': qty,
      if (hjual != null) 'hjual': hjual,
      if (menupict != null) 'menupict': menupict,
    });
  }

  AdditionalMenuCompanion copyWith(
      {Value<int> id,
      Value<int> menuid,
      Value<int> ref_menuid,
      Value<int> seqno,
      Value<int> detailseqno,
      Value<String> menuname,
      Value<int> qty,
      Value<double> hjual,
      Value<String> menupict}) {
    return AdditionalMenuCompanion(
      id: id ?? this.id,
      menuid: menuid ?? this.menuid,
      ref_menuid: ref_menuid ?? this.ref_menuid,
      seqno: seqno ?? this.seqno,
      detailseqno: detailseqno ?? this.detailseqno,
      menuname: menuname ?? this.menuname,
      qty: qty ?? this.qty,
      hjual: hjual ?? this.hjual,
      menupict: menupict ?? this.menupict,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (menuid.present) {
      map['menuid'] = Variable<int>(menuid.value);
    }
    if (ref_menuid.present) {
      map['ref_menuid'] = Variable<int>(ref_menuid.value);
    }
    if (seqno.present) {
      map['seqno'] = Variable<int>(seqno.value);
    }
    if (detailseqno.present) {
      map['detailseqno'] = Variable<int>(detailseqno.value);
    }
    if (menuname.present) {
      map['menuname'] = Variable<String>(menuname.value);
    }
    if (qty.present) {
      map['qty'] = Variable<int>(qty.value);
    }
    if (hjual.present) {
      map['hjual'] = Variable<double>(hjual.value);
    }
    if (menupict.present) {
      map['menupict'] = Variable<String>(menupict.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AdditionalMenuCompanion(')
          ..write('id: $id, ')
          ..write('menuid: $menuid, ')
          ..write('ref_menuid: $ref_menuid, ')
          ..write('seqno: $seqno, ')
          ..write('detailseqno: $detailseqno, ')
          ..write('menuname: $menuname, ')
          ..write('qty: $qty, ')
          ..write('hjual: $hjual, ')
          ..write('menupict: $menupict')
          ..write(')'))
        .toString();
  }
}

class $AdditionalMenuTable extends AdditionalMenu
    with TableInfo<$AdditionalMenuTable, AdditionalMenuTemp> {
  final GeneratedDatabase _db;
  final String _alias;
  $AdditionalMenuTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _menuidMeta = const VerificationMeta('menuid');
  GeneratedIntColumn _menuid;
  @override
  GeneratedIntColumn get menuid => _menuid ??= _constructMenuid();
  GeneratedIntColumn _constructMenuid() {
    return GeneratedIntColumn(
      'menuid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ref_menuidMeta = const VerificationMeta('ref_menuid');
  GeneratedIntColumn _ref_menuid;
  @override
  GeneratedIntColumn get ref_menuid => _ref_menuid ??= _constructRefMenuid();
  GeneratedIntColumn _constructRefMenuid() {
    return GeneratedIntColumn(
      'ref_menuid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _seqnoMeta = const VerificationMeta('seqno');
  GeneratedIntColumn _seqno;
  @override
  GeneratedIntColumn get seqno => _seqno ??= _constructSeqno();
  GeneratedIntColumn _constructSeqno() {
    return GeneratedIntColumn(
      'seqno',
      $tableName,
      false,
    );
  }

  final VerificationMeta _detailseqnoMeta =
      const VerificationMeta('detailseqno');
  GeneratedIntColumn _detailseqno;
  @override
  GeneratedIntColumn get detailseqno =>
      _detailseqno ??= _constructDetailseqno();
  GeneratedIntColumn _constructDetailseqno() {
    return GeneratedIntColumn(
      'detailseqno',
      $tableName,
      false,
    );
  }

  final VerificationMeta _menunameMeta = const VerificationMeta('menuname');
  GeneratedTextColumn _menuname;
  @override
  GeneratedTextColumn get menuname => _menuname ??= _constructMenuname();
  GeneratedTextColumn _constructMenuname() {
    return GeneratedTextColumn(
      'menuname',
      $tableName,
      false,
    );
  }

  final VerificationMeta _qtyMeta = const VerificationMeta('qty');
  GeneratedIntColumn _qty;
  @override
  GeneratedIntColumn get qty => _qty ??= _constructQty();
  GeneratedIntColumn _constructQty() {
    return GeneratedIntColumn(
      'qty',
      $tableName,
      false,
    );
  }

  final VerificationMeta _hjualMeta = const VerificationMeta('hjual');
  GeneratedRealColumn _hjual;
  @override
  GeneratedRealColumn get hjual => _hjual ??= _constructHjual();
  GeneratedRealColumn _constructHjual() {
    return GeneratedRealColumn(
      'hjual',
      $tableName,
      false,
    );
  }

  final VerificationMeta _menupictMeta = const VerificationMeta('menupict');
  GeneratedTextColumn _menupict;
  @override
  GeneratedTextColumn get menupict => _menupict ??= _constructMenupict();
  GeneratedTextColumn _constructMenupict() {
    return GeneratedTextColumn(
      'menupict',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        menuid,
        ref_menuid,
        seqno,
        detailseqno,
        menuname,
        qty,
        hjual,
        menupict
      ];
  @override
  $AdditionalMenuTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'additional_menu';
  @override
  final String actualTableName = 'additional_menu';
  @override
  VerificationContext validateIntegrity(Insertable<AdditionalMenuTemp> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('menuid')) {
      context.handle(_menuidMeta,
          menuid.isAcceptableOrUnknown(data['menuid'], _menuidMeta));
    } else if (isInserting) {
      context.missing(_menuidMeta);
    }
    if (data.containsKey('ref_menuid')) {
      context.handle(
          _ref_menuidMeta,
          ref_menuid.isAcceptableOrUnknown(
              data['ref_menuid'], _ref_menuidMeta));
    } else if (isInserting) {
      context.missing(_ref_menuidMeta);
    }
    if (data.containsKey('seqno')) {
      context.handle(
          _seqnoMeta, seqno.isAcceptableOrUnknown(data['seqno'], _seqnoMeta));
    } else if (isInserting) {
      context.missing(_seqnoMeta);
    }
    if (data.containsKey('detailseqno')) {
      context.handle(
          _detailseqnoMeta,
          detailseqno.isAcceptableOrUnknown(
              data['detailseqno'], _detailseqnoMeta));
    } else if (isInserting) {
      context.missing(_detailseqnoMeta);
    }
    if (data.containsKey('menuname')) {
      context.handle(_menunameMeta,
          menuname.isAcceptableOrUnknown(data['menuname'], _menunameMeta));
    } else if (isInserting) {
      context.missing(_menunameMeta);
    }
    if (data.containsKey('qty')) {
      context.handle(
          _qtyMeta, qty.isAcceptableOrUnknown(data['qty'], _qtyMeta));
    } else if (isInserting) {
      context.missing(_qtyMeta);
    }
    if (data.containsKey('hjual')) {
      context.handle(
          _hjualMeta, hjual.isAcceptableOrUnknown(data['hjual'], _hjualMeta));
    } else if (isInserting) {
      context.missing(_hjualMeta);
    }
    if (data.containsKey('menupict')) {
      context.handle(_menupictMeta,
          menupict.isAcceptableOrUnknown(data['menupict'], _menupictMeta));
    } else if (isInserting) {
      context.missing(_menupictMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AdditionalMenuTemp map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return AdditionalMenuTemp.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $AdditionalMenuTable createAlias(String alias) {
    return $AdditionalMenuTable(_db, alias);
  }
}

class Order extends DataClass implements Insertable<Order> {
  final int id;
  final String strukno;
  final double total_price;
  Order(
      {@required this.id, @required this.strukno, @required this.total_price});
  factory Order.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Order(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      strukno:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}strukno']),
      total_price: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}total_price']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || strukno != null) {
      map['strukno'] = Variable<String>(strukno);
    }
    if (!nullToAbsent || total_price != null) {
      map['total_price'] = Variable<double>(total_price);
    }
    return map;
  }

  TransactionOrderCompanion toCompanion(bool nullToAbsent) {
    return TransactionOrderCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      strukno: strukno == null && nullToAbsent
          ? const Value.absent()
          : Value(strukno),
      total_price: total_price == null && nullToAbsent
          ? const Value.absent()
          : Value(total_price),
    );
  }

  factory Order.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Order(
      id: serializer.fromJson<int>(json['id']),
      strukno: serializer.fromJson<String>(json['strukno']),
      total_price: serializer.fromJson<double>(json['total_price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'strukno': serializer.toJson<String>(strukno),
      'total_price': serializer.toJson<double>(total_price),
    };
  }

  Order copyWith({int id, String strukno, double total_price}) => Order(
        id: id ?? this.id,
        strukno: strukno ?? this.strukno,
        total_price: total_price ?? this.total_price,
      );
  @override
  String toString() {
    return (StringBuffer('Order(')
          ..write('id: $id, ')
          ..write('strukno: $strukno, ')
          ..write('total_price: $total_price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(strukno.hashCode, total_price.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Order &&
          other.id == this.id &&
          other.strukno == this.strukno &&
          other.total_price == this.total_price);
}

class TransactionOrderCompanion extends UpdateCompanion<Order> {
  final Value<int> id;
  final Value<String> strukno;
  final Value<double> total_price;
  const TransactionOrderCompanion({
    this.id = const Value.absent(),
    this.strukno = const Value.absent(),
    this.total_price = const Value.absent(),
  });
  TransactionOrderCompanion.insert({
    this.id = const Value.absent(),
    @required String strukno,
    @required double total_price,
  })  : strukno = Value(strukno),
        total_price = Value(total_price);
  static Insertable<Order> custom({
    Expression<int> id,
    Expression<String> strukno,
    Expression<double> total_price,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (strukno != null) 'strukno': strukno,
      if (total_price != null) 'total_price': total_price,
    });
  }

  TransactionOrderCompanion copyWith(
      {Value<int> id, Value<String> strukno, Value<double> total_price}) {
    return TransactionOrderCompanion(
      id: id ?? this.id,
      strukno: strukno ?? this.strukno,
      total_price: total_price ?? this.total_price,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (strukno.present) {
      map['strukno'] = Variable<String>(strukno.value);
    }
    if (total_price.present) {
      map['total_price'] = Variable<double>(total_price.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionOrderCompanion(')
          ..write('id: $id, ')
          ..write('strukno: $strukno, ')
          ..write('total_price: $total_price')
          ..write(')'))
        .toString();
  }
}

class $TransactionOrderTable extends TransactionOrder
    with TableInfo<$TransactionOrderTable, Order> {
  final GeneratedDatabase _db;
  final String _alias;
  $TransactionOrderTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _struknoMeta = const VerificationMeta('strukno');
  GeneratedTextColumn _strukno;
  @override
  GeneratedTextColumn get strukno => _strukno ??= _constructStrukno();
  GeneratedTextColumn _constructStrukno() {
    return GeneratedTextColumn(
      'strukno',
      $tableName,
      false,
    );
  }

  final VerificationMeta _total_priceMeta =
      const VerificationMeta('total_price');
  GeneratedRealColumn _total_price;
  @override
  GeneratedRealColumn get total_price =>
      _total_price ??= _constructTotalPrice();
  GeneratedRealColumn _constructTotalPrice() {
    return GeneratedRealColumn(
      'total_price',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, strukno, total_price];
  @override
  $TransactionOrderTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'transaction_order';
  @override
  final String actualTableName = 'transaction_order';
  @override
  VerificationContext validateIntegrity(Insertable<Order> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('strukno')) {
      context.handle(_struknoMeta,
          strukno.isAcceptableOrUnknown(data['strukno'], _struknoMeta));
    } else if (isInserting) {
      context.missing(_struknoMeta);
    }
    if (data.containsKey('total_price')) {
      context.handle(
          _total_priceMeta,
          total_price.isAcceptableOrUnknown(
              data['total_price'], _total_priceMeta));
    } else if (isInserting) {
      context.missing(_total_priceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Order map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Order.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TransactionOrderTable createAlias(String alias) {
    return $TransactionOrderTable(_db, alias);
  }
}

class OrderDetail extends DataClass implements Insertable<OrderDetail> {
  final int id;
  final String strukno;
  final int menuid;
  final double ref_menuid;
  final int seqno;
  final int detailseqno;
  final String menuname;
  final int qty;
  final double hjual;
  final String menupict;
  OrderDetail(
      {@required this.id,
      @required this.strukno,
      @required this.menuid,
      this.ref_menuid,
      @required this.seqno,
      @required this.detailseqno,
      @required this.menuname,
      @required this.qty,
      @required this.hjual,
      @required this.menupict});
  factory OrderDetail.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return OrderDetail(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      strukno:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}strukno']),
      menuid: intType.mapFromDatabaseResponse(data['${effectivePrefix}menuid']),
      ref_menuid: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}ref_menuid']),
      seqno: intType.mapFromDatabaseResponse(data['${effectivePrefix}seqno']),
      detailseqno: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}detailseqno']),
      menuname: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}menuname']),
      qty: intType.mapFromDatabaseResponse(data['${effectivePrefix}qty']),
      hjual:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}hjual']),
      menupict: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}menupict']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || strukno != null) {
      map['strukno'] = Variable<String>(strukno);
    }
    if (!nullToAbsent || menuid != null) {
      map['menuid'] = Variable<int>(menuid);
    }
    if (!nullToAbsent || ref_menuid != null) {
      map['ref_menuid'] = Variable<double>(ref_menuid);
    }
    if (!nullToAbsent || seqno != null) {
      map['seqno'] = Variable<int>(seqno);
    }
    if (!nullToAbsent || detailseqno != null) {
      map['detailseqno'] = Variable<int>(detailseqno);
    }
    if (!nullToAbsent || menuname != null) {
      map['menuname'] = Variable<String>(menuname);
    }
    if (!nullToAbsent || qty != null) {
      map['qty'] = Variable<int>(qty);
    }
    if (!nullToAbsent || hjual != null) {
      map['hjual'] = Variable<double>(hjual);
    }
    if (!nullToAbsent || menupict != null) {
      map['menupict'] = Variable<String>(menupict);
    }
    return map;
  }

  TransactionOrderDetailCompanion toCompanion(bool nullToAbsent) {
    return TransactionOrderDetailCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      strukno: strukno == null && nullToAbsent
          ? const Value.absent()
          : Value(strukno),
      menuid:
          menuid == null && nullToAbsent ? const Value.absent() : Value(menuid),
      ref_menuid: ref_menuid == null && nullToAbsent
          ? const Value.absent()
          : Value(ref_menuid),
      seqno:
          seqno == null && nullToAbsent ? const Value.absent() : Value(seqno),
      detailseqno: detailseqno == null && nullToAbsent
          ? const Value.absent()
          : Value(detailseqno),
      menuname: menuname == null && nullToAbsent
          ? const Value.absent()
          : Value(menuname),
      qty: qty == null && nullToAbsent ? const Value.absent() : Value(qty),
      hjual:
          hjual == null && nullToAbsent ? const Value.absent() : Value(hjual),
      menupict: menupict == null && nullToAbsent
          ? const Value.absent()
          : Value(menupict),
    );
  }

  factory OrderDetail.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return OrderDetail(
      id: serializer.fromJson<int>(json['id']),
      strukno: serializer.fromJson<String>(json['strukno']),
      menuid: serializer.fromJson<int>(json['menuid']),
      ref_menuid: serializer.fromJson<double>(json['ref_menuid']),
      seqno: serializer.fromJson<int>(json['seqno']),
      detailseqno: serializer.fromJson<int>(json['detailseqno']),
      menuname: serializer.fromJson<String>(json['menuname']),
      qty: serializer.fromJson<int>(json['qty']),
      hjual: serializer.fromJson<double>(json['hjual']),
      menupict: serializer.fromJson<String>(json['menupict']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'strukno': serializer.toJson<String>(strukno),
      'menuid': serializer.toJson<int>(menuid),
      'ref_menuid': serializer.toJson<double>(ref_menuid),
      'seqno': serializer.toJson<int>(seqno),
      'detailseqno': serializer.toJson<int>(detailseqno),
      'menuname': serializer.toJson<String>(menuname),
      'qty': serializer.toJson<int>(qty),
      'hjual': serializer.toJson<double>(hjual),
      'menupict': serializer.toJson<String>(menupict),
    };
  }

  OrderDetail copyWith(
          {int id,
          String strukno,
          int menuid,
          double ref_menuid,
          int seqno,
          int detailseqno,
          String menuname,
          int qty,
          double hjual,
          String menupict}) =>
      OrderDetail(
        id: id ?? this.id,
        strukno: strukno ?? this.strukno,
        menuid: menuid ?? this.menuid,
        ref_menuid: ref_menuid ?? this.ref_menuid,
        seqno: seqno ?? this.seqno,
        detailseqno: detailseqno ?? this.detailseqno,
        menuname: menuname ?? this.menuname,
        qty: qty ?? this.qty,
        hjual: hjual ?? this.hjual,
        menupict: menupict ?? this.menupict,
      );
  @override
  String toString() {
    return (StringBuffer('OrderDetail(')
          ..write('id: $id, ')
          ..write('strukno: $strukno, ')
          ..write('menuid: $menuid, ')
          ..write('ref_menuid: $ref_menuid, ')
          ..write('seqno: $seqno, ')
          ..write('detailseqno: $detailseqno, ')
          ..write('menuname: $menuname, ')
          ..write('qty: $qty, ')
          ..write('hjual: $hjual, ')
          ..write('menupict: $menupict')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          strukno.hashCode,
          $mrjc(
              menuid.hashCode,
              $mrjc(
                  ref_menuid.hashCode,
                  $mrjc(
                      seqno.hashCode,
                      $mrjc(
                          detailseqno.hashCode,
                          $mrjc(
                              menuname.hashCode,
                              $mrjc(
                                  qty.hashCode,
                                  $mrjc(hjual.hashCode,
                                      menupict.hashCode))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is OrderDetail &&
          other.id == this.id &&
          other.strukno == this.strukno &&
          other.menuid == this.menuid &&
          other.ref_menuid == this.ref_menuid &&
          other.seqno == this.seqno &&
          other.detailseqno == this.detailseqno &&
          other.menuname == this.menuname &&
          other.qty == this.qty &&
          other.hjual == this.hjual &&
          other.menupict == this.menupict);
}

class TransactionOrderDetailCompanion extends UpdateCompanion<OrderDetail> {
  final Value<int> id;
  final Value<String> strukno;
  final Value<int> menuid;
  final Value<double> ref_menuid;
  final Value<int> seqno;
  final Value<int> detailseqno;
  final Value<String> menuname;
  final Value<int> qty;
  final Value<double> hjual;
  final Value<String> menupict;
  const TransactionOrderDetailCompanion({
    this.id = const Value.absent(),
    this.strukno = const Value.absent(),
    this.menuid = const Value.absent(),
    this.ref_menuid = const Value.absent(),
    this.seqno = const Value.absent(),
    this.detailseqno = const Value.absent(),
    this.menuname = const Value.absent(),
    this.qty = const Value.absent(),
    this.hjual = const Value.absent(),
    this.menupict = const Value.absent(),
  });
  TransactionOrderDetailCompanion.insert({
    this.id = const Value.absent(),
    @required String strukno,
    @required int menuid,
    this.ref_menuid = const Value.absent(),
    @required int seqno,
    @required int detailseqno,
    @required String menuname,
    @required int qty,
    @required double hjual,
    @required String menupict,
  })  : strukno = Value(strukno),
        menuid = Value(menuid),
        seqno = Value(seqno),
        detailseqno = Value(detailseqno),
        menuname = Value(menuname),
        qty = Value(qty),
        hjual = Value(hjual),
        menupict = Value(menupict);
  static Insertable<OrderDetail> custom({
    Expression<int> id,
    Expression<String> strukno,
    Expression<int> menuid,
    Expression<double> ref_menuid,
    Expression<int> seqno,
    Expression<int> detailseqno,
    Expression<String> menuname,
    Expression<int> qty,
    Expression<double> hjual,
    Expression<String> menupict,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (strukno != null) 'strukno': strukno,
      if (menuid != null) 'menuid': menuid,
      if (ref_menuid != null) 'ref_menuid': ref_menuid,
      if (seqno != null) 'seqno': seqno,
      if (detailseqno != null) 'detailseqno': detailseqno,
      if (menuname != null) 'menuname': menuname,
      if (qty != null) 'qty': qty,
      if (hjual != null) 'hjual': hjual,
      if (menupict != null) 'menupict': menupict,
    });
  }

  TransactionOrderDetailCompanion copyWith(
      {Value<int> id,
      Value<String> strukno,
      Value<int> menuid,
      Value<double> ref_menuid,
      Value<int> seqno,
      Value<int> detailseqno,
      Value<String> menuname,
      Value<int> qty,
      Value<double> hjual,
      Value<String> menupict}) {
    return TransactionOrderDetailCompanion(
      id: id ?? this.id,
      strukno: strukno ?? this.strukno,
      menuid: menuid ?? this.menuid,
      ref_menuid: ref_menuid ?? this.ref_menuid,
      seqno: seqno ?? this.seqno,
      detailseqno: detailseqno ?? this.detailseqno,
      menuname: menuname ?? this.menuname,
      qty: qty ?? this.qty,
      hjual: hjual ?? this.hjual,
      menupict: menupict ?? this.menupict,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (strukno.present) {
      map['strukno'] = Variable<String>(strukno.value);
    }
    if (menuid.present) {
      map['menuid'] = Variable<int>(menuid.value);
    }
    if (ref_menuid.present) {
      map['ref_menuid'] = Variable<double>(ref_menuid.value);
    }
    if (seqno.present) {
      map['seqno'] = Variable<int>(seqno.value);
    }
    if (detailseqno.present) {
      map['detailseqno'] = Variable<int>(detailseqno.value);
    }
    if (menuname.present) {
      map['menuname'] = Variable<String>(menuname.value);
    }
    if (qty.present) {
      map['qty'] = Variable<int>(qty.value);
    }
    if (hjual.present) {
      map['hjual'] = Variable<double>(hjual.value);
    }
    if (menupict.present) {
      map['menupict'] = Variable<String>(menupict.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionOrderDetailCompanion(')
          ..write('id: $id, ')
          ..write('strukno: $strukno, ')
          ..write('menuid: $menuid, ')
          ..write('ref_menuid: $ref_menuid, ')
          ..write('seqno: $seqno, ')
          ..write('detailseqno: $detailseqno, ')
          ..write('menuname: $menuname, ')
          ..write('qty: $qty, ')
          ..write('hjual: $hjual, ')
          ..write('menupict: $menupict')
          ..write(')'))
        .toString();
  }
}

class $TransactionOrderDetailTable extends TransactionOrderDetail
    with TableInfo<$TransactionOrderDetailTable, OrderDetail> {
  final GeneratedDatabase _db;
  final String _alias;
  $TransactionOrderDetailTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _struknoMeta = const VerificationMeta('strukno');
  GeneratedTextColumn _strukno;
  @override
  GeneratedTextColumn get strukno => _strukno ??= _constructStrukno();
  GeneratedTextColumn _constructStrukno() {
    return GeneratedTextColumn(
      'strukno',
      $tableName,
      false,
    );
  }

  final VerificationMeta _menuidMeta = const VerificationMeta('menuid');
  GeneratedIntColumn _menuid;
  @override
  GeneratedIntColumn get menuid => _menuid ??= _constructMenuid();
  GeneratedIntColumn _constructMenuid() {
    return GeneratedIntColumn(
      'menuid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ref_menuidMeta = const VerificationMeta('ref_menuid');
  GeneratedRealColumn _ref_menuid;
  @override
  GeneratedRealColumn get ref_menuid => _ref_menuid ??= _constructRefMenuid();
  GeneratedRealColumn _constructRefMenuid() {
    return GeneratedRealColumn(
      'ref_menuid',
      $tableName,
      true,
    );
  }

  final VerificationMeta _seqnoMeta = const VerificationMeta('seqno');
  GeneratedIntColumn _seqno;
  @override
  GeneratedIntColumn get seqno => _seqno ??= _constructSeqno();
  GeneratedIntColumn _constructSeqno() {
    return GeneratedIntColumn(
      'seqno',
      $tableName,
      false,
    );
  }

  final VerificationMeta _detailseqnoMeta =
      const VerificationMeta('detailseqno');
  GeneratedIntColumn _detailseqno;
  @override
  GeneratedIntColumn get detailseqno =>
      _detailseqno ??= _constructDetailseqno();
  GeneratedIntColumn _constructDetailseqno() {
    return GeneratedIntColumn(
      'detailseqno',
      $tableName,
      false,
    );
  }

  final VerificationMeta _menunameMeta = const VerificationMeta('menuname');
  GeneratedTextColumn _menuname;
  @override
  GeneratedTextColumn get menuname => _menuname ??= _constructMenuname();
  GeneratedTextColumn _constructMenuname() {
    return GeneratedTextColumn(
      'menuname',
      $tableName,
      false,
    );
  }

  final VerificationMeta _qtyMeta = const VerificationMeta('qty');
  GeneratedIntColumn _qty;
  @override
  GeneratedIntColumn get qty => _qty ??= _constructQty();
  GeneratedIntColumn _constructQty() {
    return GeneratedIntColumn(
      'qty',
      $tableName,
      false,
    );
  }

  final VerificationMeta _hjualMeta = const VerificationMeta('hjual');
  GeneratedRealColumn _hjual;
  @override
  GeneratedRealColumn get hjual => _hjual ??= _constructHjual();
  GeneratedRealColumn _constructHjual() {
    return GeneratedRealColumn(
      'hjual',
      $tableName,
      false,
    );
  }

  final VerificationMeta _menupictMeta = const VerificationMeta('menupict');
  GeneratedTextColumn _menupict;
  @override
  GeneratedTextColumn get menupict => _menupict ??= _constructMenupict();
  GeneratedTextColumn _constructMenupict() {
    return GeneratedTextColumn(
      'menupict',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        strukno,
        menuid,
        ref_menuid,
        seqno,
        detailseqno,
        menuname,
        qty,
        hjual,
        menupict
      ];
  @override
  $TransactionOrderDetailTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'transaction_order_detail';
  @override
  final String actualTableName = 'transaction_order_detail';
  @override
  VerificationContext validateIntegrity(Insertable<OrderDetail> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('strukno')) {
      context.handle(_struknoMeta,
          strukno.isAcceptableOrUnknown(data['strukno'], _struknoMeta));
    } else if (isInserting) {
      context.missing(_struknoMeta);
    }
    if (data.containsKey('menuid')) {
      context.handle(_menuidMeta,
          menuid.isAcceptableOrUnknown(data['menuid'], _menuidMeta));
    } else if (isInserting) {
      context.missing(_menuidMeta);
    }
    if (data.containsKey('ref_menuid')) {
      context.handle(
          _ref_menuidMeta,
          ref_menuid.isAcceptableOrUnknown(
              data['ref_menuid'], _ref_menuidMeta));
    }
    if (data.containsKey('seqno')) {
      context.handle(
          _seqnoMeta, seqno.isAcceptableOrUnknown(data['seqno'], _seqnoMeta));
    } else if (isInserting) {
      context.missing(_seqnoMeta);
    }
    if (data.containsKey('detailseqno')) {
      context.handle(
          _detailseqnoMeta,
          detailseqno.isAcceptableOrUnknown(
              data['detailseqno'], _detailseqnoMeta));
    } else if (isInserting) {
      context.missing(_detailseqnoMeta);
    }
    if (data.containsKey('menuname')) {
      context.handle(_menunameMeta,
          menuname.isAcceptableOrUnknown(data['menuname'], _menunameMeta));
    } else if (isInserting) {
      context.missing(_menunameMeta);
    }
    if (data.containsKey('qty')) {
      context.handle(
          _qtyMeta, qty.isAcceptableOrUnknown(data['qty'], _qtyMeta));
    } else if (isInserting) {
      context.missing(_qtyMeta);
    }
    if (data.containsKey('hjual')) {
      context.handle(
          _hjualMeta, hjual.isAcceptableOrUnknown(data['hjual'], _hjualMeta));
    } else if (isInserting) {
      context.missing(_hjualMeta);
    }
    if (data.containsKey('menupict')) {
      context.handle(_menupictMeta,
          menupict.isAcceptableOrUnknown(data['menupict'], _menupictMeta));
    } else if (isInserting) {
      context.missing(_menupictMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderDetail map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return OrderDetail.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TransactionOrderDetailTable createAlias(String alias) {
    return $TransactionOrderDetailTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $CartTable _cart;
  $CartTable get cart => _cart ??= $CartTable(this);
  $AdditionalMenuTable _additionalMenu;
  $AdditionalMenuTable get additionalMenu =>
      _additionalMenu ??= $AdditionalMenuTable(this);
  $TransactionOrderTable _transactionOrder;
  $TransactionOrderTable get transactionOrder =>
      _transactionOrder ??= $TransactionOrderTable(this);
  $TransactionOrderDetailTable _transactionOrderDetail;
  $TransactionOrderDetailTable get transactionOrderDetail =>
      _transactionOrderDetail ??= $TransactionOrderDetailTable(this);
  Future<int> updateQtyMenu(String id) {
    return customUpdate(
      'UPDATE cart SET qty = qty + 1 WHERE menuid = :id;',
      variables: [Variable.withString(id)],
      updates: {cart},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> decreaseQtyMenu(String id) {
    return customUpdate(
      'UPDATE cart SET qty = qty - 1 WHERE menuid = :id;',
      variables: [Variable.withString(id)],
      updates: {cart},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deleteMenu(int seqno) {
    return customUpdate(
      'DELETE FROM cart WHERE seqno = :seqno',
      variables: [Variable.withInt(seqno)],
      updates: {cart},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<OrderDetail> getOrderDetail(String strukno) {
    return customSelect(
            'SELECT * FROM transaction_order_detail WHERE strukno = :strukno',
            variables: [Variable.withString(strukno)],
            readsFrom: {transactionOrderDetail})
        .map(transactionOrderDetail.mapFromRow);
  }

  Selectable<double> getOrderDetailTotalAmount(String strukno) {
    return customSelect(
        'SELECT SUM(hjual * qty) AS totalamount FROM transaction_order_detail WHERE strukno = :strukno;',
        variables: [
          Variable.withString(strukno)
        ],
        readsFrom: {
          transactionOrderDetail
        }).map((QueryRow row) => row.readDouble('totalamount'));
  }

  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [cart, additionalMenu, transactionOrder, transactionOrderDetail];
}
