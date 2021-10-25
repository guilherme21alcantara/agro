// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class TableAtividadeData extends DataClass
    implements Insertable<TableAtividadeData> {
  final String id;
  final String atividade;
  final DateTime data;
  final String idFazenda;
  final String cultura;
  final String area;
  final String subArea;
  final String safra;
  final double areaEmHectares;
  final String perimetro;
  final int status;
  final bool isSincronizadoAPI;
  final String idMaquinas;
  final String idInsumos;
  final String idColaboradores;
  final String? telemetria;
  final String? paradas;
  TableAtividadeData(
      {required this.id,
      required this.atividade,
      required this.data,
      required this.idFazenda,
      required this.cultura,
      required this.area,
      required this.subArea,
      required this.safra,
      required this.areaEmHectares,
      required this.perimetro,
      required this.status,
      required this.isSincronizadoAPI,
      required this.idMaquinas,
      required this.idInsumos,
      required this.idColaboradores,
      this.telemetria,
      this.paradas});
  factory TableAtividadeData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TableAtividadeData(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      atividade: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}atividade'])!,
      data: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}data'])!,
      idFazenda: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_fazenda'])!,
      cultura: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cultura'])!,
      area: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}area'])!,
      subArea: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sub_area'])!,
      safra: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}safra'])!,
      areaEmHectares: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}area_em_hectares'])!,
      perimetro: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}perimetro'])!,
      status: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status'])!,
      isSincronizadoAPI: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}is_sincronizado_a_p_i'])!,
      idMaquinas: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_maquinas'])!,
      idInsumos: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_insumos'])!,
      idColaboradores: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_colaboradores'])!,
      telemetria: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}telemetria']),
      paradas: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}paradas']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['atividade'] = Variable<String>(atividade);
    map['data'] = Variable<DateTime>(data);
    map['id_fazenda'] = Variable<String>(idFazenda);
    map['cultura'] = Variable<String>(cultura);
    map['area'] = Variable<String>(area);
    map['sub_area'] = Variable<String>(subArea);
    map['safra'] = Variable<String>(safra);
    map['area_em_hectares'] = Variable<double>(areaEmHectares);
    map['perimetro'] = Variable<String>(perimetro);
    map['status'] = Variable<int>(status);
    map['is_sincronizado_a_p_i'] = Variable<bool>(isSincronizadoAPI);
    map['id_maquinas'] = Variable<String>(idMaquinas);
    map['id_insumos'] = Variable<String>(idInsumos);
    map['id_colaboradores'] = Variable<String>(idColaboradores);
    if (!nullToAbsent || telemetria != null) {
      map['telemetria'] = Variable<String?>(telemetria);
    }
    if (!nullToAbsent || paradas != null) {
      map['paradas'] = Variable<String?>(paradas);
    }
    return map;
  }

  TableAtividadeCompanion toCompanion(bool nullToAbsent) {
    return TableAtividadeCompanion(
      id: Value(id),
      atividade: Value(atividade),
      data: Value(data),
      idFazenda: Value(idFazenda),
      cultura: Value(cultura),
      area: Value(area),
      subArea: Value(subArea),
      safra: Value(safra),
      areaEmHectares: Value(areaEmHectares),
      perimetro: Value(perimetro),
      status: Value(status),
      isSincronizadoAPI: Value(isSincronizadoAPI),
      idMaquinas: Value(idMaquinas),
      idInsumos: Value(idInsumos),
      idColaboradores: Value(idColaboradores),
      telemetria: telemetria == null && nullToAbsent
          ? const Value.absent()
          : Value(telemetria),
      paradas: paradas == null && nullToAbsent
          ? const Value.absent()
          : Value(paradas),
    );
  }

  factory TableAtividadeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TableAtividadeData(
      id: serializer.fromJson<String>(json['id']),
      atividade: serializer.fromJson<String>(json['atividade']),
      data: serializer.fromJson<DateTime>(json['data']),
      idFazenda: serializer.fromJson<String>(json['idFazenda']),
      cultura: serializer.fromJson<String>(json['cultura']),
      area: serializer.fromJson<String>(json['area']),
      subArea: serializer.fromJson<String>(json['subArea']),
      safra: serializer.fromJson<String>(json['safra']),
      areaEmHectares: serializer.fromJson<double>(json['areaEmHectares']),
      perimetro: serializer.fromJson<String>(json['perimetro']),
      status: serializer.fromJson<int>(json['status']),
      isSincronizadoAPI: serializer.fromJson<bool>(json['isSincronizadoAPI']),
      idMaquinas: serializer.fromJson<String>(json['idMaquinas']),
      idInsumos: serializer.fromJson<String>(json['idInsumos']),
      idColaboradores: serializer.fromJson<String>(json['idColaboradores']),
      telemetria: serializer.fromJson<String?>(json['telemetria']),
      paradas: serializer.fromJson<String?>(json['paradas']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'atividade': serializer.toJson<String>(atividade),
      'data': serializer.toJson<DateTime>(data),
      'idFazenda': serializer.toJson<String>(idFazenda),
      'cultura': serializer.toJson<String>(cultura),
      'area': serializer.toJson<String>(area),
      'subArea': serializer.toJson<String>(subArea),
      'safra': serializer.toJson<String>(safra),
      'areaEmHectares': serializer.toJson<double>(areaEmHectares),
      'perimetro': serializer.toJson<String>(perimetro),
      'status': serializer.toJson<int>(status),
      'isSincronizadoAPI': serializer.toJson<bool>(isSincronizadoAPI),
      'idMaquinas': serializer.toJson<String>(idMaquinas),
      'idInsumos': serializer.toJson<String>(idInsumos),
      'idColaboradores': serializer.toJson<String>(idColaboradores),
      'telemetria': serializer.toJson<String?>(telemetria),
      'paradas': serializer.toJson<String?>(paradas),
    };
  }

  TableAtividadeData copyWith(
          {String? id,
          String? atividade,
          DateTime? data,
          String? idFazenda,
          String? cultura,
          String? area,
          String? subArea,
          String? safra,
          double? areaEmHectares,
          String? perimetro,
          int? status,
          bool? isSincronizadoAPI,
          String? idMaquinas,
          String? idInsumos,
          String? idColaboradores,
          String? telemetria,
          String? paradas}) =>
      TableAtividadeData(
        id: id ?? this.id,
        atividade: atividade ?? this.atividade,
        data: data ?? this.data,
        idFazenda: idFazenda ?? this.idFazenda,
        cultura: cultura ?? this.cultura,
        area: area ?? this.area,
        subArea: subArea ?? this.subArea,
        safra: safra ?? this.safra,
        areaEmHectares: areaEmHectares ?? this.areaEmHectares,
        perimetro: perimetro ?? this.perimetro,
        status: status ?? this.status,
        isSincronizadoAPI: isSincronizadoAPI ?? this.isSincronizadoAPI,
        idMaquinas: idMaquinas ?? this.idMaquinas,
        idInsumos: idInsumos ?? this.idInsumos,
        idColaboradores: idColaboradores ?? this.idColaboradores,
        telemetria: telemetria ?? this.telemetria,
        paradas: paradas ?? this.paradas,
      );
  @override
  String toString() {
    return (StringBuffer('TableAtividadeData(')
          ..write('id: $id, ')
          ..write('atividade: $atividade, ')
          ..write('data: $data, ')
          ..write('idFazenda: $idFazenda, ')
          ..write('cultura: $cultura, ')
          ..write('area: $area, ')
          ..write('subArea: $subArea, ')
          ..write('safra: $safra, ')
          ..write('areaEmHectares: $areaEmHectares, ')
          ..write('perimetro: $perimetro, ')
          ..write('status: $status, ')
          ..write('isSincronizadoAPI: $isSincronizadoAPI, ')
          ..write('idMaquinas: $idMaquinas, ')
          ..write('idInsumos: $idInsumos, ')
          ..write('idColaboradores: $idColaboradores, ')
          ..write('telemetria: $telemetria, ')
          ..write('paradas: $paradas')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          atividade.hashCode,
          $mrjc(
              data.hashCode,
              $mrjc(
                  idFazenda.hashCode,
                  $mrjc(
                      cultura.hashCode,
                      $mrjc(
                          area.hashCode,
                          $mrjc(
                              subArea.hashCode,
                              $mrjc(
                                  safra.hashCode,
                                  $mrjc(
                                      areaEmHectares.hashCode,
                                      $mrjc(
                                          perimetro.hashCode,
                                          $mrjc(
                                              status.hashCode,
                                              $mrjc(
                                                  isSincronizadoAPI.hashCode,
                                                  $mrjc(
                                                      idMaquinas.hashCode,
                                                      $mrjc(
                                                          idInsumos.hashCode,
                                                          $mrjc(
                                                              idColaboradores
                                                                  .hashCode,
                                                              $mrjc(
                                                                  telemetria
                                                                      .hashCode,
                                                                  paradas
                                                                      .hashCode)))))))))))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TableAtividadeData &&
          other.id == this.id &&
          other.atividade == this.atividade &&
          other.data == this.data &&
          other.idFazenda == this.idFazenda &&
          other.cultura == this.cultura &&
          other.area == this.area &&
          other.subArea == this.subArea &&
          other.safra == this.safra &&
          other.areaEmHectares == this.areaEmHectares &&
          other.perimetro == this.perimetro &&
          other.status == this.status &&
          other.isSincronizadoAPI == this.isSincronizadoAPI &&
          other.idMaquinas == this.idMaquinas &&
          other.idInsumos == this.idInsumos &&
          other.idColaboradores == this.idColaboradores &&
          other.telemetria == this.telemetria &&
          other.paradas == this.paradas);
}

class TableAtividadeCompanion extends UpdateCompanion<TableAtividadeData> {
  final Value<String> id;
  final Value<String> atividade;
  final Value<DateTime> data;
  final Value<String> idFazenda;
  final Value<String> cultura;
  final Value<String> area;
  final Value<String> subArea;
  final Value<String> safra;
  final Value<double> areaEmHectares;
  final Value<String> perimetro;
  final Value<int> status;
  final Value<bool> isSincronizadoAPI;
  final Value<String> idMaquinas;
  final Value<String> idInsumos;
  final Value<String> idColaboradores;
  final Value<String?> telemetria;
  final Value<String?> paradas;
  const TableAtividadeCompanion({
    this.id = const Value.absent(),
    this.atividade = const Value.absent(),
    this.data = const Value.absent(),
    this.idFazenda = const Value.absent(),
    this.cultura = const Value.absent(),
    this.area = const Value.absent(),
    this.subArea = const Value.absent(),
    this.safra = const Value.absent(),
    this.areaEmHectares = const Value.absent(),
    this.perimetro = const Value.absent(),
    this.status = const Value.absent(),
    this.isSincronizadoAPI = const Value.absent(),
    this.idMaquinas = const Value.absent(),
    this.idInsumos = const Value.absent(),
    this.idColaboradores = const Value.absent(),
    this.telemetria = const Value.absent(),
    this.paradas = const Value.absent(),
  });
  TableAtividadeCompanion.insert({
    required String id,
    required String atividade,
    required DateTime data,
    required String idFazenda,
    required String cultura,
    required String area,
    required String subArea,
    required String safra,
    required double areaEmHectares,
    required String perimetro,
    required int status,
    required bool isSincronizadoAPI,
    required String idMaquinas,
    required String idInsumos,
    required String idColaboradores,
    this.telemetria = const Value.absent(),
    this.paradas = const Value.absent(),
  })  : id = Value(id),
        atividade = Value(atividade),
        data = Value(data),
        idFazenda = Value(idFazenda),
        cultura = Value(cultura),
        area = Value(area),
        subArea = Value(subArea),
        safra = Value(safra),
        areaEmHectares = Value(areaEmHectares),
        perimetro = Value(perimetro),
        status = Value(status),
        isSincronizadoAPI = Value(isSincronizadoAPI),
        idMaquinas = Value(idMaquinas),
        idInsumos = Value(idInsumos),
        idColaboradores = Value(idColaboradores);
  static Insertable<TableAtividadeData> custom({
    Expression<String>? id,
    Expression<String>? atividade,
    Expression<DateTime>? data,
    Expression<String>? idFazenda,
    Expression<String>? cultura,
    Expression<String>? area,
    Expression<String>? subArea,
    Expression<String>? safra,
    Expression<double>? areaEmHectares,
    Expression<String>? perimetro,
    Expression<int>? status,
    Expression<bool>? isSincronizadoAPI,
    Expression<String>? idMaquinas,
    Expression<String>? idInsumos,
    Expression<String>? idColaboradores,
    Expression<String?>? telemetria,
    Expression<String?>? paradas,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (atividade != null) 'atividade': atividade,
      if (data != null) 'data': data,
      if (idFazenda != null) 'id_fazenda': idFazenda,
      if (cultura != null) 'cultura': cultura,
      if (area != null) 'area': area,
      if (subArea != null) 'sub_area': subArea,
      if (safra != null) 'safra': safra,
      if (areaEmHectares != null) 'area_em_hectares': areaEmHectares,
      if (perimetro != null) 'perimetro': perimetro,
      if (status != null) 'status': status,
      if (isSincronizadoAPI != null) 'is_sincronizado_a_p_i': isSincronizadoAPI,
      if (idMaquinas != null) 'id_maquinas': idMaquinas,
      if (idInsumos != null) 'id_insumos': idInsumos,
      if (idColaboradores != null) 'id_colaboradores': idColaboradores,
      if (telemetria != null) 'telemetria': telemetria,
      if (paradas != null) 'paradas': paradas,
    });
  }

  TableAtividadeCompanion copyWith(
      {Value<String>? id,
      Value<String>? atividade,
      Value<DateTime>? data,
      Value<String>? idFazenda,
      Value<String>? cultura,
      Value<String>? area,
      Value<String>? subArea,
      Value<String>? safra,
      Value<double>? areaEmHectares,
      Value<String>? perimetro,
      Value<int>? status,
      Value<bool>? isSincronizadoAPI,
      Value<String>? idMaquinas,
      Value<String>? idInsumos,
      Value<String>? idColaboradores,
      Value<String?>? telemetria,
      Value<String?>? paradas}) {
    return TableAtividadeCompanion(
      id: id ?? this.id,
      atividade: atividade ?? this.atividade,
      data: data ?? this.data,
      idFazenda: idFazenda ?? this.idFazenda,
      cultura: cultura ?? this.cultura,
      area: area ?? this.area,
      subArea: subArea ?? this.subArea,
      safra: safra ?? this.safra,
      areaEmHectares: areaEmHectares ?? this.areaEmHectares,
      perimetro: perimetro ?? this.perimetro,
      status: status ?? this.status,
      isSincronizadoAPI: isSincronizadoAPI ?? this.isSincronizadoAPI,
      idMaquinas: idMaquinas ?? this.idMaquinas,
      idInsumos: idInsumos ?? this.idInsumos,
      idColaboradores: idColaboradores ?? this.idColaboradores,
      telemetria: telemetria ?? this.telemetria,
      paradas: paradas ?? this.paradas,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (atividade.present) {
      map['atividade'] = Variable<String>(atividade.value);
    }
    if (data.present) {
      map['data'] = Variable<DateTime>(data.value);
    }
    if (idFazenda.present) {
      map['id_fazenda'] = Variable<String>(idFazenda.value);
    }
    if (cultura.present) {
      map['cultura'] = Variable<String>(cultura.value);
    }
    if (area.present) {
      map['area'] = Variable<String>(area.value);
    }
    if (subArea.present) {
      map['sub_area'] = Variable<String>(subArea.value);
    }
    if (safra.present) {
      map['safra'] = Variable<String>(safra.value);
    }
    if (areaEmHectares.present) {
      map['area_em_hectares'] = Variable<double>(areaEmHectares.value);
    }
    if (perimetro.present) {
      map['perimetro'] = Variable<String>(perimetro.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (isSincronizadoAPI.present) {
      map['is_sincronizado_a_p_i'] = Variable<bool>(isSincronizadoAPI.value);
    }
    if (idMaquinas.present) {
      map['id_maquinas'] = Variable<String>(idMaquinas.value);
    }
    if (idInsumos.present) {
      map['id_insumos'] = Variable<String>(idInsumos.value);
    }
    if (idColaboradores.present) {
      map['id_colaboradores'] = Variable<String>(idColaboradores.value);
    }
    if (telemetria.present) {
      map['telemetria'] = Variable<String?>(telemetria.value);
    }
    if (paradas.present) {
      map['paradas'] = Variable<String?>(paradas.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TableAtividadeCompanion(')
          ..write('id: $id, ')
          ..write('atividade: $atividade, ')
          ..write('data: $data, ')
          ..write('idFazenda: $idFazenda, ')
          ..write('cultura: $cultura, ')
          ..write('area: $area, ')
          ..write('subArea: $subArea, ')
          ..write('safra: $safra, ')
          ..write('areaEmHectares: $areaEmHectares, ')
          ..write('perimetro: $perimetro, ')
          ..write('status: $status, ')
          ..write('isSincronizadoAPI: $isSincronizadoAPI, ')
          ..write('idMaquinas: $idMaquinas, ')
          ..write('idInsumos: $idInsumos, ')
          ..write('idColaboradores: $idColaboradores, ')
          ..write('telemetria: $telemetria, ')
          ..write('paradas: $paradas')
          ..write(')'))
        .toString();
  }
}

class $TableAtividadeTable extends TableAtividade
    with TableInfo<$TableAtividadeTable, TableAtividadeData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TableAtividadeTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _atividadeMeta = const VerificationMeta('atividade');
  late final GeneratedColumn<String?> atividade = GeneratedColumn<String?>(
      'atividade', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _dataMeta = const VerificationMeta('data');
  late final GeneratedColumn<DateTime?> data = GeneratedColumn<DateTime?>(
      'data', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _idFazendaMeta = const VerificationMeta('idFazenda');
  late final GeneratedColumn<String?> idFazenda = GeneratedColumn<String?>(
      'id_fazenda', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _culturaMeta = const VerificationMeta('cultura');
  late final GeneratedColumn<String?> cultura = GeneratedColumn<String?>(
      'cultura', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _areaMeta = const VerificationMeta('area');
  late final GeneratedColumn<String?> area = GeneratedColumn<String?>(
      'area', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _subAreaMeta = const VerificationMeta('subArea');
  late final GeneratedColumn<String?> subArea = GeneratedColumn<String?>(
      'sub_area', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _safraMeta = const VerificationMeta('safra');
  late final GeneratedColumn<String?> safra = GeneratedColumn<String?>(
      'safra', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _areaEmHectaresMeta =
      const VerificationMeta('areaEmHectares');
  late final GeneratedColumn<double?> areaEmHectares = GeneratedColumn<double?>(
      'area_em_hectares', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _perimetroMeta = const VerificationMeta('perimetro');
  late final GeneratedColumn<String?> perimetro = GeneratedColumn<String?>(
      'perimetro', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  late final GeneratedColumn<int?> status = GeneratedColumn<int?>(
      'status', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _isSincronizadoAPIMeta =
      const VerificationMeta('isSincronizadoAPI');
  late final GeneratedColumn<bool?> isSincronizadoAPI = GeneratedColumn<bool?>(
      'is_sincronizado_a_p_i', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_sincronizado_a_p_i IN (0, 1))');
  final VerificationMeta _idMaquinasMeta = const VerificationMeta('idMaquinas');
  late final GeneratedColumn<String?> idMaquinas = GeneratedColumn<String?>(
      'id_maquinas', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _idInsumosMeta = const VerificationMeta('idInsumos');
  late final GeneratedColumn<String?> idInsumos = GeneratedColumn<String?>(
      'id_insumos', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _idColaboradoresMeta =
      const VerificationMeta('idColaboradores');
  late final GeneratedColumn<String?> idColaboradores =
      GeneratedColumn<String?>('id_colaboradores', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _telemetriaMeta = const VerificationMeta('telemetria');
  late final GeneratedColumn<String?> telemetria = GeneratedColumn<String?>(
      'telemetria', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _paradasMeta = const VerificationMeta('paradas');
  late final GeneratedColumn<String?> paradas = GeneratedColumn<String?>(
      'paradas', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        atividade,
        data,
        idFazenda,
        cultura,
        area,
        subArea,
        safra,
        areaEmHectares,
        perimetro,
        status,
        isSincronizadoAPI,
        idMaquinas,
        idInsumos,
        idColaboradores,
        telemetria,
        paradas
      ];
  @override
  String get aliasedName => _alias ?? 'table_atividade';
  @override
  String get actualTableName => 'table_atividade';
  @override
  VerificationContext validateIntegrity(Insertable<TableAtividadeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('atividade')) {
      context.handle(_atividadeMeta,
          atividade.isAcceptableOrUnknown(data['atividade']!, _atividadeMeta));
    } else if (isInserting) {
      context.missing(_atividadeMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('id_fazenda')) {
      context.handle(_idFazendaMeta,
          idFazenda.isAcceptableOrUnknown(data['id_fazenda']!, _idFazendaMeta));
    } else if (isInserting) {
      context.missing(_idFazendaMeta);
    }
    if (data.containsKey('cultura')) {
      context.handle(_culturaMeta,
          cultura.isAcceptableOrUnknown(data['cultura']!, _culturaMeta));
    } else if (isInserting) {
      context.missing(_culturaMeta);
    }
    if (data.containsKey('area')) {
      context.handle(
          _areaMeta, area.isAcceptableOrUnknown(data['area']!, _areaMeta));
    } else if (isInserting) {
      context.missing(_areaMeta);
    }
    if (data.containsKey('sub_area')) {
      context.handle(_subAreaMeta,
          subArea.isAcceptableOrUnknown(data['sub_area']!, _subAreaMeta));
    } else if (isInserting) {
      context.missing(_subAreaMeta);
    }
    if (data.containsKey('safra')) {
      context.handle(
          _safraMeta, safra.isAcceptableOrUnknown(data['safra']!, _safraMeta));
    } else if (isInserting) {
      context.missing(_safraMeta);
    }
    if (data.containsKey('area_em_hectares')) {
      context.handle(
          _areaEmHectaresMeta,
          areaEmHectares.isAcceptableOrUnknown(
              data['area_em_hectares']!, _areaEmHectaresMeta));
    } else if (isInserting) {
      context.missing(_areaEmHectaresMeta);
    }
    if (data.containsKey('perimetro')) {
      context.handle(_perimetroMeta,
          perimetro.isAcceptableOrUnknown(data['perimetro']!, _perimetroMeta));
    } else if (isInserting) {
      context.missing(_perimetroMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('is_sincronizado_a_p_i')) {
      context.handle(
          _isSincronizadoAPIMeta,
          isSincronizadoAPI.isAcceptableOrUnknown(
              data['is_sincronizado_a_p_i']!, _isSincronizadoAPIMeta));
    } else if (isInserting) {
      context.missing(_isSincronizadoAPIMeta);
    }
    if (data.containsKey('id_maquinas')) {
      context.handle(
          _idMaquinasMeta,
          idMaquinas.isAcceptableOrUnknown(
              data['id_maquinas']!, _idMaquinasMeta));
    } else if (isInserting) {
      context.missing(_idMaquinasMeta);
    }
    if (data.containsKey('id_insumos')) {
      context.handle(_idInsumosMeta,
          idInsumos.isAcceptableOrUnknown(data['id_insumos']!, _idInsumosMeta));
    } else if (isInserting) {
      context.missing(_idInsumosMeta);
    }
    if (data.containsKey('id_colaboradores')) {
      context.handle(
          _idColaboradoresMeta,
          idColaboradores.isAcceptableOrUnknown(
              data['id_colaboradores']!, _idColaboradoresMeta));
    } else if (isInserting) {
      context.missing(_idColaboradoresMeta);
    }
    if (data.containsKey('telemetria')) {
      context.handle(
          _telemetriaMeta,
          telemetria.isAcceptableOrUnknown(
              data['telemetria']!, _telemetriaMeta));
    }
    if (data.containsKey('paradas')) {
      context.handle(_paradasMeta,
          paradas.isAcceptableOrUnknown(data['paradas']!, _paradasMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TableAtividadeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TableAtividadeData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TableAtividadeTable createAlias(String alias) {
    return $TableAtividadeTable(_db, alias);
  }
}

class TableMaquinaData extends DataClass
    implements Insertable<TableMaquinaData> {
  final String id;
  final String descricao;
  TableMaquinaData({required this.id, required this.descricao});
  factory TableMaquinaData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TableMaquinaData(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      descricao: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}descricao'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['descricao'] = Variable<String>(descricao);
    return map;
  }

  TableMaquinaCompanion toCompanion(bool nullToAbsent) {
    return TableMaquinaCompanion(
      id: Value(id),
      descricao: Value(descricao),
    );
  }

  factory TableMaquinaData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TableMaquinaData(
      id: serializer.fromJson<String>(json['id']),
      descricao: serializer.fromJson<String>(json['descricao']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'descricao': serializer.toJson<String>(descricao),
    };
  }

  TableMaquinaData copyWith({String? id, String? descricao}) =>
      TableMaquinaData(
        id: id ?? this.id,
        descricao: descricao ?? this.descricao,
      );
  @override
  String toString() {
    return (StringBuffer('TableMaquinaData(')
          ..write('id: $id, ')
          ..write('descricao: $descricao')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, descricao.hashCode));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TableMaquinaData &&
          other.id == this.id &&
          other.descricao == this.descricao);
}

class TableMaquinaCompanion extends UpdateCompanion<TableMaquinaData> {
  final Value<String> id;
  final Value<String> descricao;
  const TableMaquinaCompanion({
    this.id = const Value.absent(),
    this.descricao = const Value.absent(),
  });
  TableMaquinaCompanion.insert({
    required String id,
    required String descricao,
  })  : id = Value(id),
        descricao = Value(descricao);
  static Insertable<TableMaquinaData> custom({
    Expression<String>? id,
    Expression<String>? descricao,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (descricao != null) 'descricao': descricao,
    });
  }

  TableMaquinaCompanion copyWith(
      {Value<String>? id, Value<String>? descricao}) {
    return TableMaquinaCompanion(
      id: id ?? this.id,
      descricao: descricao ?? this.descricao,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (descricao.present) {
      map['descricao'] = Variable<String>(descricao.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TableMaquinaCompanion(')
          ..write('id: $id, ')
          ..write('descricao: $descricao')
          ..write(')'))
        .toString();
  }
}

class $TableMaquinaTable extends TableMaquina
    with TableInfo<$TableMaquinaTable, TableMaquinaData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TableMaquinaTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _descricaoMeta = const VerificationMeta('descricao');
  late final GeneratedColumn<String?> descricao = GeneratedColumn<String?>(
      'descricao', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, descricao];
  @override
  String get aliasedName => _alias ?? 'table_maquina';
  @override
  String get actualTableName => 'table_maquina';
  @override
  VerificationContext validateIntegrity(Insertable<TableMaquinaData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('descricao')) {
      context.handle(_descricaoMeta,
          descricao.isAcceptableOrUnknown(data['descricao']!, _descricaoMeta));
    } else if (isInserting) {
      context.missing(_descricaoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TableMaquinaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TableMaquinaData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TableMaquinaTable createAlias(String alias) {
    return $TableMaquinaTable(_db, alias);
  }
}

class TableInsumoData extends DataClass implements Insertable<TableInsumoData> {
  final String id;
  final String descricao;
  final double quantidade;
  final String unidade;
  TableInsumoData(
      {required this.id,
      required this.descricao,
      required this.quantidade,
      required this.unidade});
  factory TableInsumoData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TableInsumoData(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      descricao: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}descricao'])!,
      quantidade: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}quantidade'])!,
      unidade: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}unidade'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['descricao'] = Variable<String>(descricao);
    map['quantidade'] = Variable<double>(quantidade);
    map['unidade'] = Variable<String>(unidade);
    return map;
  }

  TableInsumoCompanion toCompanion(bool nullToAbsent) {
    return TableInsumoCompanion(
      id: Value(id),
      descricao: Value(descricao),
      quantidade: Value(quantidade),
      unidade: Value(unidade),
    );
  }

  factory TableInsumoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TableInsumoData(
      id: serializer.fromJson<String>(json['id']),
      descricao: serializer.fromJson<String>(json['descricao']),
      quantidade: serializer.fromJson<double>(json['quantidade']),
      unidade: serializer.fromJson<String>(json['unidade']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'descricao': serializer.toJson<String>(descricao),
      'quantidade': serializer.toJson<double>(quantidade),
      'unidade': serializer.toJson<String>(unidade),
    };
  }

  TableInsumoData copyWith(
          {String? id,
          String? descricao,
          double? quantidade,
          String? unidade}) =>
      TableInsumoData(
        id: id ?? this.id,
        descricao: descricao ?? this.descricao,
        quantidade: quantidade ?? this.quantidade,
        unidade: unidade ?? this.unidade,
      );
  @override
  String toString() {
    return (StringBuffer('TableInsumoData(')
          ..write('id: $id, ')
          ..write('descricao: $descricao, ')
          ..write('quantidade: $quantidade, ')
          ..write('unidade: $unidade')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(descricao.hashCode, $mrjc(quantidade.hashCode, unidade.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TableInsumoData &&
          other.id == this.id &&
          other.descricao == this.descricao &&
          other.quantidade == this.quantidade &&
          other.unidade == this.unidade);
}

class TableInsumoCompanion extends UpdateCompanion<TableInsumoData> {
  final Value<String> id;
  final Value<String> descricao;
  final Value<double> quantidade;
  final Value<String> unidade;
  const TableInsumoCompanion({
    this.id = const Value.absent(),
    this.descricao = const Value.absent(),
    this.quantidade = const Value.absent(),
    this.unidade = const Value.absent(),
  });
  TableInsumoCompanion.insert({
    required String id,
    required String descricao,
    required double quantidade,
    required String unidade,
  })  : id = Value(id),
        descricao = Value(descricao),
        quantidade = Value(quantidade),
        unidade = Value(unidade);
  static Insertable<TableInsumoData> custom({
    Expression<String>? id,
    Expression<String>? descricao,
    Expression<double>? quantidade,
    Expression<String>? unidade,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (descricao != null) 'descricao': descricao,
      if (quantidade != null) 'quantidade': quantidade,
      if (unidade != null) 'unidade': unidade,
    });
  }

  TableInsumoCompanion copyWith(
      {Value<String>? id,
      Value<String>? descricao,
      Value<double>? quantidade,
      Value<String>? unidade}) {
    return TableInsumoCompanion(
      id: id ?? this.id,
      descricao: descricao ?? this.descricao,
      quantidade: quantidade ?? this.quantidade,
      unidade: unidade ?? this.unidade,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (descricao.present) {
      map['descricao'] = Variable<String>(descricao.value);
    }
    if (quantidade.present) {
      map['quantidade'] = Variable<double>(quantidade.value);
    }
    if (unidade.present) {
      map['unidade'] = Variable<String>(unidade.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TableInsumoCompanion(')
          ..write('id: $id, ')
          ..write('descricao: $descricao, ')
          ..write('quantidade: $quantidade, ')
          ..write('unidade: $unidade')
          ..write(')'))
        .toString();
  }
}

class $TableInsumoTable extends TableInsumo
    with TableInfo<$TableInsumoTable, TableInsumoData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TableInsumoTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _descricaoMeta = const VerificationMeta('descricao');
  late final GeneratedColumn<String?> descricao = GeneratedColumn<String?>(
      'descricao', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _quantidadeMeta = const VerificationMeta('quantidade');
  late final GeneratedColumn<double?> quantidade = GeneratedColumn<double?>(
      'quantidade', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _unidadeMeta = const VerificationMeta('unidade');
  late final GeneratedColumn<String?> unidade = GeneratedColumn<String?>(
      'unidade', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, descricao, quantidade, unidade];
  @override
  String get aliasedName => _alias ?? 'table_insumo';
  @override
  String get actualTableName => 'table_insumo';
  @override
  VerificationContext validateIntegrity(Insertable<TableInsumoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('descricao')) {
      context.handle(_descricaoMeta,
          descricao.isAcceptableOrUnknown(data['descricao']!, _descricaoMeta));
    } else if (isInserting) {
      context.missing(_descricaoMeta);
    }
    if (data.containsKey('quantidade')) {
      context.handle(
          _quantidadeMeta,
          quantidade.isAcceptableOrUnknown(
              data['quantidade']!, _quantidadeMeta));
    } else if (isInserting) {
      context.missing(_quantidadeMeta);
    }
    if (data.containsKey('unidade')) {
      context.handle(_unidadeMeta,
          unidade.isAcceptableOrUnknown(data['unidade']!, _unidadeMeta));
    } else if (isInserting) {
      context.missing(_unidadeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TableInsumoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TableInsumoData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TableInsumoTable createAlias(String alias) {
    return $TableInsumoTable(_db, alias);
  }
}

class TableColaboradorData extends DataClass
    implements Insertable<TableColaboradorData> {
  final String id;
  final String nome;
  TableColaboradorData({required this.id, required this.nome});
  factory TableColaboradorData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TableColaboradorData(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      nome: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nome'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['nome'] = Variable<String>(nome);
    return map;
  }

  TableColaboradorCompanion toCompanion(bool nullToAbsent) {
    return TableColaboradorCompanion(
      id: Value(id),
      nome: Value(nome),
    );
  }

  factory TableColaboradorData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TableColaboradorData(
      id: serializer.fromJson<String>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'nome': serializer.toJson<String>(nome),
    };
  }

  TableColaboradorData copyWith({String? id, String? nome}) =>
      TableColaboradorData(
        id: id ?? this.id,
        nome: nome ?? this.nome,
      );
  @override
  String toString() {
    return (StringBuffer('TableColaboradorData(')
          ..write('id: $id, ')
          ..write('nome: $nome')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, nome.hashCode));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TableColaboradorData &&
          other.id == this.id &&
          other.nome == this.nome);
}

class TableColaboradorCompanion extends UpdateCompanion<TableColaboradorData> {
  final Value<String> id;
  final Value<String> nome;
  const TableColaboradorCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
  });
  TableColaboradorCompanion.insert({
    required String id,
    required String nome,
  })  : id = Value(id),
        nome = Value(nome);
  static Insertable<TableColaboradorData> custom({
    Expression<String>? id,
    Expression<String>? nome,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
    });
  }

  TableColaboradorCompanion copyWith({Value<String>? id, Value<String>? nome}) {
    return TableColaboradorCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TableColaboradorCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome')
          ..write(')'))
        .toString();
  }
}

class $TableColaboradorTable extends TableColaborador
    with TableInfo<$TableColaboradorTable, TableColaboradorData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TableColaboradorTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _nomeMeta = const VerificationMeta('nome');
  late final GeneratedColumn<String?> nome = GeneratedColumn<String?>(
      'nome', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, nome];
  @override
  String get aliasedName => _alias ?? 'table_colaborador';
  @override
  String get actualTableName => 'table_colaborador';
  @override
  VerificationContext validateIntegrity(
      Insertable<TableColaboradorData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TableColaboradorData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TableColaboradorData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TableColaboradorTable createAlias(String alias) {
    return $TableColaboradorTable(_db, alias);
  }
}

class TableAbastecimentoData extends DataClass
    implements Insertable<TableAbastecimentoData> {
  final int id;
  final String oleo;
  final String idMaquina;
  final String nomeMaquina;
  final String idFazenda;
  final String nomeFazenda;
  final String fotoOleo;
  final String odometro;
  final String fotoOdomentro;
  final int status;
  final DateTime createAt;
  final DateTime updateAt;
  TableAbastecimentoData(
      {required this.id,
      required this.oleo,
      required this.idMaquina,
      required this.nomeMaquina,
      required this.idFazenda,
      required this.nomeFazenda,
      required this.fotoOleo,
      required this.odometro,
      required this.fotoOdomentro,
      required this.status,
      required this.createAt,
      required this.updateAt});
  factory TableAbastecimentoData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TableAbastecimentoData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      oleo: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}oleo'])!,
      idMaquina: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_maquina'])!,
      nomeMaquina: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nome_maquina'])!,
      idFazenda: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_fazenda'])!,
      nomeFazenda: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nome_fazenda'])!,
      fotoOleo: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}foto_oleo'])!,
      odometro: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}odometro'])!,
      fotoOdomentro: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}foto_odomentro'])!,
      status: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status'])!,
      createAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}create_at'])!,
      updateAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}update_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['oleo'] = Variable<String>(oleo);
    map['id_maquina'] = Variable<String>(idMaquina);
    map['nome_maquina'] = Variable<String>(nomeMaquina);
    map['id_fazenda'] = Variable<String>(idFazenda);
    map['nome_fazenda'] = Variable<String>(nomeFazenda);
    map['foto_oleo'] = Variable<String>(fotoOleo);
    map['odometro'] = Variable<String>(odometro);
    map['foto_odomentro'] = Variable<String>(fotoOdomentro);
    map['status'] = Variable<int>(status);
    map['create_at'] = Variable<DateTime>(createAt);
    map['update_at'] = Variable<DateTime>(updateAt);
    return map;
  }

  TableAbastecimentoCompanion toCompanion(bool nullToAbsent) {
    return TableAbastecimentoCompanion(
      id: Value(id),
      oleo: Value(oleo),
      idMaquina: Value(idMaquina),
      nomeMaquina: Value(nomeMaquina),
      idFazenda: Value(idFazenda),
      nomeFazenda: Value(nomeFazenda),
      fotoOleo: Value(fotoOleo),
      odometro: Value(odometro),
      fotoOdomentro: Value(fotoOdomentro),
      status: Value(status),
      createAt: Value(createAt),
      updateAt: Value(updateAt),
    );
  }

  factory TableAbastecimentoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TableAbastecimentoData(
      id: serializer.fromJson<int>(json['id']),
      oleo: serializer.fromJson<String>(json['oleo']),
      idMaquina: serializer.fromJson<String>(json['idMaquina']),
      nomeMaquina: serializer.fromJson<String>(json['nomeMaquina']),
      idFazenda: serializer.fromJson<String>(json['idFazenda']),
      nomeFazenda: serializer.fromJson<String>(json['nomeFazenda']),
      fotoOleo: serializer.fromJson<String>(json['fotoOleo']),
      odometro: serializer.fromJson<String>(json['odometro']),
      fotoOdomentro: serializer.fromJson<String>(json['fotoOdomentro']),
      status: serializer.fromJson<int>(json['status']),
      createAt: serializer.fromJson<DateTime>(json['createAt']),
      updateAt: serializer.fromJson<DateTime>(json['updateAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'oleo': serializer.toJson<String>(oleo),
      'idMaquina': serializer.toJson<String>(idMaquina),
      'nomeMaquina': serializer.toJson<String>(nomeMaquina),
      'idFazenda': serializer.toJson<String>(idFazenda),
      'nomeFazenda': serializer.toJson<String>(nomeFazenda),
      'fotoOleo': serializer.toJson<String>(fotoOleo),
      'odometro': serializer.toJson<String>(odometro),
      'fotoOdomentro': serializer.toJson<String>(fotoOdomentro),
      'status': serializer.toJson<int>(status),
      'createAt': serializer.toJson<DateTime>(createAt),
      'updateAt': serializer.toJson<DateTime>(updateAt),
    };
  }

  TableAbastecimentoData copyWith(
          {int? id,
          String? oleo,
          String? idMaquina,
          String? nomeMaquina,
          String? idFazenda,
          String? nomeFazenda,
          String? fotoOleo,
          String? odometro,
          String? fotoOdomentro,
          int? status,
          DateTime? createAt,
          DateTime? updateAt}) =>
      TableAbastecimentoData(
        id: id ?? this.id,
        oleo: oleo ?? this.oleo,
        idMaquina: idMaquina ?? this.idMaquina,
        nomeMaquina: nomeMaquina ?? this.nomeMaquina,
        idFazenda: idFazenda ?? this.idFazenda,
        nomeFazenda: nomeFazenda ?? this.nomeFazenda,
        fotoOleo: fotoOleo ?? this.fotoOleo,
        odometro: odometro ?? this.odometro,
        fotoOdomentro: fotoOdomentro ?? this.fotoOdomentro,
        status: status ?? this.status,
        createAt: createAt ?? this.createAt,
        updateAt: updateAt ?? this.updateAt,
      );
  @override
  String toString() {
    return (StringBuffer('TableAbastecimentoData(')
          ..write('id: $id, ')
          ..write('oleo: $oleo, ')
          ..write('idMaquina: $idMaquina, ')
          ..write('nomeMaquina: $nomeMaquina, ')
          ..write('idFazenda: $idFazenda, ')
          ..write('nomeFazenda: $nomeFazenda, ')
          ..write('fotoOleo: $fotoOleo, ')
          ..write('odometro: $odometro, ')
          ..write('fotoOdomentro: $fotoOdomentro, ')
          ..write('status: $status, ')
          ..write('createAt: $createAt, ')
          ..write('updateAt: $updateAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          oleo.hashCode,
          $mrjc(
              idMaquina.hashCode,
              $mrjc(
                  nomeMaquina.hashCode,
                  $mrjc(
                      idFazenda.hashCode,
                      $mrjc(
                          nomeFazenda.hashCode,
                          $mrjc(
                              fotoOleo.hashCode,
                              $mrjc(
                                  odometro.hashCode,
                                  $mrjc(
                                      fotoOdomentro.hashCode,
                                      $mrjc(
                                          status.hashCode,
                                          $mrjc(createAt.hashCode,
                                              updateAt.hashCode))))))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TableAbastecimentoData &&
          other.id == this.id &&
          other.oleo == this.oleo &&
          other.idMaquina == this.idMaquina &&
          other.nomeMaquina == this.nomeMaquina &&
          other.idFazenda == this.idFazenda &&
          other.nomeFazenda == this.nomeFazenda &&
          other.fotoOleo == this.fotoOleo &&
          other.odometro == this.odometro &&
          other.fotoOdomentro == this.fotoOdomentro &&
          other.status == this.status &&
          other.createAt == this.createAt &&
          other.updateAt == this.updateAt);
}

class TableAbastecimentoCompanion
    extends UpdateCompanion<TableAbastecimentoData> {
  final Value<int> id;
  final Value<String> oleo;
  final Value<String> idMaquina;
  final Value<String> nomeMaquina;
  final Value<String> idFazenda;
  final Value<String> nomeFazenda;
  final Value<String> fotoOleo;
  final Value<String> odometro;
  final Value<String> fotoOdomentro;
  final Value<int> status;
  final Value<DateTime> createAt;
  final Value<DateTime> updateAt;
  const TableAbastecimentoCompanion({
    this.id = const Value.absent(),
    this.oleo = const Value.absent(),
    this.idMaquina = const Value.absent(),
    this.nomeMaquina = const Value.absent(),
    this.idFazenda = const Value.absent(),
    this.nomeFazenda = const Value.absent(),
    this.fotoOleo = const Value.absent(),
    this.odometro = const Value.absent(),
    this.fotoOdomentro = const Value.absent(),
    this.status = const Value.absent(),
    this.createAt = const Value.absent(),
    this.updateAt = const Value.absent(),
  });
  TableAbastecimentoCompanion.insert({
    required int id,
    required String oleo,
    required String idMaquina,
    required String nomeMaquina,
    required String idFazenda,
    required String nomeFazenda,
    required String fotoOleo,
    required String odometro,
    required String fotoOdomentro,
    required int status,
    required DateTime createAt,
    required DateTime updateAt,
  })  : id = Value(id),
        oleo = Value(oleo),
        idMaquina = Value(idMaquina),
        nomeMaquina = Value(nomeMaquina),
        idFazenda = Value(idFazenda),
        nomeFazenda = Value(nomeFazenda),
        fotoOleo = Value(fotoOleo),
        odometro = Value(odometro),
        fotoOdomentro = Value(fotoOdomentro),
        status = Value(status),
        createAt = Value(createAt),
        updateAt = Value(updateAt);
  static Insertable<TableAbastecimentoData> custom({
    Expression<int>? id,
    Expression<String>? oleo,
    Expression<String>? idMaquina,
    Expression<String>? nomeMaquina,
    Expression<String>? idFazenda,
    Expression<String>? nomeFazenda,
    Expression<String>? fotoOleo,
    Expression<String>? odometro,
    Expression<String>? fotoOdomentro,
    Expression<int>? status,
    Expression<DateTime>? createAt,
    Expression<DateTime>? updateAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (oleo != null) 'oleo': oleo,
      if (idMaquina != null) 'id_maquina': idMaquina,
      if (nomeMaquina != null) 'nome_maquina': nomeMaquina,
      if (idFazenda != null) 'id_fazenda': idFazenda,
      if (nomeFazenda != null) 'nome_fazenda': nomeFazenda,
      if (fotoOleo != null) 'foto_oleo': fotoOleo,
      if (odometro != null) 'odometro': odometro,
      if (fotoOdomentro != null) 'foto_odomentro': fotoOdomentro,
      if (status != null) 'status': status,
      if (createAt != null) 'create_at': createAt,
      if (updateAt != null) 'update_at': updateAt,
    });
  }

  TableAbastecimentoCompanion copyWith(
      {Value<int>? id,
      Value<String>? oleo,
      Value<String>? idMaquina,
      Value<String>? nomeMaquina,
      Value<String>? idFazenda,
      Value<String>? nomeFazenda,
      Value<String>? fotoOleo,
      Value<String>? odometro,
      Value<String>? fotoOdomentro,
      Value<int>? status,
      Value<DateTime>? createAt,
      Value<DateTime>? updateAt}) {
    return TableAbastecimentoCompanion(
      id: id ?? this.id,
      oleo: oleo ?? this.oleo,
      idMaquina: idMaquina ?? this.idMaquina,
      nomeMaquina: nomeMaquina ?? this.nomeMaquina,
      idFazenda: idFazenda ?? this.idFazenda,
      nomeFazenda: nomeFazenda ?? this.nomeFazenda,
      fotoOleo: fotoOleo ?? this.fotoOleo,
      odometro: odometro ?? this.odometro,
      fotoOdomentro: fotoOdomentro ?? this.fotoOdomentro,
      status: status ?? this.status,
      createAt: createAt ?? this.createAt,
      updateAt: updateAt ?? this.updateAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (oleo.present) {
      map['oleo'] = Variable<String>(oleo.value);
    }
    if (idMaquina.present) {
      map['id_maquina'] = Variable<String>(idMaquina.value);
    }
    if (nomeMaquina.present) {
      map['nome_maquina'] = Variable<String>(nomeMaquina.value);
    }
    if (idFazenda.present) {
      map['id_fazenda'] = Variable<String>(idFazenda.value);
    }
    if (nomeFazenda.present) {
      map['nome_fazenda'] = Variable<String>(nomeFazenda.value);
    }
    if (fotoOleo.present) {
      map['foto_oleo'] = Variable<String>(fotoOleo.value);
    }
    if (odometro.present) {
      map['odometro'] = Variable<String>(odometro.value);
    }
    if (fotoOdomentro.present) {
      map['foto_odomentro'] = Variable<String>(fotoOdomentro.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (createAt.present) {
      map['create_at'] = Variable<DateTime>(createAt.value);
    }
    if (updateAt.present) {
      map['update_at'] = Variable<DateTime>(updateAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TableAbastecimentoCompanion(')
          ..write('id: $id, ')
          ..write('oleo: $oleo, ')
          ..write('idMaquina: $idMaquina, ')
          ..write('nomeMaquina: $nomeMaquina, ')
          ..write('idFazenda: $idFazenda, ')
          ..write('nomeFazenda: $nomeFazenda, ')
          ..write('fotoOleo: $fotoOleo, ')
          ..write('odometro: $odometro, ')
          ..write('fotoOdomentro: $fotoOdomentro, ')
          ..write('status: $status, ')
          ..write('createAt: $createAt, ')
          ..write('updateAt: $updateAt')
          ..write(')'))
        .toString();
  }
}

class $TableAbastecimentoTable extends TableAbastecimento
    with TableInfo<$TableAbastecimentoTable, TableAbastecimentoData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TableAbastecimentoTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _oleoMeta = const VerificationMeta('oleo');
  late final GeneratedColumn<String?> oleo = GeneratedColumn<String?>(
      'oleo', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _idMaquinaMeta = const VerificationMeta('idMaquina');
  late final GeneratedColumn<String?> idMaquina = GeneratedColumn<String?>(
      'id_maquina', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _nomeMaquinaMeta =
      const VerificationMeta('nomeMaquina');
  late final GeneratedColumn<String?> nomeMaquina = GeneratedColumn<String?>(
      'nome_maquina', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _idFazendaMeta = const VerificationMeta('idFazenda');
  late final GeneratedColumn<String?> idFazenda = GeneratedColumn<String?>(
      'id_fazenda', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _nomeFazendaMeta =
      const VerificationMeta('nomeFazenda');
  late final GeneratedColumn<String?> nomeFazenda = GeneratedColumn<String?>(
      'nome_fazenda', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _fotoOleoMeta = const VerificationMeta('fotoOleo');
  late final GeneratedColumn<String?> fotoOleo = GeneratedColumn<String?>(
      'foto_oleo', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _odometroMeta = const VerificationMeta('odometro');
  late final GeneratedColumn<String?> odometro = GeneratedColumn<String?>(
      'odometro', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _fotoOdomentroMeta =
      const VerificationMeta('fotoOdomentro');
  late final GeneratedColumn<String?> fotoOdomentro = GeneratedColumn<String?>(
      'foto_odomentro', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  late final GeneratedColumn<int?> status = GeneratedColumn<int?>(
      'status', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _createAtMeta = const VerificationMeta('createAt');
  late final GeneratedColumn<DateTime?> createAt = GeneratedColumn<DateTime?>(
      'create_at', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _updateAtMeta = const VerificationMeta('updateAt');
  late final GeneratedColumn<DateTime?> updateAt = GeneratedColumn<DateTime?>(
      'update_at', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        oleo,
        idMaquina,
        nomeMaquina,
        idFazenda,
        nomeFazenda,
        fotoOleo,
        odometro,
        fotoOdomentro,
        status,
        createAt,
        updateAt
      ];
  @override
  String get aliasedName => _alias ?? 'table_abastecimento';
  @override
  String get actualTableName => 'table_abastecimento';
  @override
  VerificationContext validateIntegrity(
      Insertable<TableAbastecimentoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('oleo')) {
      context.handle(
          _oleoMeta, oleo.isAcceptableOrUnknown(data['oleo']!, _oleoMeta));
    } else if (isInserting) {
      context.missing(_oleoMeta);
    }
    if (data.containsKey('id_maquina')) {
      context.handle(_idMaquinaMeta,
          idMaquina.isAcceptableOrUnknown(data['id_maquina']!, _idMaquinaMeta));
    } else if (isInserting) {
      context.missing(_idMaquinaMeta);
    }
    if (data.containsKey('nome_maquina')) {
      context.handle(
          _nomeMaquinaMeta,
          nomeMaquina.isAcceptableOrUnknown(
              data['nome_maquina']!, _nomeMaquinaMeta));
    } else if (isInserting) {
      context.missing(_nomeMaquinaMeta);
    }
    if (data.containsKey('id_fazenda')) {
      context.handle(_idFazendaMeta,
          idFazenda.isAcceptableOrUnknown(data['id_fazenda']!, _idFazendaMeta));
    } else if (isInserting) {
      context.missing(_idFazendaMeta);
    }
    if (data.containsKey('nome_fazenda')) {
      context.handle(
          _nomeFazendaMeta,
          nomeFazenda.isAcceptableOrUnknown(
              data['nome_fazenda']!, _nomeFazendaMeta));
    } else if (isInserting) {
      context.missing(_nomeFazendaMeta);
    }
    if (data.containsKey('foto_oleo')) {
      context.handle(_fotoOleoMeta,
          fotoOleo.isAcceptableOrUnknown(data['foto_oleo']!, _fotoOleoMeta));
    } else if (isInserting) {
      context.missing(_fotoOleoMeta);
    }
    if (data.containsKey('odometro')) {
      context.handle(_odometroMeta,
          odometro.isAcceptableOrUnknown(data['odometro']!, _odometroMeta));
    } else if (isInserting) {
      context.missing(_odometroMeta);
    }
    if (data.containsKey('foto_odomentro')) {
      context.handle(
          _fotoOdomentroMeta,
          fotoOdomentro.isAcceptableOrUnknown(
              data['foto_odomentro']!, _fotoOdomentroMeta));
    } else if (isInserting) {
      context.missing(_fotoOdomentroMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('create_at')) {
      context.handle(_createAtMeta,
          createAt.isAcceptableOrUnknown(data['create_at']!, _createAtMeta));
    } else if (isInserting) {
      context.missing(_createAtMeta);
    }
    if (data.containsKey('update_at')) {
      context.handle(_updateAtMeta,
          updateAt.isAcceptableOrUnknown(data['update_at']!, _updateAtMeta));
    } else if (isInserting) {
      context.missing(_updateAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  TableAbastecimentoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TableAbastecimentoData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TableAbastecimentoTable createAlias(String alias) {
    return $TableAbastecimentoTable(_db, alias);
  }
}

class TablePluviametriaData extends DataClass
    implements Insertable<TablePluviametriaData> {
  final int id;
  final String talhao;
  final DateTime dateColeta;
  final String milimetro;
  final String tempMaxima;
  final String temp;
  final String obs;
  final int status;
  final DateTime createAt;
  final DateTime updateAt;
  TablePluviametriaData(
      {required this.id,
      required this.talhao,
      required this.dateColeta,
      required this.milimetro,
      required this.tempMaxima,
      required this.temp,
      required this.obs,
      required this.status,
      required this.createAt,
      required this.updateAt});
  factory TablePluviametriaData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TablePluviametriaData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      talhao: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}talhao'])!,
      dateColeta: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date_coleta'])!,
      milimetro: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}milimetro'])!,
      tempMaxima: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}temp_maxima'])!,
      temp: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}temp'])!,
      obs: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}obs'])!,
      status: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status'])!,
      createAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}create_at'])!,
      updateAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}update_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['talhao'] = Variable<String>(talhao);
    map['date_coleta'] = Variable<DateTime>(dateColeta);
    map['milimetro'] = Variable<String>(milimetro);
    map['temp_maxima'] = Variable<String>(tempMaxima);
    map['temp'] = Variable<String>(temp);
    map['obs'] = Variable<String>(obs);
    map['status'] = Variable<int>(status);
    map['create_at'] = Variable<DateTime>(createAt);
    map['update_at'] = Variable<DateTime>(updateAt);
    return map;
  }

  TablePluviametriaCompanion toCompanion(bool nullToAbsent) {
    return TablePluviametriaCompanion(
      id: Value(id),
      talhao: Value(talhao),
      dateColeta: Value(dateColeta),
      milimetro: Value(milimetro),
      tempMaxima: Value(tempMaxima),
      temp: Value(temp),
      obs: Value(obs),
      status: Value(status),
      createAt: Value(createAt),
      updateAt: Value(updateAt),
    );
  }

  factory TablePluviametriaData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TablePluviametriaData(
      id: serializer.fromJson<int>(json['id']),
      talhao: serializer.fromJson<String>(json['talhao']),
      dateColeta: serializer.fromJson<DateTime>(json['dateColeta']),
      milimetro: serializer.fromJson<String>(json['milimetro']),
      tempMaxima: serializer.fromJson<String>(json['tempMaxima']),
      temp: serializer.fromJson<String>(json['temp']),
      obs: serializer.fromJson<String>(json['obs']),
      status: serializer.fromJson<int>(json['status']),
      createAt: serializer.fromJson<DateTime>(json['createAt']),
      updateAt: serializer.fromJson<DateTime>(json['updateAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'talhao': serializer.toJson<String>(talhao),
      'dateColeta': serializer.toJson<DateTime>(dateColeta),
      'milimetro': serializer.toJson<String>(milimetro),
      'tempMaxima': serializer.toJson<String>(tempMaxima),
      'temp': serializer.toJson<String>(temp),
      'obs': serializer.toJson<String>(obs),
      'status': serializer.toJson<int>(status),
      'createAt': serializer.toJson<DateTime>(createAt),
      'updateAt': serializer.toJson<DateTime>(updateAt),
    };
  }

  TablePluviametriaData copyWith(
          {int? id,
          String? talhao,
          DateTime? dateColeta,
          String? milimetro,
          String? tempMaxima,
          String? temp,
          String? obs,
          int? status,
          DateTime? createAt,
          DateTime? updateAt}) =>
      TablePluviametriaData(
        id: id ?? this.id,
        talhao: talhao ?? this.talhao,
        dateColeta: dateColeta ?? this.dateColeta,
        milimetro: milimetro ?? this.milimetro,
        tempMaxima: tempMaxima ?? this.tempMaxima,
        temp: temp ?? this.temp,
        obs: obs ?? this.obs,
        status: status ?? this.status,
        createAt: createAt ?? this.createAt,
        updateAt: updateAt ?? this.updateAt,
      );
  @override
  String toString() {
    return (StringBuffer('TablePluviametriaData(')
          ..write('id: $id, ')
          ..write('talhao: $talhao, ')
          ..write('dateColeta: $dateColeta, ')
          ..write('milimetro: $milimetro, ')
          ..write('tempMaxima: $tempMaxima, ')
          ..write('temp: $temp, ')
          ..write('obs: $obs, ')
          ..write('status: $status, ')
          ..write('createAt: $createAt, ')
          ..write('updateAt: $updateAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          talhao.hashCode,
          $mrjc(
              dateColeta.hashCode,
              $mrjc(
                  milimetro.hashCode,
                  $mrjc(
                      tempMaxima.hashCode,
                      $mrjc(
                          temp.hashCode,
                          $mrjc(
                              obs.hashCode,
                              $mrjc(
                                  status.hashCode,
                                  $mrjc(createAt.hashCode,
                                      updateAt.hashCode))))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TablePluviametriaData &&
          other.id == this.id &&
          other.talhao == this.talhao &&
          other.dateColeta == this.dateColeta &&
          other.milimetro == this.milimetro &&
          other.tempMaxima == this.tempMaxima &&
          other.temp == this.temp &&
          other.obs == this.obs &&
          other.status == this.status &&
          other.createAt == this.createAt &&
          other.updateAt == this.updateAt);
}

class TablePluviametriaCompanion
    extends UpdateCompanion<TablePluviametriaData> {
  final Value<int> id;
  final Value<String> talhao;
  final Value<DateTime> dateColeta;
  final Value<String> milimetro;
  final Value<String> tempMaxima;
  final Value<String> temp;
  final Value<String> obs;
  final Value<int> status;
  final Value<DateTime> createAt;
  final Value<DateTime> updateAt;
  const TablePluviametriaCompanion({
    this.id = const Value.absent(),
    this.talhao = const Value.absent(),
    this.dateColeta = const Value.absent(),
    this.milimetro = const Value.absent(),
    this.tempMaxima = const Value.absent(),
    this.temp = const Value.absent(),
    this.obs = const Value.absent(),
    this.status = const Value.absent(),
    this.createAt = const Value.absent(),
    this.updateAt = const Value.absent(),
  });
  TablePluviametriaCompanion.insert({
    required int id,
    required String talhao,
    required DateTime dateColeta,
    required String milimetro,
    required String tempMaxima,
    required String temp,
    required String obs,
    required int status,
    required DateTime createAt,
    required DateTime updateAt,
  })  : id = Value(id),
        talhao = Value(talhao),
        dateColeta = Value(dateColeta),
        milimetro = Value(milimetro),
        tempMaxima = Value(tempMaxima),
        temp = Value(temp),
        obs = Value(obs),
        status = Value(status),
        createAt = Value(createAt),
        updateAt = Value(updateAt);
  static Insertable<TablePluviametriaData> custom({
    Expression<int>? id,
    Expression<String>? talhao,
    Expression<DateTime>? dateColeta,
    Expression<String>? milimetro,
    Expression<String>? tempMaxima,
    Expression<String>? temp,
    Expression<String>? obs,
    Expression<int>? status,
    Expression<DateTime>? createAt,
    Expression<DateTime>? updateAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (talhao != null) 'talhao': talhao,
      if (dateColeta != null) 'date_coleta': dateColeta,
      if (milimetro != null) 'milimetro': milimetro,
      if (tempMaxima != null) 'temp_maxima': tempMaxima,
      if (temp != null) 'temp': temp,
      if (obs != null) 'obs': obs,
      if (status != null) 'status': status,
      if (createAt != null) 'create_at': createAt,
      if (updateAt != null) 'update_at': updateAt,
    });
  }

  TablePluviametriaCompanion copyWith(
      {Value<int>? id,
      Value<String>? talhao,
      Value<DateTime>? dateColeta,
      Value<String>? milimetro,
      Value<String>? tempMaxima,
      Value<String>? temp,
      Value<String>? obs,
      Value<int>? status,
      Value<DateTime>? createAt,
      Value<DateTime>? updateAt}) {
    return TablePluviametriaCompanion(
      id: id ?? this.id,
      talhao: talhao ?? this.talhao,
      dateColeta: dateColeta ?? this.dateColeta,
      milimetro: milimetro ?? this.milimetro,
      tempMaxima: tempMaxima ?? this.tempMaxima,
      temp: temp ?? this.temp,
      obs: obs ?? this.obs,
      status: status ?? this.status,
      createAt: createAt ?? this.createAt,
      updateAt: updateAt ?? this.updateAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (talhao.present) {
      map['talhao'] = Variable<String>(talhao.value);
    }
    if (dateColeta.present) {
      map['date_coleta'] = Variable<DateTime>(dateColeta.value);
    }
    if (milimetro.present) {
      map['milimetro'] = Variable<String>(milimetro.value);
    }
    if (tempMaxima.present) {
      map['temp_maxima'] = Variable<String>(tempMaxima.value);
    }
    if (temp.present) {
      map['temp'] = Variable<String>(temp.value);
    }
    if (obs.present) {
      map['obs'] = Variable<String>(obs.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (createAt.present) {
      map['create_at'] = Variable<DateTime>(createAt.value);
    }
    if (updateAt.present) {
      map['update_at'] = Variable<DateTime>(updateAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TablePluviametriaCompanion(')
          ..write('id: $id, ')
          ..write('talhao: $talhao, ')
          ..write('dateColeta: $dateColeta, ')
          ..write('milimetro: $milimetro, ')
          ..write('tempMaxima: $tempMaxima, ')
          ..write('temp: $temp, ')
          ..write('obs: $obs, ')
          ..write('status: $status, ')
          ..write('createAt: $createAt, ')
          ..write('updateAt: $updateAt')
          ..write(')'))
        .toString();
  }
}

class $TablePluviametriaTable extends TablePluviametria
    with TableInfo<$TablePluviametriaTable, TablePluviametriaData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TablePluviametriaTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _talhaoMeta = const VerificationMeta('talhao');
  late final GeneratedColumn<String?> talhao = GeneratedColumn<String?>(
      'talhao', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _dateColetaMeta = const VerificationMeta('dateColeta');
  late final GeneratedColumn<DateTime?> dateColeta = GeneratedColumn<DateTime?>(
      'date_coleta', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _milimetroMeta = const VerificationMeta('milimetro');
  late final GeneratedColumn<String?> milimetro = GeneratedColumn<String?>(
      'milimetro', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _tempMaximaMeta = const VerificationMeta('tempMaxima');
  late final GeneratedColumn<String?> tempMaxima = GeneratedColumn<String?>(
      'temp_maxima', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _tempMeta = const VerificationMeta('temp');
  late final GeneratedColumn<String?> temp = GeneratedColumn<String?>(
      'temp', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _obsMeta = const VerificationMeta('obs');
  late final GeneratedColumn<String?> obs = GeneratedColumn<String?>(
      'obs', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  late final GeneratedColumn<int?> status = GeneratedColumn<int?>(
      'status', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _createAtMeta = const VerificationMeta('createAt');
  late final GeneratedColumn<DateTime?> createAt = GeneratedColumn<DateTime?>(
      'create_at', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _updateAtMeta = const VerificationMeta('updateAt');
  late final GeneratedColumn<DateTime?> updateAt = GeneratedColumn<DateTime?>(
      'update_at', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        talhao,
        dateColeta,
        milimetro,
        tempMaxima,
        temp,
        obs,
        status,
        createAt,
        updateAt
      ];
  @override
  String get aliasedName => _alias ?? 'table_pluviametria';
  @override
  String get actualTableName => 'table_pluviametria';
  @override
  VerificationContext validateIntegrity(
      Insertable<TablePluviametriaData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('talhao')) {
      context.handle(_talhaoMeta,
          talhao.isAcceptableOrUnknown(data['talhao']!, _talhaoMeta));
    } else if (isInserting) {
      context.missing(_talhaoMeta);
    }
    if (data.containsKey('date_coleta')) {
      context.handle(
          _dateColetaMeta,
          dateColeta.isAcceptableOrUnknown(
              data['date_coleta']!, _dateColetaMeta));
    } else if (isInserting) {
      context.missing(_dateColetaMeta);
    }
    if (data.containsKey('milimetro')) {
      context.handle(_milimetroMeta,
          milimetro.isAcceptableOrUnknown(data['milimetro']!, _milimetroMeta));
    } else if (isInserting) {
      context.missing(_milimetroMeta);
    }
    if (data.containsKey('temp_maxima')) {
      context.handle(
          _tempMaximaMeta,
          tempMaxima.isAcceptableOrUnknown(
              data['temp_maxima']!, _tempMaximaMeta));
    } else if (isInserting) {
      context.missing(_tempMaximaMeta);
    }
    if (data.containsKey('temp')) {
      context.handle(
          _tempMeta, temp.isAcceptableOrUnknown(data['temp']!, _tempMeta));
    } else if (isInserting) {
      context.missing(_tempMeta);
    }
    if (data.containsKey('obs')) {
      context.handle(
          _obsMeta, obs.isAcceptableOrUnknown(data['obs']!, _obsMeta));
    } else if (isInserting) {
      context.missing(_obsMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('create_at')) {
      context.handle(_createAtMeta,
          createAt.isAcceptableOrUnknown(data['create_at']!, _createAtMeta));
    } else if (isInserting) {
      context.missing(_createAtMeta);
    }
    if (data.containsKey('update_at')) {
      context.handle(_updateAtMeta,
          updateAt.isAcceptableOrUnknown(data['update_at']!, _updateAtMeta));
    } else if (isInserting) {
      context.missing(_updateAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  TablePluviametriaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TablePluviametriaData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TablePluviametriaTable createAlias(String alias) {
    return $TablePluviametriaTable(_db, alias);
  }
}

class TableTalhaoData extends DataClass implements Insertable<TableTalhaoData> {
  final int id;
  final String nome;
  final String geometria;
  final String pontosVerificacao;
  final DateTime createAt;
  final DateTime updateAt;
  TableTalhaoData(
      {required this.id,
      required this.nome,
      required this.geometria,
      required this.pontosVerificacao,
      required this.createAt,
      required this.updateAt});
  factory TableTalhaoData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TableTalhaoData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      nome: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nome'])!,
      geometria: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}geometria'])!,
      pontosVerificacao: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}pontos_verificacao'])!,
      createAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}create_at'])!,
      updateAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}update_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nome'] = Variable<String>(nome);
    map['geometria'] = Variable<String>(geometria);
    map['pontos_verificacao'] = Variable<String>(pontosVerificacao);
    map['create_at'] = Variable<DateTime>(createAt);
    map['update_at'] = Variable<DateTime>(updateAt);
    return map;
  }

  TableTalhaoCompanion toCompanion(bool nullToAbsent) {
    return TableTalhaoCompanion(
      id: Value(id),
      nome: Value(nome),
      geometria: Value(geometria),
      pontosVerificacao: Value(pontosVerificacao),
      createAt: Value(createAt),
      updateAt: Value(updateAt),
    );
  }

  factory TableTalhaoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TableTalhaoData(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      geometria: serializer.fromJson<String>(json['geometria']),
      pontosVerificacao: serializer.fromJson<String>(json['pontosVerificacao']),
      createAt: serializer.fromJson<DateTime>(json['createAt']),
      updateAt: serializer.fromJson<DateTime>(json['updateAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
      'geometria': serializer.toJson<String>(geometria),
      'pontosVerificacao': serializer.toJson<String>(pontosVerificacao),
      'createAt': serializer.toJson<DateTime>(createAt),
      'updateAt': serializer.toJson<DateTime>(updateAt),
    };
  }

  TableTalhaoData copyWith(
          {int? id,
          String? nome,
          String? geometria,
          String? pontosVerificacao,
          DateTime? createAt,
          DateTime? updateAt}) =>
      TableTalhaoData(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        geometria: geometria ?? this.geometria,
        pontosVerificacao: pontosVerificacao ?? this.pontosVerificacao,
        createAt: createAt ?? this.createAt,
        updateAt: updateAt ?? this.updateAt,
      );
  @override
  String toString() {
    return (StringBuffer('TableTalhaoData(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('geometria: $geometria, ')
          ..write('pontosVerificacao: $pontosVerificacao, ')
          ..write('createAt: $createAt, ')
          ..write('updateAt: $updateAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          nome.hashCode,
          $mrjc(
              geometria.hashCode,
              $mrjc(pontosVerificacao.hashCode,
                  $mrjc(createAt.hashCode, updateAt.hashCode))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TableTalhaoData &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.geometria == this.geometria &&
          other.pontosVerificacao == this.pontosVerificacao &&
          other.createAt == this.createAt &&
          other.updateAt == this.updateAt);
}

class TableTalhaoCompanion extends UpdateCompanion<TableTalhaoData> {
  final Value<int> id;
  final Value<String> nome;
  final Value<String> geometria;
  final Value<String> pontosVerificacao;
  final Value<DateTime> createAt;
  final Value<DateTime> updateAt;
  const TableTalhaoCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.geometria = const Value.absent(),
    this.pontosVerificacao = const Value.absent(),
    this.createAt = const Value.absent(),
    this.updateAt = const Value.absent(),
  });
  TableTalhaoCompanion.insert({
    this.id = const Value.absent(),
    required String nome,
    required String geometria,
    required String pontosVerificacao,
    required DateTime createAt,
    required DateTime updateAt,
  })  : nome = Value(nome),
        geometria = Value(geometria),
        pontosVerificacao = Value(pontosVerificacao),
        createAt = Value(createAt),
        updateAt = Value(updateAt);
  static Insertable<TableTalhaoData> custom({
    Expression<int>? id,
    Expression<String>? nome,
    Expression<String>? geometria,
    Expression<String>? pontosVerificacao,
    Expression<DateTime>? createAt,
    Expression<DateTime>? updateAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (geometria != null) 'geometria': geometria,
      if (pontosVerificacao != null) 'pontos_verificacao': pontosVerificacao,
      if (createAt != null) 'create_at': createAt,
      if (updateAt != null) 'update_at': updateAt,
    });
  }

  TableTalhaoCompanion copyWith(
      {Value<int>? id,
      Value<String>? nome,
      Value<String>? geometria,
      Value<String>? pontosVerificacao,
      Value<DateTime>? createAt,
      Value<DateTime>? updateAt}) {
    return TableTalhaoCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      geometria: geometria ?? this.geometria,
      pontosVerificacao: pontosVerificacao ?? this.pontosVerificacao,
      createAt: createAt ?? this.createAt,
      updateAt: updateAt ?? this.updateAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (geometria.present) {
      map['geometria'] = Variable<String>(geometria.value);
    }
    if (pontosVerificacao.present) {
      map['pontos_verificacao'] = Variable<String>(pontosVerificacao.value);
    }
    if (createAt.present) {
      map['create_at'] = Variable<DateTime>(createAt.value);
    }
    if (updateAt.present) {
      map['update_at'] = Variable<DateTime>(updateAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TableTalhaoCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('geometria: $geometria, ')
          ..write('pontosVerificacao: $pontosVerificacao, ')
          ..write('createAt: $createAt, ')
          ..write('updateAt: $updateAt')
          ..write(')'))
        .toString();
  }
}

class $TableTalhaoTable extends TableTalhao
    with TableInfo<$TableTalhaoTable, TableTalhaoData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TableTalhaoTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nomeMeta = const VerificationMeta('nome');
  late final GeneratedColumn<String?> nome = GeneratedColumn<String?>(
      'nome', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _geometriaMeta = const VerificationMeta('geometria');
  late final GeneratedColumn<String?> geometria = GeneratedColumn<String?>(
      'geometria', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _pontosVerificacaoMeta =
      const VerificationMeta('pontosVerificacao');
  late final GeneratedColumn<String?> pontosVerificacao =
      GeneratedColumn<String?>('pontos_verificacao', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _createAtMeta = const VerificationMeta('createAt');
  late final GeneratedColumn<DateTime?> createAt = GeneratedColumn<DateTime?>(
      'create_at', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _updateAtMeta = const VerificationMeta('updateAt');
  late final GeneratedColumn<DateTime?> updateAt = GeneratedColumn<DateTime?>(
      'update_at', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, nome, geometria, pontosVerificacao, createAt, updateAt];
  @override
  String get aliasedName => _alias ?? 'table_talhao';
  @override
  String get actualTableName => 'table_talhao';
  @override
  VerificationContext validateIntegrity(Insertable<TableTalhaoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('geometria')) {
      context.handle(_geometriaMeta,
          geometria.isAcceptableOrUnknown(data['geometria']!, _geometriaMeta));
    } else if (isInserting) {
      context.missing(_geometriaMeta);
    }
    if (data.containsKey('pontos_verificacao')) {
      context.handle(
          _pontosVerificacaoMeta,
          pontosVerificacao.isAcceptableOrUnknown(
              data['pontos_verificacao']!, _pontosVerificacaoMeta));
    } else if (isInserting) {
      context.missing(_pontosVerificacaoMeta);
    }
    if (data.containsKey('create_at')) {
      context.handle(_createAtMeta,
          createAt.isAcceptableOrUnknown(data['create_at']!, _createAtMeta));
    } else if (isInserting) {
      context.missing(_createAtMeta);
    }
    if (data.containsKey('update_at')) {
      context.handle(_updateAtMeta,
          updateAt.isAcceptableOrUnknown(data['update_at']!, _updateAtMeta));
    } else if (isInserting) {
      context.missing(_updateAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TableTalhaoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TableTalhaoData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TableTalhaoTable createAlias(String alias) {
    return $TableTalhaoTable(_db, alias);
  }
}

class TablePontoVerificacaoData extends DataClass
    implements Insertable<TablePontoVerificacaoData> {
  final int id;
  final int idTalhao;
  final double latitude;
  final double longitude;
  final DateTime? dataVerificacao;
  final String? foto;
  final bool isPendente;
  final String? observacao;
  final DateTime createAt;
  final DateTime updateAt;
  final String? praga;
  final String? amostragem;
  final String? fase;
  final String? intensidade;
  final String? estrago;
  final String? observacoes;
  TablePontoVerificacaoData(
      {required this.id,
      required this.idTalhao,
      required this.latitude,
      required this.longitude,
      this.dataVerificacao,
      this.foto,
      required this.isPendente,
      this.observacao,
      required this.createAt,
      required this.updateAt,
      this.praga,
      this.amostragem,
      this.fase,
      this.intensidade,
      this.estrago,
      this.observacoes});
  factory TablePontoVerificacaoData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TablePontoVerificacaoData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      idTalhao: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_talhao'])!,
      latitude: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}latitude'])!,
      longitude: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}longitude'])!,
      dataVerificacao: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}data_verificacao']),
      foto: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}foto']),
      isPendente: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_pendente'])!,
      observacao: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}observacao']),
      createAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}create_at'])!,
      updateAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}update_at'])!,
      praga: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}praga']),
      amostragem: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}amostragem']),
      fase: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fase']),
      intensidade: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}intensidade']),
      estrago: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}estrago']),
      observacoes: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}observacoes']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_talhao'] = Variable<int>(idTalhao);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    if (!nullToAbsent || dataVerificacao != null) {
      map['data_verificacao'] = Variable<DateTime?>(dataVerificacao);
    }
    if (!nullToAbsent || foto != null) {
      map['foto'] = Variable<String?>(foto);
    }
    map['is_pendente'] = Variable<bool>(isPendente);
    if (!nullToAbsent || observacao != null) {
      map['observacao'] = Variable<String?>(observacao);
    }
    map['create_at'] = Variable<DateTime>(createAt);
    map['update_at'] = Variable<DateTime>(updateAt);
    if (!nullToAbsent || praga != null) {
      map['praga'] = Variable<String?>(praga);
    }
    if (!nullToAbsent || amostragem != null) {
      map['amostragem'] = Variable<String?>(amostragem);
    }
    if (!nullToAbsent || fase != null) {
      map['fase'] = Variable<String?>(fase);
    }
    if (!nullToAbsent || intensidade != null) {
      map['intensidade'] = Variable<String?>(intensidade);
    }
    if (!nullToAbsent || estrago != null) {
      map['estrago'] = Variable<String?>(estrago);
    }
    if (!nullToAbsent || observacoes != null) {
      map['observacoes'] = Variable<String?>(observacoes);
    }
    return map;
  }

  TablePontoVerificacaoCompanion toCompanion(bool nullToAbsent) {
    return TablePontoVerificacaoCompanion(
      id: Value(id),
      idTalhao: Value(idTalhao),
      latitude: Value(latitude),
      longitude: Value(longitude),
      dataVerificacao: dataVerificacao == null && nullToAbsent
          ? const Value.absent()
          : Value(dataVerificacao),
      foto: foto == null && nullToAbsent ? const Value.absent() : Value(foto),
      isPendente: Value(isPendente),
      observacao: observacao == null && nullToAbsent
          ? const Value.absent()
          : Value(observacao),
      createAt: Value(createAt),
      updateAt: Value(updateAt),
      praga:
          praga == null && nullToAbsent ? const Value.absent() : Value(praga),
      amostragem: amostragem == null && nullToAbsent
          ? const Value.absent()
          : Value(amostragem),
      fase: fase == null && nullToAbsent ? const Value.absent() : Value(fase),
      intensidade: intensidade == null && nullToAbsent
          ? const Value.absent()
          : Value(intensidade),
      estrago: estrago == null && nullToAbsent
          ? const Value.absent()
          : Value(estrago),
      observacoes: observacoes == null && nullToAbsent
          ? const Value.absent()
          : Value(observacoes),
    );
  }

  factory TablePontoVerificacaoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TablePontoVerificacaoData(
      id: serializer.fromJson<int>(json['id']),
      idTalhao: serializer.fromJson<int>(json['idTalhao']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      dataVerificacao: serializer.fromJson<DateTime?>(json['dataVerificacao']),
      foto: serializer.fromJson<String?>(json['foto']),
      isPendente: serializer.fromJson<bool>(json['isPendente']),
      observacao: serializer.fromJson<String?>(json['observacao']),
      createAt: serializer.fromJson<DateTime>(json['createAt']),
      updateAt: serializer.fromJson<DateTime>(json['updateAt']),
      praga: serializer.fromJson<String?>(json['praga']),
      amostragem: serializer.fromJson<String?>(json['amostragem']),
      fase: serializer.fromJson<String?>(json['fase']),
      intensidade: serializer.fromJson<String?>(json['intensidade']),
      estrago: serializer.fromJson<String?>(json['estrago']),
      observacoes: serializer.fromJson<String?>(json['observacoes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idTalhao': serializer.toJson<int>(idTalhao),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'dataVerificacao': serializer.toJson<DateTime?>(dataVerificacao),
      'foto': serializer.toJson<String?>(foto),
      'isPendente': serializer.toJson<bool>(isPendente),
      'observacao': serializer.toJson<String?>(observacao),
      'createAt': serializer.toJson<DateTime>(createAt),
      'updateAt': serializer.toJson<DateTime>(updateAt),
      'praga': serializer.toJson<String?>(praga),
      'amostragem': serializer.toJson<String?>(amostragem),
      'fase': serializer.toJson<String?>(fase),
      'intensidade': serializer.toJson<String?>(intensidade),
      'estrago': serializer.toJson<String?>(estrago),
      'observacoes': serializer.toJson<String?>(observacoes),
    };
  }

  TablePontoVerificacaoData copyWith(
          {int? id,
          int? idTalhao,
          double? latitude,
          double? longitude,
          DateTime? dataVerificacao,
          String? foto,
          bool? isPendente,
          String? observacao,
          DateTime? createAt,
          DateTime? updateAt,
          String? praga,
          String? amostragem,
          String? fase,
          String? intensidade,
          String? estrago,
          String? observacoes}) =>
      TablePontoVerificacaoData(
        id: id ?? this.id,
        idTalhao: idTalhao ?? this.idTalhao,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        dataVerificacao: dataVerificacao ?? this.dataVerificacao,
        foto: foto ?? this.foto,
        isPendente: isPendente ?? this.isPendente,
        observacao: observacao ?? this.observacao,
        createAt: createAt ?? this.createAt,
        updateAt: updateAt ?? this.updateAt,
        praga: praga ?? this.praga,
        amostragem: amostragem ?? this.amostragem,
        fase: fase ?? this.fase,
        intensidade: intensidade ?? this.intensidade,
        estrago: estrago ?? this.estrago,
        observacoes: observacoes ?? this.observacoes,
      );
  @override
  String toString() {
    return (StringBuffer('TablePontoVerificacaoData(')
          ..write('id: $id, ')
          ..write('idTalhao: $idTalhao, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('dataVerificacao: $dataVerificacao, ')
          ..write('foto: $foto, ')
          ..write('isPendente: $isPendente, ')
          ..write('observacao: $observacao, ')
          ..write('createAt: $createAt, ')
          ..write('updateAt: $updateAt, ')
          ..write('praga: $praga, ')
          ..write('amostragem: $amostragem, ')
          ..write('fase: $fase, ')
          ..write('intensidade: $intensidade, ')
          ..write('estrago: $estrago, ')
          ..write('observacoes: $observacoes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          idTalhao.hashCode,
          $mrjc(
              latitude.hashCode,
              $mrjc(
                  longitude.hashCode,
                  $mrjc(
                      dataVerificacao.hashCode,
                      $mrjc(
                          foto.hashCode,
                          $mrjc(
                              isPendente.hashCode,
                              $mrjc(
                                  observacao.hashCode,
                                  $mrjc(
                                      createAt.hashCode,
                                      $mrjc(
                                          updateAt.hashCode,
                                          $mrjc(
                                              praga.hashCode,
                                              $mrjc(
                                                  amostragem.hashCode,
                                                  $mrjc(
                                                      fase.hashCode,
                                                      $mrjc(
                                                          intensidade.hashCode,
                                                          $mrjc(
                                                              estrago.hashCode,
                                                              observacoes
                                                                  .hashCode))))))))))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TablePontoVerificacaoData &&
          other.id == this.id &&
          other.idTalhao == this.idTalhao &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.dataVerificacao == this.dataVerificacao &&
          other.foto == this.foto &&
          other.isPendente == this.isPendente &&
          other.observacao == this.observacao &&
          other.createAt == this.createAt &&
          other.updateAt == this.updateAt &&
          other.praga == this.praga &&
          other.amostragem == this.amostragem &&
          other.fase == this.fase &&
          other.intensidade == this.intensidade &&
          other.estrago == this.estrago &&
          other.observacoes == this.observacoes);
}

class TablePontoVerificacaoCompanion
    extends UpdateCompanion<TablePontoVerificacaoData> {
  final Value<int> id;
  final Value<int> idTalhao;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<DateTime?> dataVerificacao;
  final Value<String?> foto;
  final Value<bool> isPendente;
  final Value<String?> observacao;
  final Value<DateTime> createAt;
  final Value<DateTime> updateAt;
  final Value<String?> praga;
  final Value<String?> amostragem;
  final Value<String?> fase;
  final Value<String?> intensidade;
  final Value<String?> estrago;
  final Value<String?> observacoes;
  const TablePontoVerificacaoCompanion({
    this.id = const Value.absent(),
    this.idTalhao = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.dataVerificacao = const Value.absent(),
    this.foto = const Value.absent(),
    this.isPendente = const Value.absent(),
    this.observacao = const Value.absent(),
    this.createAt = const Value.absent(),
    this.updateAt = const Value.absent(),
    this.praga = const Value.absent(),
    this.amostragem = const Value.absent(),
    this.fase = const Value.absent(),
    this.intensidade = const Value.absent(),
    this.estrago = const Value.absent(),
    this.observacoes = const Value.absent(),
  });
  TablePontoVerificacaoCompanion.insert({
    this.id = const Value.absent(),
    required int idTalhao,
    required double latitude,
    required double longitude,
    this.dataVerificacao = const Value.absent(),
    this.foto = const Value.absent(),
    required bool isPendente,
    this.observacao = const Value.absent(),
    required DateTime createAt,
    required DateTime updateAt,
    this.praga = const Value.absent(),
    this.amostragem = const Value.absent(),
    this.fase = const Value.absent(),
    this.intensidade = const Value.absent(),
    this.estrago = const Value.absent(),
    this.observacoes = const Value.absent(),
  })  : idTalhao = Value(idTalhao),
        latitude = Value(latitude),
        longitude = Value(longitude),
        isPendente = Value(isPendente),
        createAt = Value(createAt),
        updateAt = Value(updateAt);
  static Insertable<TablePontoVerificacaoData> custom({
    Expression<int>? id,
    Expression<int>? idTalhao,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<DateTime?>? dataVerificacao,
    Expression<String?>? foto,
    Expression<bool>? isPendente,
    Expression<String?>? observacao,
    Expression<DateTime>? createAt,
    Expression<DateTime>? updateAt,
    Expression<String?>? praga,
    Expression<String?>? amostragem,
    Expression<String?>? fase,
    Expression<String?>? intensidade,
    Expression<String?>? estrago,
    Expression<String?>? observacoes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idTalhao != null) 'id_talhao': idTalhao,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (dataVerificacao != null) 'data_verificacao': dataVerificacao,
      if (foto != null) 'foto': foto,
      if (isPendente != null) 'is_pendente': isPendente,
      if (observacao != null) 'observacao': observacao,
      if (createAt != null) 'create_at': createAt,
      if (updateAt != null) 'update_at': updateAt,
      if (praga != null) 'praga': praga,
      if (amostragem != null) 'amostragem': amostragem,
      if (fase != null) 'fase': fase,
      if (intensidade != null) 'intensidade': intensidade,
      if (estrago != null) 'estrago': estrago,
      if (observacoes != null) 'observacoes': observacoes,
    });
  }

  TablePontoVerificacaoCompanion copyWith(
      {Value<int>? id,
      Value<int>? idTalhao,
      Value<double>? latitude,
      Value<double>? longitude,
      Value<DateTime?>? dataVerificacao,
      Value<String?>? foto,
      Value<bool>? isPendente,
      Value<String?>? observacao,
      Value<DateTime>? createAt,
      Value<DateTime>? updateAt,
      Value<String?>? praga,
      Value<String?>? amostragem,
      Value<String?>? fase,
      Value<String?>? intensidade,
      Value<String?>? estrago,
      Value<String?>? observacoes}) {
    return TablePontoVerificacaoCompanion(
      id: id ?? this.id,
      idTalhao: idTalhao ?? this.idTalhao,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      dataVerificacao: dataVerificacao ?? this.dataVerificacao,
      foto: foto ?? this.foto,
      isPendente: isPendente ?? this.isPendente,
      observacao: observacao ?? this.observacao,
      createAt: createAt ?? this.createAt,
      updateAt: updateAt ?? this.updateAt,
      praga: praga ?? this.praga,
      amostragem: amostragem ?? this.amostragem,
      fase: fase ?? this.fase,
      intensidade: intensidade ?? this.intensidade,
      estrago: estrago ?? this.estrago,
      observacoes: observacoes ?? this.observacoes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idTalhao.present) {
      map['id_talhao'] = Variable<int>(idTalhao.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (dataVerificacao.present) {
      map['data_verificacao'] = Variable<DateTime?>(dataVerificacao.value);
    }
    if (foto.present) {
      map['foto'] = Variable<String?>(foto.value);
    }
    if (isPendente.present) {
      map['is_pendente'] = Variable<bool>(isPendente.value);
    }
    if (observacao.present) {
      map['observacao'] = Variable<String?>(observacao.value);
    }
    if (createAt.present) {
      map['create_at'] = Variable<DateTime>(createAt.value);
    }
    if (updateAt.present) {
      map['update_at'] = Variable<DateTime>(updateAt.value);
    }
    if (praga.present) {
      map['praga'] = Variable<String?>(praga.value);
    }
    if (amostragem.present) {
      map['amostragem'] = Variable<String?>(amostragem.value);
    }
    if (fase.present) {
      map['fase'] = Variable<String?>(fase.value);
    }
    if (intensidade.present) {
      map['intensidade'] = Variable<String?>(intensidade.value);
    }
    if (estrago.present) {
      map['estrago'] = Variable<String?>(estrago.value);
    }
    if (observacoes.present) {
      map['observacoes'] = Variable<String?>(observacoes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TablePontoVerificacaoCompanion(')
          ..write('id: $id, ')
          ..write('idTalhao: $idTalhao, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('dataVerificacao: $dataVerificacao, ')
          ..write('foto: $foto, ')
          ..write('isPendente: $isPendente, ')
          ..write('observacao: $observacao, ')
          ..write('createAt: $createAt, ')
          ..write('updateAt: $updateAt, ')
          ..write('praga: $praga, ')
          ..write('amostragem: $amostragem, ')
          ..write('fase: $fase, ')
          ..write('intensidade: $intensidade, ')
          ..write('estrago: $estrago, ')
          ..write('observacoes: $observacoes')
          ..write(')'))
        .toString();
  }
}

class $TablePontoVerificacaoTable extends TablePontoVerificacao
    with TableInfo<$TablePontoVerificacaoTable, TablePontoVerificacaoData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TablePontoVerificacaoTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _idTalhaoMeta = const VerificationMeta('idTalhao');
  late final GeneratedColumn<int?> idTalhao = GeneratedColumn<int?>(
      'id_talhao', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _latitudeMeta = const VerificationMeta('latitude');
  late final GeneratedColumn<double?> latitude = GeneratedColumn<double?>(
      'latitude', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _longitudeMeta = const VerificationMeta('longitude');
  late final GeneratedColumn<double?> longitude = GeneratedColumn<double?>(
      'longitude', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _dataVerificacaoMeta =
      const VerificationMeta('dataVerificacao');
  late final GeneratedColumn<DateTime?> dataVerificacao =
      GeneratedColumn<DateTime?>('data_verificacao', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _fotoMeta = const VerificationMeta('foto');
  late final GeneratedColumn<String?> foto = GeneratedColumn<String?>(
      'foto', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _isPendenteMeta = const VerificationMeta('isPendente');
  late final GeneratedColumn<bool?> isPendente = GeneratedColumn<bool?>(
      'is_pendente', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_pendente IN (0, 1))');
  final VerificationMeta _observacaoMeta = const VerificationMeta('observacao');
  late final GeneratedColumn<String?> observacao = GeneratedColumn<String?>(
      'observacao', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _createAtMeta = const VerificationMeta('createAt');
  late final GeneratedColumn<DateTime?> createAt = GeneratedColumn<DateTime?>(
      'create_at', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _updateAtMeta = const VerificationMeta('updateAt');
  late final GeneratedColumn<DateTime?> updateAt = GeneratedColumn<DateTime?>(
      'update_at', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _pragaMeta = const VerificationMeta('praga');
  late final GeneratedColumn<String?> praga = GeneratedColumn<String?>(
      'praga', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _amostragemMeta = const VerificationMeta('amostragem');
  late final GeneratedColumn<String?> amostragem = GeneratedColumn<String?>(
      'amostragem', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _faseMeta = const VerificationMeta('fase');
  late final GeneratedColumn<String?> fase = GeneratedColumn<String?>(
      'fase', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _intensidadeMeta =
      const VerificationMeta('intensidade');
  late final GeneratedColumn<String?> intensidade = GeneratedColumn<String?>(
      'intensidade', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _estragoMeta = const VerificationMeta('estrago');
  late final GeneratedColumn<String?> estrago = GeneratedColumn<String?>(
      'estrago', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _observacoesMeta =
      const VerificationMeta('observacoes');
  late final GeneratedColumn<String?> observacoes = GeneratedColumn<String?>(
      'observacoes', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        idTalhao,
        latitude,
        longitude,
        dataVerificacao,
        foto,
        isPendente,
        observacao,
        createAt,
        updateAt,
        praga,
        amostragem,
        fase,
        intensidade,
        estrago,
        observacoes
      ];
  @override
  String get aliasedName => _alias ?? 'table_ponto_verificacao';
  @override
  String get actualTableName => 'table_ponto_verificacao';
  @override
  VerificationContext validateIntegrity(
      Insertable<TablePontoVerificacaoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_talhao')) {
      context.handle(_idTalhaoMeta,
          idTalhao.isAcceptableOrUnknown(data['id_talhao']!, _idTalhaoMeta));
    } else if (isInserting) {
      context.missing(_idTalhaoMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('data_verificacao')) {
      context.handle(
          _dataVerificacaoMeta,
          dataVerificacao.isAcceptableOrUnknown(
              data['data_verificacao']!, _dataVerificacaoMeta));
    }
    if (data.containsKey('foto')) {
      context.handle(
          _fotoMeta, foto.isAcceptableOrUnknown(data['foto']!, _fotoMeta));
    }
    if (data.containsKey('is_pendente')) {
      context.handle(
          _isPendenteMeta,
          isPendente.isAcceptableOrUnknown(
              data['is_pendente']!, _isPendenteMeta));
    } else if (isInserting) {
      context.missing(_isPendenteMeta);
    }
    if (data.containsKey('observacao')) {
      context.handle(
          _observacaoMeta,
          observacao.isAcceptableOrUnknown(
              data['observacao']!, _observacaoMeta));
    }
    if (data.containsKey('create_at')) {
      context.handle(_createAtMeta,
          createAt.isAcceptableOrUnknown(data['create_at']!, _createAtMeta));
    } else if (isInserting) {
      context.missing(_createAtMeta);
    }
    if (data.containsKey('update_at')) {
      context.handle(_updateAtMeta,
          updateAt.isAcceptableOrUnknown(data['update_at']!, _updateAtMeta));
    } else if (isInserting) {
      context.missing(_updateAtMeta);
    }
    if (data.containsKey('praga')) {
      context.handle(
          _pragaMeta, praga.isAcceptableOrUnknown(data['praga']!, _pragaMeta));
    }
    if (data.containsKey('amostragem')) {
      context.handle(
          _amostragemMeta,
          amostragem.isAcceptableOrUnknown(
              data['amostragem']!, _amostragemMeta));
    }
    if (data.containsKey('fase')) {
      context.handle(
          _faseMeta, fase.isAcceptableOrUnknown(data['fase']!, _faseMeta));
    }
    if (data.containsKey('intensidade')) {
      context.handle(
          _intensidadeMeta,
          intensidade.isAcceptableOrUnknown(
              data['intensidade']!, _intensidadeMeta));
    }
    if (data.containsKey('estrago')) {
      context.handle(_estragoMeta,
          estrago.isAcceptableOrUnknown(data['estrago']!, _estragoMeta));
    }
    if (data.containsKey('observacoes')) {
      context.handle(
          _observacoesMeta,
          observacoes.isAcceptableOrUnknown(
              data['observacoes']!, _observacoesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TablePontoVerificacaoData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    return TablePontoVerificacaoData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TablePontoVerificacaoTable createAlias(String alias) {
    return $TablePontoVerificacaoTable(_db, alias);
  }
}

class TableFazendaData extends DataClass
    implements Insertable<TableFazendaData> {
  final String id;
  final String nome;
  final String codigoParceiro;
  final String idColaboradores;
  TableFazendaData(
      {required this.id,
      required this.nome,
      required this.codigoParceiro,
      required this.idColaboradores});
  factory TableFazendaData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TableFazendaData(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      nome: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nome'])!,
      codigoParceiro: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}codigo_parceiro'])!,
      idColaboradores: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_colaboradores'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['nome'] = Variable<String>(nome);
    map['codigo_parceiro'] = Variable<String>(codigoParceiro);
    map['id_colaboradores'] = Variable<String>(idColaboradores);
    return map;
  }

  TableFazendaCompanion toCompanion(bool nullToAbsent) {
    return TableFazendaCompanion(
      id: Value(id),
      nome: Value(nome),
      codigoParceiro: Value(codigoParceiro),
      idColaboradores: Value(idColaboradores),
    );
  }

  factory TableFazendaData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TableFazendaData(
      id: serializer.fromJson<String>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      codigoParceiro: serializer.fromJson<String>(json['codigoParceiro']),
      idColaboradores: serializer.fromJson<String>(json['idColaboradores']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'nome': serializer.toJson<String>(nome),
      'codigoParceiro': serializer.toJson<String>(codigoParceiro),
      'idColaboradores': serializer.toJson<String>(idColaboradores),
    };
  }

  TableFazendaData copyWith(
          {String? id,
          String? nome,
          String? codigoParceiro,
          String? idColaboradores}) =>
      TableFazendaData(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        codigoParceiro: codigoParceiro ?? this.codigoParceiro,
        idColaboradores: idColaboradores ?? this.idColaboradores,
      );
  @override
  String toString() {
    return (StringBuffer('TableFazendaData(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('codigoParceiro: $codigoParceiro, ')
          ..write('idColaboradores: $idColaboradores')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(nome.hashCode,
          $mrjc(codigoParceiro.hashCode, idColaboradores.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TableFazendaData &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.codigoParceiro == this.codigoParceiro &&
          other.idColaboradores == this.idColaboradores);
}

class TableFazendaCompanion extends UpdateCompanion<TableFazendaData> {
  final Value<String> id;
  final Value<String> nome;
  final Value<String> codigoParceiro;
  final Value<String> idColaboradores;
  const TableFazendaCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.codigoParceiro = const Value.absent(),
    this.idColaboradores = const Value.absent(),
  });
  TableFazendaCompanion.insert({
    required String id,
    required String nome,
    required String codigoParceiro,
    required String idColaboradores,
  })  : id = Value(id),
        nome = Value(nome),
        codigoParceiro = Value(codigoParceiro),
        idColaboradores = Value(idColaboradores);
  static Insertable<TableFazendaData> custom({
    Expression<String>? id,
    Expression<String>? nome,
    Expression<String>? codigoParceiro,
    Expression<String>? idColaboradores,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (codigoParceiro != null) 'codigo_parceiro': codigoParceiro,
      if (idColaboradores != null) 'id_colaboradores': idColaboradores,
    });
  }

  TableFazendaCompanion copyWith(
      {Value<String>? id,
      Value<String>? nome,
      Value<String>? codigoParceiro,
      Value<String>? idColaboradores}) {
    return TableFazendaCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      codigoParceiro: codigoParceiro ?? this.codigoParceiro,
      idColaboradores: idColaboradores ?? this.idColaboradores,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (codigoParceiro.present) {
      map['codigo_parceiro'] = Variable<String>(codigoParceiro.value);
    }
    if (idColaboradores.present) {
      map['id_colaboradores'] = Variable<String>(idColaboradores.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TableFazendaCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('codigoParceiro: $codigoParceiro, ')
          ..write('idColaboradores: $idColaboradores')
          ..write(')'))
        .toString();
  }
}

class $TableFazendaTable extends TableFazenda
    with TableInfo<$TableFazendaTable, TableFazendaData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TableFazendaTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _nomeMeta = const VerificationMeta('nome');
  late final GeneratedColumn<String?> nome = GeneratedColumn<String?>(
      'nome', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _codigoParceiroMeta =
      const VerificationMeta('codigoParceiro');
  late final GeneratedColumn<String?> codigoParceiro = GeneratedColumn<String?>(
      'codigo_parceiro', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _idColaboradoresMeta =
      const VerificationMeta('idColaboradores');
  late final GeneratedColumn<String?> idColaboradores =
      GeneratedColumn<String?>('id_colaboradores', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, nome, codigoParceiro, idColaboradores];
  @override
  String get aliasedName => _alias ?? 'table_fazenda';
  @override
  String get actualTableName => 'table_fazenda';
  @override
  VerificationContext validateIntegrity(Insertable<TableFazendaData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('codigo_parceiro')) {
      context.handle(
          _codigoParceiroMeta,
          codigoParceiro.isAcceptableOrUnknown(
              data['codigo_parceiro']!, _codigoParceiroMeta));
    } else if (isInserting) {
      context.missing(_codigoParceiroMeta);
    }
    if (data.containsKey('id_colaboradores')) {
      context.handle(
          _idColaboradoresMeta,
          idColaboradores.isAcceptableOrUnknown(
              data['id_colaboradores']!, _idColaboradoresMeta));
    } else if (isInserting) {
      context.missing(_idColaboradoresMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TableFazendaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TableFazendaData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TableFazendaTable createAlias(String alias) {
    return $TableFazendaTable(_db, alias);
  }
}

class TablePlantioData extends DataClass
    implements Insertable<TablePlantioData> {
  final int id;
  final String talhao;
  final String nomeFazenda;
  final double areaEmHectares;
  final double areaAtrasado;
  final double areaExecutado;
  TablePlantioData(
      {required this.id,
      required this.talhao,
      required this.nomeFazenda,
      required this.areaEmHectares,
      required this.areaAtrasado,
      required this.areaExecutado});
  factory TablePlantioData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TablePlantioData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      talhao: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}talhao'])!,
      nomeFazenda: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nome_fazenda'])!,
      areaEmHectares: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}area_em_hectares'])!,
      areaAtrasado: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}area_atrasado'])!,
      areaExecutado: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}area_executado'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['talhao'] = Variable<String>(talhao);
    map['nome_fazenda'] = Variable<String>(nomeFazenda);
    map['area_em_hectares'] = Variable<double>(areaEmHectares);
    map['area_atrasado'] = Variable<double>(areaAtrasado);
    map['area_executado'] = Variable<double>(areaExecutado);
    return map;
  }

  TablePlantioCompanion toCompanion(bool nullToAbsent) {
    return TablePlantioCompanion(
      id: Value(id),
      talhao: Value(talhao),
      nomeFazenda: Value(nomeFazenda),
      areaEmHectares: Value(areaEmHectares),
      areaAtrasado: Value(areaAtrasado),
      areaExecutado: Value(areaExecutado),
    );
  }

  factory TablePlantioData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TablePlantioData(
      id: serializer.fromJson<int>(json['id']),
      talhao: serializer.fromJson<String>(json['talhao']),
      nomeFazenda: serializer.fromJson<String>(json['nomeFazenda']),
      areaEmHectares: serializer.fromJson<double>(json['areaEmHectares']),
      areaAtrasado: serializer.fromJson<double>(json['areaAtrasado']),
      areaExecutado: serializer.fromJson<double>(json['areaExecutado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'talhao': serializer.toJson<String>(talhao),
      'nomeFazenda': serializer.toJson<String>(nomeFazenda),
      'areaEmHectares': serializer.toJson<double>(areaEmHectares),
      'areaAtrasado': serializer.toJson<double>(areaAtrasado),
      'areaExecutado': serializer.toJson<double>(areaExecutado),
    };
  }

  TablePlantioData copyWith(
          {int? id,
          String? talhao,
          String? nomeFazenda,
          double? areaEmHectares,
          double? areaAtrasado,
          double? areaExecutado}) =>
      TablePlantioData(
        id: id ?? this.id,
        talhao: talhao ?? this.talhao,
        nomeFazenda: nomeFazenda ?? this.nomeFazenda,
        areaEmHectares: areaEmHectares ?? this.areaEmHectares,
        areaAtrasado: areaAtrasado ?? this.areaAtrasado,
        areaExecutado: areaExecutado ?? this.areaExecutado,
      );
  @override
  String toString() {
    return (StringBuffer('TablePlantioData(')
          ..write('id: $id, ')
          ..write('talhao: $talhao, ')
          ..write('nomeFazenda: $nomeFazenda, ')
          ..write('areaEmHectares: $areaEmHectares, ')
          ..write('areaAtrasado: $areaAtrasado, ')
          ..write('areaExecutado: $areaExecutado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          talhao.hashCode,
          $mrjc(
              nomeFazenda.hashCode,
              $mrjc(areaEmHectares.hashCode,
                  $mrjc(areaAtrasado.hashCode, areaExecutado.hashCode))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TablePlantioData &&
          other.id == this.id &&
          other.talhao == this.talhao &&
          other.nomeFazenda == this.nomeFazenda &&
          other.areaEmHectares == this.areaEmHectares &&
          other.areaAtrasado == this.areaAtrasado &&
          other.areaExecutado == this.areaExecutado);
}

class TablePlantioCompanion extends UpdateCompanion<TablePlantioData> {
  final Value<int> id;
  final Value<String> talhao;
  final Value<String> nomeFazenda;
  final Value<double> areaEmHectares;
  final Value<double> areaAtrasado;
  final Value<double> areaExecutado;
  const TablePlantioCompanion({
    this.id = const Value.absent(),
    this.talhao = const Value.absent(),
    this.nomeFazenda = const Value.absent(),
    this.areaEmHectares = const Value.absent(),
    this.areaAtrasado = const Value.absent(),
    this.areaExecutado = const Value.absent(),
  });
  TablePlantioCompanion.insert({
    required int id,
    required String talhao,
    required String nomeFazenda,
    required double areaEmHectares,
    required double areaAtrasado,
    required double areaExecutado,
  })  : id = Value(id),
        talhao = Value(talhao),
        nomeFazenda = Value(nomeFazenda),
        areaEmHectares = Value(areaEmHectares),
        areaAtrasado = Value(areaAtrasado),
        areaExecutado = Value(areaExecutado);
  static Insertable<TablePlantioData> custom({
    Expression<int>? id,
    Expression<String>? talhao,
    Expression<String>? nomeFazenda,
    Expression<double>? areaEmHectares,
    Expression<double>? areaAtrasado,
    Expression<double>? areaExecutado,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (talhao != null) 'talhao': talhao,
      if (nomeFazenda != null) 'nome_fazenda': nomeFazenda,
      if (areaEmHectares != null) 'area_em_hectares': areaEmHectares,
      if (areaAtrasado != null) 'area_atrasado': areaAtrasado,
      if (areaExecutado != null) 'area_executado': areaExecutado,
    });
  }

  TablePlantioCompanion copyWith(
      {Value<int>? id,
      Value<String>? talhao,
      Value<String>? nomeFazenda,
      Value<double>? areaEmHectares,
      Value<double>? areaAtrasado,
      Value<double>? areaExecutado}) {
    return TablePlantioCompanion(
      id: id ?? this.id,
      talhao: talhao ?? this.talhao,
      nomeFazenda: nomeFazenda ?? this.nomeFazenda,
      areaEmHectares: areaEmHectares ?? this.areaEmHectares,
      areaAtrasado: areaAtrasado ?? this.areaAtrasado,
      areaExecutado: areaExecutado ?? this.areaExecutado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (talhao.present) {
      map['talhao'] = Variable<String>(talhao.value);
    }
    if (nomeFazenda.present) {
      map['nome_fazenda'] = Variable<String>(nomeFazenda.value);
    }
    if (areaEmHectares.present) {
      map['area_em_hectares'] = Variable<double>(areaEmHectares.value);
    }
    if (areaAtrasado.present) {
      map['area_atrasado'] = Variable<double>(areaAtrasado.value);
    }
    if (areaExecutado.present) {
      map['area_executado'] = Variable<double>(areaExecutado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TablePlantioCompanion(')
          ..write('id: $id, ')
          ..write('talhao: $talhao, ')
          ..write('nomeFazenda: $nomeFazenda, ')
          ..write('areaEmHectares: $areaEmHectares, ')
          ..write('areaAtrasado: $areaAtrasado, ')
          ..write('areaExecutado: $areaExecutado')
          ..write(')'))
        .toString();
  }
}

class $TablePlantioTable extends TablePlantio
    with TableInfo<$TablePlantioTable, TablePlantioData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TablePlantioTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _talhaoMeta = const VerificationMeta('talhao');
  late final GeneratedColumn<String?> talhao = GeneratedColumn<String?>(
      'talhao', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _nomeFazendaMeta =
      const VerificationMeta('nomeFazenda');
  late final GeneratedColumn<String?> nomeFazenda = GeneratedColumn<String?>(
      'nome_fazenda', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _areaEmHectaresMeta =
      const VerificationMeta('areaEmHectares');
  late final GeneratedColumn<double?> areaEmHectares = GeneratedColumn<double?>(
      'area_em_hectares', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _areaAtrasadoMeta =
      const VerificationMeta('areaAtrasado');
  late final GeneratedColumn<double?> areaAtrasado = GeneratedColumn<double?>(
      'area_atrasado', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _areaExecutadoMeta =
      const VerificationMeta('areaExecutado');
  late final GeneratedColumn<double?> areaExecutado = GeneratedColumn<double?>(
      'area_executado', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, talhao, nomeFazenda, areaEmHectares, areaAtrasado, areaExecutado];
  @override
  String get aliasedName => _alias ?? 'table_plantio';
  @override
  String get actualTableName => 'table_plantio';
  @override
  VerificationContext validateIntegrity(Insertable<TablePlantioData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('talhao')) {
      context.handle(_talhaoMeta,
          talhao.isAcceptableOrUnknown(data['talhao']!, _talhaoMeta));
    } else if (isInserting) {
      context.missing(_talhaoMeta);
    }
    if (data.containsKey('nome_fazenda')) {
      context.handle(
          _nomeFazendaMeta,
          nomeFazenda.isAcceptableOrUnknown(
              data['nome_fazenda']!, _nomeFazendaMeta));
    } else if (isInserting) {
      context.missing(_nomeFazendaMeta);
    }
    if (data.containsKey('area_em_hectares')) {
      context.handle(
          _areaEmHectaresMeta,
          areaEmHectares.isAcceptableOrUnknown(
              data['area_em_hectares']!, _areaEmHectaresMeta));
    } else if (isInserting) {
      context.missing(_areaEmHectaresMeta);
    }
    if (data.containsKey('area_atrasado')) {
      context.handle(
          _areaAtrasadoMeta,
          areaAtrasado.isAcceptableOrUnknown(
              data['area_atrasado']!, _areaAtrasadoMeta));
    } else if (isInserting) {
      context.missing(_areaAtrasadoMeta);
    }
    if (data.containsKey('area_executado')) {
      context.handle(
          _areaExecutadoMeta,
          areaExecutado.isAcceptableOrUnknown(
              data['area_executado']!, _areaExecutadoMeta));
    } else if (isInserting) {
      context.missing(_areaExecutadoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  TablePlantioData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TablePlantioData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TablePlantioTable createAlias(String alias) {
    return $TablePlantioTable(_db, alias);
  }
}

abstract class _$MyDataBase extends GeneratedDatabase {
  _$MyDataBase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $TableAtividadeTable tableAtividade = $TableAtividadeTable(this);
  late final $TableMaquinaTable tableMaquina = $TableMaquinaTable(this);
  late final $TableInsumoTable tableInsumo = $TableInsumoTable(this);
  late final $TableColaboradorTable tableColaborador =
      $TableColaboradorTable(this);
  late final $TableAbastecimentoTable tableAbastecimento =
      $TableAbastecimentoTable(this);
  late final $TablePluviametriaTable tablePluviametria =
      $TablePluviametriaTable(this);
  late final $TableTalhaoTable tableTalhao = $TableTalhaoTable(this);
  late final $TablePontoVerificacaoTable tablePontoVerificacao =
      $TablePontoVerificacaoTable(this);
  late final $TableFazendaTable tableFazenda = $TableFazendaTable(this);
  late final $TablePlantioTable tablePlantio = $TablePlantioTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        tableAtividade,
        tableMaquina,
        tableInsumo,
        tableColaborador,
        tableAbastecimento,
        tablePluviametria,
        tableTalhao,
        tablePontoVerificacao,
        tableFazenda,
        tablePlantio
      ];
}
