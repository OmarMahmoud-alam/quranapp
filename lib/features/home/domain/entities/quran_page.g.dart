// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_page.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetQuranPageCollection on Isar {
  IsarCollection<QuranPage> get quranPages => this.collection();
}

const QuranPageSchema = CollectionSchema(
  name: r'QuranPage',
  id: 2265627023612368052,
  properties: {
    r'pagenumber': PropertySchema(
      id: 0,
      name: r'pagenumber',
      type: IsarType.long,
    )
  },
  estimateSize: _quranPageEstimateSize,
  serialize: _quranPageSerialize,
  deserialize: _quranPageDeserialize,
  deserializeProp: _quranPageDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'surahPageData': LinkSchema(
      id: -9056286567752719605,
      name: r'surahPageData',
      target: r'SurahPageData',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _quranPageGetId,
  getLinks: _quranPageGetLinks,
  attach: _quranPageAttach,
  version: '3.1.0+1',
);

int _quranPageEstimateSize(
  QuranPage object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _quranPageSerialize(
  QuranPage object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.pagenumber);
}

QuranPage _quranPageDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = QuranPage(
    pagenumber: reader.readLong(offsets[0]),
  );
  object.id = id;
  return object;
}

P _quranPageDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _quranPageGetId(QuranPage object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _quranPageGetLinks(QuranPage object) {
  return [object.surahPageData];
}

void _quranPageAttach(IsarCollection<dynamic> col, Id id, QuranPage object) {
  object.id = id;
  object.surahPageData
      .attach(col, col.isar.collection<SurahPageData>(), r'surahPageData', id);
}

extension QuranPageQueryWhereSort
    on QueryBuilder<QuranPage, QuranPage, QWhere> {
  QueryBuilder<QuranPage, QuranPage, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension QuranPageQueryWhere
    on QueryBuilder<QuranPage, QuranPage, QWhereClause> {
  QueryBuilder<QuranPage, QuranPage, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<QuranPage, QuranPage, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<QuranPage, QuranPage, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<QuranPage, QuranPage, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<QuranPage, QuranPage, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension QuranPageQueryFilter
    on QueryBuilder<QuranPage, QuranPage, QFilterCondition> {
  QueryBuilder<QuranPage, QuranPage, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QuranPage, QuranPage, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QuranPage, QuranPage, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QuranPage, QuranPage, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuranPage, QuranPage, QAfterFilterCondition> pagenumberEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pagenumber',
        value: value,
      ));
    });
  }

  QueryBuilder<QuranPage, QuranPage, QAfterFilterCondition>
      pagenumberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pagenumber',
        value: value,
      ));
    });
  }

  QueryBuilder<QuranPage, QuranPage, QAfterFilterCondition> pagenumberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pagenumber',
        value: value,
      ));
    });
  }

  QueryBuilder<QuranPage, QuranPage, QAfterFilterCondition> pagenumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pagenumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension QuranPageQueryObject
    on QueryBuilder<QuranPage, QuranPage, QFilterCondition> {}

extension QuranPageQueryLinks
    on QueryBuilder<QuranPage, QuranPage, QFilterCondition> {
  QueryBuilder<QuranPage, QuranPage, QAfterFilterCondition> surahPageData(
      FilterQuery<SurahPageData> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'surahPageData');
    });
  }

  QueryBuilder<QuranPage, QuranPage, QAfterFilterCondition>
      surahPageDataLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'surahPageData', length, true, length, true);
    });
  }

  QueryBuilder<QuranPage, QuranPage, QAfterFilterCondition>
      surahPageDataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'surahPageData', 0, true, 0, true);
    });
  }

  QueryBuilder<QuranPage, QuranPage, QAfterFilterCondition>
      surahPageDataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'surahPageData', 0, false, 999999, true);
    });
  }

  QueryBuilder<QuranPage, QuranPage, QAfterFilterCondition>
      surahPageDataLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'surahPageData', 0, true, length, include);
    });
  }

  QueryBuilder<QuranPage, QuranPage, QAfterFilterCondition>
      surahPageDataLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'surahPageData', length, include, 999999, true);
    });
  }

  QueryBuilder<QuranPage, QuranPage, QAfterFilterCondition>
      surahPageDataLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'surahPageData', lower, includeLower, upper, includeUpper);
    });
  }
}

extension QuranPageQuerySortBy on QueryBuilder<QuranPage, QuranPage, QSortBy> {
  QueryBuilder<QuranPage, QuranPage, QAfterSortBy> sortByPagenumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pagenumber', Sort.asc);
    });
  }

  QueryBuilder<QuranPage, QuranPage, QAfterSortBy> sortByPagenumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pagenumber', Sort.desc);
    });
  }
}

extension QuranPageQuerySortThenBy
    on QueryBuilder<QuranPage, QuranPage, QSortThenBy> {
  QueryBuilder<QuranPage, QuranPage, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<QuranPage, QuranPage, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<QuranPage, QuranPage, QAfterSortBy> thenByPagenumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pagenumber', Sort.asc);
    });
  }

  QueryBuilder<QuranPage, QuranPage, QAfterSortBy> thenByPagenumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pagenumber', Sort.desc);
    });
  }
}

extension QuranPageQueryWhereDistinct
    on QueryBuilder<QuranPage, QuranPage, QDistinct> {
  QueryBuilder<QuranPage, QuranPage, QDistinct> distinctByPagenumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pagenumber');
    });
  }
}

extension QuranPageQueryProperty
    on QueryBuilder<QuranPage, QuranPage, QQueryProperty> {
  QueryBuilder<QuranPage, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<QuranPage, int, QQueryOperations> pagenumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pagenumber');
    });
  }
}
