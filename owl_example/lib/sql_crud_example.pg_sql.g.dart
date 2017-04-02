// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: PostgresSqlGenerator
// Target: library sql_crud_example
// **************************************************************************

// Generated by owl 0.1.2
// https://github.com/agilord/owl

// ignore: unused_import, library_prefixes
import 'sql_crud_example.dart';
// ignore: unused_import, library_prefixes
import 'dart:async';
// ignore: unused_import, library_prefixes
import 'package:owl/util/json/core.dart' as _owl_json;
// ignore: unused_import, library_prefixes
import 'package:owl/util/sql/postgresql.dart' as _owl_sql_pg;
// ignore: unused_import, library_prefixes
import 'package:postgresql/postgresql.dart' as pg;

/// DDL statements.
final List<String> sqlCrudExampleDdl = <String>[
  """CREATE TABLE IF NOT EXISTS my_custom_entity(entity_id INTEGER, ts TIMESTAMP, some_other_column TEXT, external_id UUID, version INTEGER, PRIMARY KEY(entity_id));""",
  """CREATE TABLE IF NOT EXISTS entity_detail(entity_id INTEGER, detail_id INTEGER, is_active BOOLEAN, PRIMARY KEY(entity_id, detail_id));""",
  """ALTER TABLE entity_detail ADD CONSTRAINT fk_entity_detail__entityId__my_custom_entity FOREIGN KEY (entity_id) REFERENCES my_custom_entity (entity_id);"""
];

// **************************************************************************
// Generator: PostgresSqlGenerator
// Target: class EntityMain
// **************************************************************************

/// CRUD methods for table: my_custom_entity
abstract class MyCustomEntityTable {
  /// table: my_custom_entity
  /// ignore: constant_identifier_names
  static const String MY_CUSTOM_ENTITY = 'my_custom_entity';

  /// column: entity_id
  static const String entityId = 'entity_id';

  /// column: ts
  static const String ts = 'ts';

  /// column: some_other_column
  static const String field = 'some_other_column';

  /// column: external_id
  static const String externalId = 'external_id';

  /// column: version
  static const String version = 'version';

  /// Convert database row to object.
  static EntityMain parseRow(pg.Row row) {
    if (row == null) return null;
    // ignore: always_specify_types
    final Map map = row.toMap();
    final EntityMain object = new EntityMain();
    object.entityId = map['entity_id'];
    object.ts = _owl_json.DateTimeMapper.parse(map['ts']);
    object.field = map['some_other_column'];
    object.externalId = _owl_json.UuidMapper.parse(map['external_id']);
    object.version = map['version'];
    return object;
  }

  /// Convert object to Map.
  static Map<String, dynamic> map(EntityMain object) {
    if (object == null) return null;
    return <String, dynamic>{
      'entity_id': object.entityId,
      'ts': _owl_json.DateTimeMapper.map(object.ts),
      'some_other_column': object.field,
      'external_id': _owl_json.UuidMapper.map(object.externalId),
      'version': object.version,
    };
  }

  /// Insert a row into my_custom_entity.
  static Future<int> create(pg.Connection connection, EntityMain entityMain,
      {String schema,
      List<String> clear,
      bool strict: true,
      bool ifNotExists: false}) async {
    if (ifNotExists) {
      final EntityMain _x =
          await read(connection, entityMain.entityId, strict: false);
      if (_x != null) return 0;
    }
    return await new _owl_sql_pg.SimpleCreate(
            schema: schema,
            table: 'my_custom_entity',
            set: map(entityMain),
            clear: clear)
        .execute(connection, strict: strict);
  }

  /// Read a row from my_custom_entity.
  static Future<EntityMain> read(pg.Connection connection, int entityId,
      {String schema,
      List<String> columns,
      bool forUpdate: false,
      bool strict: true}) async {
    assert(entityId != null);
    final pg.Row _row = await new _owl_sql_pg.SimpleSelect(
            schema: schema,
            table: 'my_custom_entity',
            columns: columns,
            where: <String, dynamic>{'entity_id': entityId},
            limit: (strict ? 2 : 1),
            forUpdate: forUpdate)
        .get(connection, strict: strict);
    return parseRow(_row);
  }

