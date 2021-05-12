// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Food extends DataClass implements Insertable<Food> {
  final int id;
  final String idMeal;
  final String strMeal;
  final String strMealThumb;
  Food(
      {this.id,
      @required this.idMeal,
      @required this.strMeal,
      @required this.strMealThumb});
  factory Food.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Food(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      idMeal:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}id_meal']),
      strMeal: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}str_meal']),
      strMealThumb: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}str_meal_thumb']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || idMeal != null) {
      map['id_meal'] = Variable<String>(idMeal);
    }
    if (!nullToAbsent || strMeal != null) {
      map['str_meal'] = Variable<String>(strMeal);
    }
    if (!nullToAbsent || strMealThumb != null) {
      map['str_meal_thumb'] = Variable<String>(strMealThumb);
    }
    return map;
  }

  FoodsCompanion toCompanion(bool nullToAbsent) {
    return FoodsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      idMeal:
          idMeal == null && nullToAbsent ? const Value.absent() : Value(idMeal),
      strMeal: strMeal == null && nullToAbsent
          ? const Value.absent()
          : Value(strMeal),
      strMealThumb: strMealThumb == null && nullToAbsent
          ? const Value.absent()
          : Value(strMealThumb),
    );
  }

  factory Food.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Food(
      id: serializer.fromJson<int>(json['id']),
      idMeal: serializer.fromJson<String>(json['idMeal']),
      strMeal: serializer.fromJson<String>(json['strMeal']),
      strMealThumb: serializer.fromJson<String>(json['strMealThumb']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idMeal': serializer.toJson<String>(idMeal),
      'strMeal': serializer.toJson<String>(strMeal),
      'strMealThumb': serializer.toJson<String>(strMealThumb),
    };
  }

  Food copyWith({int id, String idMeal, String strMeal, String strMealThumb}) =>
      Food(
        id: id ?? this.id,
        idMeal: idMeal ?? this.idMeal,
        strMeal: strMeal ?? this.strMeal,
        strMealThumb: strMealThumb ?? this.strMealThumb,
      );
  @override
  String toString() {
    return (StringBuffer('Food(')
          ..write('id: $id, ')
          ..write('idMeal: $idMeal, ')
          ..write('strMeal: $strMeal, ')
          ..write('strMealThumb: $strMealThumb')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(idMeal.hashCode, $mrjc(strMeal.hashCode, strMealThumb.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Food &&
          other.id == this.id &&
          other.idMeal == this.idMeal &&
          other.strMeal == this.strMeal &&
          other.strMealThumb == this.strMealThumb);
}

class FoodsCompanion extends UpdateCompanion<Food> {
  final Value<int> id;
  final Value<String> idMeal;
  final Value<String> strMeal;
  final Value<String> strMealThumb;
  const FoodsCompanion({
    this.id = const Value.absent(),
    this.idMeal = const Value.absent(),
    this.strMeal = const Value.absent(),
    this.strMealThumb = const Value.absent(),
  });
  FoodsCompanion.insert({
    this.id = const Value.absent(),
    @required String idMeal,
    @required String strMeal,
    @required String strMealThumb,
  })  : idMeal = Value(idMeal),
        strMeal = Value(strMeal),
        strMealThumb = Value(strMealThumb);
  static Insertable<Food> custom({
    Expression<int> id,
    Expression<String> idMeal,
    Expression<String> strMeal,
    Expression<String> strMealThumb,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idMeal != null) 'id_meal': idMeal,
      if (strMeal != null) 'str_meal': strMeal,
      if (strMealThumb != null) 'str_meal_thumb': strMealThumb,
    });
  }

  FoodsCompanion copyWith(
      {Value<int> id,
      Value<String> idMeal,
      Value<String> strMeal,
      Value<String> strMealThumb}) {
    return FoodsCompanion(
      id: id ?? this.id,
      idMeal: idMeal ?? this.idMeal,
      strMeal: strMeal ?? this.strMeal,
      strMealThumb: strMealThumb ?? this.strMealThumb,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idMeal.present) {
      map['id_meal'] = Variable<String>(idMeal.value);
    }
    if (strMeal.present) {
      map['str_meal'] = Variable<String>(strMeal.value);
    }
    if (strMealThumb.present) {
      map['str_meal_thumb'] = Variable<String>(strMealThumb.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoodsCompanion(')
          ..write('id: $id, ')
          ..write('idMeal: $idMeal, ')
          ..write('strMeal: $strMeal, ')
          ..write('strMealThumb: $strMealThumb')
          ..write(')'))
        .toString();
  }
}

class $FoodsTable extends Foods with TableInfo<$FoodsTable, Food> {
  final GeneratedDatabase _db;
  final String _alias;
  $FoodsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _idMealMeta = const VerificationMeta('idMeal');
  GeneratedTextColumn _idMeal;
  @override
  GeneratedTextColumn get idMeal => _idMeal ??= _constructIdMeal();
  GeneratedTextColumn _constructIdMeal() {
    return GeneratedTextColumn(
      'id_meal',
      $tableName,
      false,
    );
  }

  final VerificationMeta _strMealMeta = const VerificationMeta('strMeal');
  GeneratedTextColumn _strMeal;
  @override
  GeneratedTextColumn get strMeal => _strMeal ??= _constructStrMeal();
  GeneratedTextColumn _constructStrMeal() {
    return GeneratedTextColumn(
      'str_meal',
      $tableName,
      false,
    );
  }

  final VerificationMeta _strMealThumbMeta =
      const VerificationMeta('strMealThumb');
  GeneratedTextColumn _strMealThumb;
  @override
  GeneratedTextColumn get strMealThumb =>
      _strMealThumb ??= _constructStrMealThumb();
  GeneratedTextColumn _constructStrMealThumb() {
    return GeneratedTextColumn(
      'str_meal_thumb',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, idMeal, strMeal, strMealThumb];
  @override
  $FoodsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'foods';
  @override
  final String actualTableName = 'foods';
  @override
  VerificationContext validateIntegrity(Insertable<Food> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('id_meal')) {
      context.handle(_idMealMeta,
          idMeal.isAcceptableOrUnknown(data['id_meal'], _idMealMeta));
    } else if (isInserting) {
      context.missing(_idMealMeta);
    }
    if (data.containsKey('str_meal')) {
      context.handle(_strMealMeta,
          strMeal.isAcceptableOrUnknown(data['str_meal'], _strMealMeta));
    } else if (isInserting) {
      context.missing(_strMealMeta);
    }
    if (data.containsKey('str_meal_thumb')) {
      context.handle(
          _strMealThumbMeta,
          strMealThumb.isAcceptableOrUnknown(
              data['str_meal_thumb'], _strMealThumbMeta));
    } else if (isInserting) {
      context.missing(_strMealThumbMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Food map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Food.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $FoodsTable createAlias(String alias) {
    return $FoodsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $FoodsTable _foods;
  $FoodsTable get foods => _foods ??= $FoodsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [foods];
}