  /// Update a row in my_custom_entity.
  static Future<int> update(pg.Connection connection, EntityMain entityMain,
      {String schema,
// ignore: parameter_assignments
      int version,
      bool autoVersion: false,
      List<String> clear,
      bool strict: true}) async {
    if (autoVersion) {
      assert(version == null);
      version = entityMain.version++;
    }
    final Map<String, dynamic> _set = map(entityMain);
    final Map<String, dynamic> _where = <String, dynamic>{
      'entity_id': _set.remove('entity_id'),
      'version': version,
    };
    return await new _owl_sql_pg.SimpleUpdate(
            schema: schema,
            table: 'my_custom_entity',
            set: _set,
            clear: clear,
            where: _where)
        .execute(connection, strict: strict);
  }

  /// Delete a row from my_custom_entity.
  static Future<int> delete(pg.Connection connection, int entityId,
      {String schema, int version, bool strict: true}) async {
    assert(entityId != null);
    return await new _owl_sql_pg.SimpleDelete(
            schema: schema,
            table: 'my_custom_entity',
            where: <String, dynamic>{'entity_id': entityId, 'version': version})
        .execute(connection, strict: strict);
  }
}

// **************************************************************************
// Generator: PostgresSqlGenerator
// Target: class EntityDetail
// **************************************************************************

/// CRUD methods for table: entity_detail
abstract class EntityDetailTable {
  /// table: entity_detail
  /// ignore: constant_identifier_names
  static const String ENTITY_DETAIL = 'entity_detail';

  /// column: entity_id
  static const String entityId = 'entity_id';

  /// column: detail_id
  static const String detailId = 'detail_id';

  /// column: is_active
  static const String isActive = 'is_active';

  /// Convert database row to object.
  static EntityDetail parseRow(pg.Row row) {
    if (row == null) return null;
    // ignore: always_specify_types
    final Map map = row.toMap();
    final EntityDetail object = new EntityDetail();
    object.entityId = map['entity_id'];
    object.detailId = map['detail_id'];
    object.isActive = map['is_active'];
    return object;
  }

  /// Convert object to Map.
  static Map<String, dynamic> map(EntityDetail object) {
    if (object == null) return null;
    return <String, dynamic>{
      'entity_id': object.entityId,
      'detail_id': object.detailId,
      'is_active': object.isActive,
    };
  }

  /// Insert a row into entity_detail.
  static Future<int> create(pg.Connection connection, EntityDetail entityDetail,
      {String schema,
      List<String> clear,
      bool strict: true,
      bool ifNotExists: false}) async {
    if (ifNotExists) {
      final EntityDetail _x = await read(
          connection, entityDetail.entityId, entityDetail.detailId,
          strict: false);
      if (_x != null) return 0;
    }
    return await new _owl_sql_pg.SimpleCreate(
            schema: schema,
            table: 'entity_detail',
            set: map(entityDetail),
            clear: clear)
        .execute(connection, strict: strict);
  }

  /// Read a row from entity_detail.
  static Future<EntityDetail> read(
      pg.Connection connection, int entityId, int detailId,
      {String schema,
      List<String> columns,
      bool forUpdate: false,
      bool strict: true}) async {
    assert(entityId != null);
    assert(detailId != null);
    final pg.Row _row = await new _owl_sql_pg.SimpleSelect(
            schema: schema,
            table: 'entity_detail',
            columns: columns,
            where: <String, dynamic>{
              'entity_id': entityId,
              'detail_id': detailId
            },
            limit: (strict ? 2 : 1),
            forUpdate: forUpdate)
        .get(connection, strict: strict);
    return parseRow(_row);
  }

  /// Update a row in entity_detail.
  static Future<int> update(pg.Connection connection, EntityDetail entityDetail,
      {String schema, List<String> clear, bool strict: true}) async {
    final Map<String, dynamic> _set = map(entityDetail);
    final Map<String, dynamic> _where = <String, dynamic>{
      'entity_id': _set.remove('entity_id'),
      'detail_id': _set.remove('detail_id'),
    };
    return await new _owl_sql_pg.SimpleUpdate(
            schema: schema,
            table: 'entity_detail',
            set: _set,
            clear: clear,
            where: _where)
        .execute(connection, strict: strict);
  }

  /// Delete a row from entity_detail.
  static Future<int> delete(
      pg.Connection connection, int entityId, int detailId,
      {String schema, bool strict: true}) async {
    assert(entityId != null);
    assert(detailId != null);
    return await new _owl_sql_pg.SimpleDelete(
        schema: schema,
        table: 'entity_detail',
        where: <String, dynamic>{
          'entity_id': entityId,
          'detail_id': detailId
        }).execute(connection, strict: strict);
  }
}
