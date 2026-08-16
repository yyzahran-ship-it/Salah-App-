// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_database.dart';

// ignore_for_file: type=lint
class SurahRow extends DataClass implements Insertable<SurahRow> {
  final int id;
  final String nameArabic;
  final String nameSimple;
  final String nameComplex;
  final String nameEnglish;
  final String revelationPlace;
  final int versesCount;
  final bool bismillahPre;
  const SurahRow(
      {required this.id,
      required this.nameArabic,
      required this.nameSimple,
      required this.nameComplex,
      required this.nameEnglish,
      required this.revelationPlace,
      required this.versesCount,
      required this.bismillahPre});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name_arabic'] = Variable<String>(nameArabic);
    map['name_simple'] = Variable<String>(nameSimple);
    map['name_complex'] = Variable<String>(nameComplex);
    map['name_english'] = Variable<String>(nameEnglish);
    map['revelation_place'] = Variable<String>(revelationPlace);
    map['verses_count'] = Variable<int>(versesCount);
    map['bismillah_pre'] = Variable<bool>(bismillahPre);
    return map;
  }

  SurahsCompanion toCompanion(bool nullToAbsent) {
    return SurahsCompanion(
      id: Value(id),
      nameArabic: Value(nameArabic),
      nameSimple: Value(nameSimple),
      nameComplex: Value(nameComplex),
      nameEnglish: Value(nameEnglish),
      revelationPlace: Value(revelationPlace),
      versesCount: Value(versesCount),
      bismillahPre: Value(bismillahPre),
    );
  }

  factory SurahRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SurahRow(
      id: serializer.fromJson<int>(json['id']),
      nameArabic: serializer.fromJson<String>(json['nameArabic']),
      nameSimple: serializer.fromJson<String>(json['nameSimple']),
      nameComplex: serializer.fromJson<String>(json['nameComplex']),
      nameEnglish: serializer.fromJson<String>(json['nameEnglish']),
      revelationPlace: serializer.fromJson<String>(json['revelationPlace']),
      versesCount: serializer.fromJson<int>(json['versesCount']),
      bismillahPre: serializer.fromJson<bool>(json['bismillahPre']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nameArabic': serializer.toJson<String>(nameArabic),
      'nameSimple': serializer.toJson<String>(nameSimple),
      'nameComplex': serializer.toJson<String>(nameComplex),
      'nameEnglish': serializer.toJson<String>(nameEnglish),
      'revelationPlace': serializer.toJson<String>(revelationPlace),
      'versesCount': serializer.toJson<int>(versesCount),
      'bismillahPre': serializer.toJson<bool>(bismillahPre),
    };
  }

  SurahRow copyWith(
          {int? id,
          String? nameArabic,
          String? nameSimple,
          String? nameComplex,
          String? nameEnglish,
          String? revelationPlace,
          int? versesCount,
          bool? bismillahPre}) =>
      SurahRow(
        id: id ?? this.id,
        nameArabic: nameArabic ?? this.nameArabic,
        nameSimple: nameSimple ?? this.nameSimple,
        nameComplex: nameComplex ?? this.nameComplex,
        nameEnglish: nameEnglish ?? this.nameEnglish,
        revelationPlace: revelationPlace ?? this.revelationPlace,
        versesCount: versesCount ?? this.versesCount,
        bismillahPre: bismillahPre ?? this.bismillahPre,
      );
  @override
  String toString() {
    return (StringBuffer('SurahRow(')
          ..write('id: $id, ')
          ..write('nameArabic: $nameArabic, ')
          ..write('nameSimple: $nameSimple, ')
          ..write('nameComplex: $nameComplex, ')
          ..write('nameEnglish: $nameEnglish, ')
          ..write('revelationPlace: $revelationPlace, ')
          ..write('versesCount: $versesCount, ')
          ..write('bismillahPre: $bismillahPre')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nameArabic, nameSimple, nameComplex,
      nameEnglish, revelationPlace, versesCount, bismillahPre);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SurahRow &&
          other.id == this.id &&
          other.nameArabic == this.nameArabic &&
          other.nameSimple == this.nameSimple &&
          other.nameComplex == this.nameComplex &&
          other.nameEnglish == this.nameEnglish &&
          other.revelationPlace == this.revelationPlace &&
          other.versesCount == this.versesCount &&
          other.bismillahPre == this.bismillahPre);
}

class $SurahsTable extends Surahs with TableInfo<$SurahsTable, SurahRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SurahsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameArabicMeta =
      const VerificationMeta('nameArabic');
  @override
  late final GeneratedColumn<String> nameArabic = GeneratedColumn<String>(
      'name_arabic', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameSimpleMeta =
      const VerificationMeta('nameSimple');
  @override
  late final GeneratedColumn<String> nameSimple = GeneratedColumn<String>(
      'name_simple', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameComplexMeta =
      const VerificationMeta('nameComplex');
  @override
  late final GeneratedColumn<String> nameComplex = GeneratedColumn<String>(
      'name_complex', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameEnglishMeta =
      const VerificationMeta('nameEnglish');
  @override
  late final GeneratedColumn<String> nameEnglish = GeneratedColumn<String>(
      'name_english', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _revelationPlaceMeta =
      const VerificationMeta('revelationPlace');
  @override
  late final GeneratedColumn<String> revelationPlace = GeneratedColumn<String>(
      'revelation_place', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _versesCountMeta =
      const VerificationMeta('versesCount');
  @override
  late final GeneratedColumn<int> versesCount = GeneratedColumn<int>(
      'verses_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _bismillahPreMeta =
      const VerificationMeta('bismillahPre');
  @override
  late final GeneratedColumn<bool> bismillahPre = GeneratedColumn<bool>(
      'bismillah_pre', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultValue: const Constant<bool>(true));
  @override
  List<GeneratedColumn> get $columns =>
      [id, nameArabic, nameSimple, nameComplex, nameEnglish, revelationPlace, versesCount, bismillahPre];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'surahs';
  @override
  VerificationContext validateIntegrity(Insertable<SurahRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name_arabic')) {
      context.handle(_nameArabicMeta,
          nameArabic.isAcceptableOrUnknown(data['name_arabic']!, _nameArabicMeta));
    } else if (isInserting) {
      context.missing(_nameArabicMeta);
    }
    if (data.containsKey('name_simple')) {
      context.handle(_nameSimpleMeta,
          nameSimple.isAcceptableOrUnknown(data['name_simple']!, _nameSimpleMeta));
    } else if (isInserting) {
      context.missing(_nameSimpleMeta);
    }
    if (data.containsKey('name_complex')) {
      context.handle(_nameComplexMeta,
          nameComplex.isAcceptableOrUnknown(data['name_complex']!, _nameComplexMeta));
    } else if (isInserting) {
      context.missing(_nameComplexMeta);
    }
    if (data.containsKey('name_english')) {
      context.handle(_nameEnglishMeta,
          nameEnglish.isAcceptableOrUnknown(data['name_english']!, _nameEnglishMeta));
    } else if (isInserting) {
      context.missing(_nameEnglishMeta);
    }
    if (data.containsKey('revelation_place')) {
      context.handle(
          _revelationPlaceMeta,
          revelationPlace.isAcceptableOrUnknown(
              data['revelation_place']!, _revelationPlaceMeta));
    } else if (isInserting) {
      context.missing(_revelationPlaceMeta);
    }
    if (data.containsKey('verses_count')) {
      context.handle(_versesCountMeta,
          versesCount.isAcceptableOrUnknown(data['verses_count']!, _versesCountMeta));
    } else if (isInserting) {
      context.missing(_versesCountMeta);
    }
    if (data.containsKey('bismillah_pre')) {
      context.handle(
          _bismillahPreMeta,
          bismillahPre.isAcceptableOrUnknown(
              data['bismillah_pre']!, _bismillahPreMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SurahRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SurahRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nameArabic: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_arabic'])!,
      nameSimple: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_simple'])!,
      nameComplex: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_complex'])!,
      nameEnglish: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_english'])!,
      revelationPlace: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}revelation_place'])!,
      versesCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}verses_count'])!,
      bismillahPre: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}bismillah_pre'])!,
    );
  }

  @override
  $SurahsTable createAlias(String alias) {
    return $SurahsTable(attachedDatabase, alias);
  }
}

class SurahsCompanion extends UpdateCompanion<SurahRow> {
  final Value<int> id;
  final Value<String> nameArabic;
  final Value<String> nameSimple;
  final Value<String> nameComplex;
  final Value<String> nameEnglish;
  final Value<String> revelationPlace;
  final Value<int> versesCount;
  final Value<bool> bismillahPre;
  const SurahsCompanion({
    this.id = const Value.absent(),
    this.nameArabic = const Value.absent(),
    this.nameSimple = const Value.absent(),
    this.nameComplex = const Value.absent(),
    this.nameEnglish = const Value.absent(),
    this.revelationPlace = const Value.absent(),
    this.versesCount = const Value.absent(),
    this.bismillahPre = const Value.absent(),
  });
  SurahsCompanion.insert({
    required int id,
    required String nameArabic,
    required String nameSimple,
    required String nameComplex,
    required String nameEnglish,
    required String revelationPlace,
    required int versesCount,
    this.bismillahPre = const Value.absent(),
  })  : id = Value(id),
        nameArabic = Value(nameArabic),
        nameSimple = Value(nameSimple),
        nameComplex = Value(nameComplex),
        nameEnglish = Value(nameEnglish),
        revelationPlace = Value(revelationPlace),
        versesCount = Value(versesCount);
  static Insertable<SurahRow> custom({
    Expression<int>? id,
    Expression<String>? nameArabic,
    Expression<String>? nameSimple,
    Expression<String>? nameComplex,
    Expression<String>? nameEnglish,
    Expression<String>? revelationPlace,
    Expression<int>? versesCount,
    Expression<bool>? bismillahPre,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nameArabic != null) 'name_arabic': nameArabic,
      if (nameSimple != null) 'name_simple': nameSimple,
      if (nameComplex != null) 'name_complex': nameComplex,
      if (nameEnglish != null) 'name_english': nameEnglish,
      if (revelationPlace != null) 'revelation_place': revelationPlace,
      if (versesCount != null) 'verses_count': versesCount,
      if (bismillahPre != null) 'bismillah_pre': bismillahPre,
    });
  }

  SurahsCompanion copyWith(
      {Value<int>? id,
      Value<String>? nameArabic,
      Value<String>? nameSimple,
      Value<String>? nameComplex,
      Value<String>? nameEnglish,
      Value<String>? revelationPlace,
      Value<int>? versesCount,
      Value<bool>? bismillahPre}) {
    return SurahsCompanion(
      id: id ?? this.id,
      nameArabic: nameArabic ?? this.nameArabic,
      nameSimple: nameSimple ?? this.nameSimple,
      nameComplex: nameComplex ?? this.nameComplex,
      nameEnglish: nameEnglish ?? this.nameEnglish,
      revelationPlace: revelationPlace ?? this.revelationPlace,
      versesCount: versesCount ?? this.versesCount,
      bismillahPre: bismillahPre ?? this.bismillahPre,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nameArabic.present) {
      map['name_arabic'] = Variable<String>(nameArabic.value);
    }
    if (nameSimple.present) {
      map['name_simple'] = Variable<String>(nameSimple.value);
    }
    if (nameComplex.present) {
      map['name_complex'] = Variable<String>(nameComplex.value);
    }
    if (nameEnglish.present) {
      map['name_english'] = Variable<String>(nameEnglish.value);
    }
    if (revelationPlace.present) {
      map['revelation_place'] = Variable<String>(revelationPlace.value);
    }
    if (versesCount.present) {
      map['verses_count'] = Variable<int>(versesCount.value);
    }
    if (bismillahPre.present) {
      map['bismillah_pre'] = Variable<bool>(bismillahPre.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SurahsCompanion(')
          ..write('id: $id, ')
          ..write('nameArabic: $nameArabic, ')
          ..write('nameSimple: $nameSimple, ')
          ..write('nameComplex: $nameComplex, ')
          ..write('nameEnglish: $nameEnglish, ')
          ..write('revelationPlace: $revelationPlace, ')
          ..write('versesCount: $versesCount, ')
          ..write('bismillahPre: $bismillahPre')
          ..write(')'))
        .toString();
  }
}

class AyahRow extends DataClass implements Insertable<AyahRow> {
  final int id;
  final int surahNumber;
  final int ayahNumber;
  final String textUthmani;
  final int juzNumber;
  const AyahRow(
      {required this.id,
      required this.surahNumber,
      required this.ayahNumber,
      required this.textUthmani,
      required this.juzNumber});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['surah_number'] = Variable<int>(surahNumber);
    map['ayah_number'] = Variable<int>(ayahNumber);
    map['text_uthmani'] = Variable<String>(textUthmani);
    map['juz_number'] = Variable<int>(juzNumber);
    return map;
  }

  AyahsCompanion toCompanion(bool nullToAbsent) {
    return AyahsCompanion(
      id: Value(id),
      surahNumber: Value(surahNumber),
      ayahNumber: Value(ayahNumber),
      textUthmani: Value(textUthmani),
      juzNumber: Value(juzNumber),
    );
  }

  factory AyahRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AyahRow(
      id: serializer.fromJson<int>(json['id']),
      surahNumber: serializer.fromJson<int>(json['surahNumber']),
      ayahNumber: serializer.fromJson<int>(json['ayahNumber']),
      textUthmani: serializer.fromJson<String>(json['textUthmani']),
      juzNumber: serializer.fromJson<int>(json['juzNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'surahNumber': serializer.toJson<int>(surahNumber),
      'ayahNumber': serializer.toJson<int>(ayahNumber),
      'textUthmani': serializer.toJson<String>(textUthmani),
      'juzNumber': serializer.toJson<int>(juzNumber),
    };
  }

  AyahRow copyWith(
          {int? id,
          int? surahNumber,
          int? ayahNumber,
          String? textUthmani,
          int? juzNumber}) =>
      AyahRow(
        id: id ?? this.id,
        surahNumber: surahNumber ?? this.surahNumber,
        ayahNumber: ayahNumber ?? this.ayahNumber,
        textUthmani: textUthmani ?? this.textUthmani,
        juzNumber: juzNumber ?? this.juzNumber,
      );
  @override
  String toString() {
    return (StringBuffer('AyahRow(')
          ..write('id: $id, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('ayahNumber: $ayahNumber, ')
          ..write('textUthmani: $textUthmani, ')
          ..write('juzNumber: $juzNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, surahNumber, ayahNumber, textUthmani, juzNumber);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AyahRow &&
          other.id == this.id &&
          other.surahNumber == this.surahNumber &&
          other.ayahNumber == this.ayahNumber &&
          other.textUthmani == this.textUthmani &&
          other.juzNumber == this.juzNumber);
}

class $AyahsTable extends Ayahs with TableInfo<$AyahsTable, AyahRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AyahsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _surahNumberMeta =
      const VerificationMeta('surahNumber');
  @override
  late final GeneratedColumn<int> surahNumber = GeneratedColumn<int>(
      'surah_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _ayahNumberMeta =
      const VerificationMeta('ayahNumber');
  @override
  late final GeneratedColumn<int> ayahNumber = GeneratedColumn<int>(
      'ayah_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _textUthmaniMeta =
      const VerificationMeta('textUthmani');
  @override
  late final GeneratedColumn<String> textUthmani = GeneratedColumn<String>(
      'text_uthmani', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _juzNumberMeta =
      const VerificationMeta('juzNumber');
  @override
  late final GeneratedColumn<int> juzNumber = GeneratedColumn<int>(
      'juz_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, surahNumber, ayahNumber, textUthmani, juzNumber];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ayahs';
  @override
  VerificationContext validateIntegrity(Insertable<AyahRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('surah_number')) {
      context.handle(_surahNumberMeta,
          surahNumber.isAcceptableOrUnknown(data['surah_number']!, _surahNumberMeta));
    } else if (isInserting) {
      context.missing(_surahNumberMeta);
    }
    if (data.containsKey('ayah_number')) {
      context.handle(_ayahNumberMeta,
          ayahNumber.isAcceptableOrUnknown(data['ayah_number']!, _ayahNumberMeta));
    } else if (isInserting) {
      context.missing(_ayahNumberMeta);
    }
    if (data.containsKey('text_uthmani')) {
      context.handle(_textUthmaniMeta,
          textUthmani.isAcceptableOrUnknown(data['text_uthmani']!, _textUthmaniMeta));
    } else if (isInserting) {
      context.missing(_textUthmaniMeta);
    }
    if (data.containsKey('juz_number')) {
      context.handle(_juzNumberMeta,
          juzNumber.isAcceptableOrUnknown(data['juz_number']!, _juzNumberMeta));
    } else if (isInserting) {
      context.missing(_juzNumberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AyahRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AyahRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      surahNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}surah_number'])!,
      ayahNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ayah_number'])!,
      textUthmani: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}text_uthmani'])!,
      juzNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}juz_number'])!,
    );
  }

  @override
  $AyahsTable createAlias(String alias) {
    return $AyahsTable(attachedDatabase, alias);
  }
}

class AyahsCompanion extends UpdateCompanion<AyahRow> {
  final Value<int> id;
  final Value<int> surahNumber;
  final Value<int> ayahNumber;
  final Value<String> textUthmani;
  final Value<int> juzNumber;
  const AyahsCompanion({
    this.id = const Value.absent(),
    this.surahNumber = const Value.absent(),
    this.ayahNumber = const Value.absent(),
    this.textUthmani = const Value.absent(),
    this.juzNumber = const Value.absent(),
  });
  AyahsCompanion.insert({
    required int id,
    required int surahNumber,
    required int ayahNumber,
    required String textUthmani,
    required int juzNumber,
  })  : id = Value(id),
        surahNumber = Value(surahNumber),
        ayahNumber = Value(ayahNumber),
        textUthmani = Value(textUthmani),
        juzNumber = Value(juzNumber);
  static Insertable<AyahRow> custom({
    Expression<int>? id,
    Expression<int>? surahNumber,
    Expression<int>? ayahNumber,
    Expression<String>? textUthmani,
    Expression<int>? juzNumber,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (surahNumber != null) 'surah_number': surahNumber,
      if (ayahNumber != null) 'ayah_number': ayahNumber,
      if (textUthmani != null) 'text_uthmani': textUthmani,
      if (juzNumber != null) 'juz_number': juzNumber,
    });
  }

  AyahsCompanion copyWith(
      {Value<int>? id,
      Value<int>? surahNumber,
      Value<int>? ayahNumber,
      Value<String>? textUthmani,
      Value<int>? juzNumber}) {
    return AyahsCompanion(
      id: id ?? this.id,
      surahNumber: surahNumber ?? this.surahNumber,
      ayahNumber: ayahNumber ?? this.ayahNumber,
      textUthmani: textUthmani ?? this.textUthmani,
      juzNumber: juzNumber ?? this.juzNumber,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (surahNumber.present) {
      map['surah_number'] = Variable<int>(surahNumber.value);
    }
    if (ayahNumber.present) {
      map['ayah_number'] = Variable<int>(ayahNumber.value);
    }
    if (textUthmani.present) {
      map['text_uthmani'] = Variable<String>(textUthmani.value);
    }
    if (juzNumber.present) {
      map['juz_number'] = Variable<int>(juzNumber.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AyahsCompanion(')
          ..write('id: $id, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('ayahNumber: $ayahNumber, ')
          ..write('textUthmani: $textUthmani, ')
          ..write('juzNumber: $juzNumber')
          ..write(')'))
        .toString();
  }
}

class JuzRow extends DataClass implements Insertable<JuzRow> {
  final int juzNumber;
  final int firstVerseId;
  final int lastVerseId;
  final int versesCount;
  const JuzRow(
      {required this.juzNumber,
      required this.firstVerseId,
      required this.lastVerseId,
      required this.versesCount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['juz_number'] = Variable<int>(juzNumber);
    map['first_verse_id'] = Variable<int>(firstVerseId);
    map['last_verse_id'] = Variable<int>(lastVerseId);
    map['verses_count'] = Variable<int>(versesCount);
    return map;
  }

  JuzsCompanion toCompanion(bool nullToAbsent) {
    return JuzsCompanion(
      juzNumber: Value(juzNumber),
      firstVerseId: Value(firstVerseId),
      lastVerseId: Value(lastVerseId),
      versesCount: Value(versesCount),
    );
  }

  factory JuzRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JuzRow(
      juzNumber: serializer.fromJson<int>(json['juzNumber']),
      firstVerseId: serializer.fromJson<int>(json['firstVerseId']),
      lastVerseId: serializer.fromJson<int>(json['lastVerseId']),
      versesCount: serializer.fromJson<int>(json['versesCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'juzNumber': serializer.toJson<int>(juzNumber),
      'firstVerseId': serializer.toJson<int>(firstVerseId),
      'lastVerseId': serializer.toJson<int>(lastVerseId),
      'versesCount': serializer.toJson<int>(versesCount),
    };
  }

  JuzRow copyWith(
          {int? juzNumber,
          int? firstVerseId,
          int? lastVerseId,
          int? versesCount}) =>
      JuzRow(
        juzNumber: juzNumber ?? this.juzNumber,
        firstVerseId: firstVerseId ?? this.firstVerseId,
        lastVerseId: lastVerseId ?? this.lastVerseId,
        versesCount: versesCount ?? this.versesCount,
      );
  @override
  String toString() {
    return (StringBuffer('JuzRow(')
          ..write('juzNumber: $juzNumber, ')
          ..write('firstVerseId: $firstVerseId, ')
          ..write('lastVerseId: $lastVerseId, ')
          ..write('versesCount: $versesCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(juzNumber, firstVerseId, lastVerseId, versesCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JuzRow &&
          other.juzNumber == this.juzNumber &&
          other.firstVerseId == this.firstVerseId &&
          other.lastVerseId == this.lastVerseId &&
          other.versesCount == this.versesCount);
}

class $JuzsTable extends Juzs with TableInfo<$JuzsTable, JuzRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JuzsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _juzNumberMeta =
      const VerificationMeta('juzNumber');
  @override
  late final GeneratedColumn<int> juzNumber = GeneratedColumn<int>(
      'juz_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _firstVerseIdMeta =
      const VerificationMeta('firstVerseId');
  @override
  late final GeneratedColumn<int> firstVerseId = GeneratedColumn<int>(
      'first_verse_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lastVerseIdMeta =
      const VerificationMeta('lastVerseId');
  @override
  late final GeneratedColumn<int> lastVerseId = GeneratedColumn<int>(
      'last_verse_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _versesCountMeta =
      const VerificationMeta('versesCount');
  @override
  late final GeneratedColumn<int> versesCount = GeneratedColumn<int>(
      'verses_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [juzNumber, firstVerseId, lastVerseId, versesCount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'juzs';
  @override
  VerificationContext validateIntegrity(Insertable<JuzRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('juz_number')) {
      context.handle(_juzNumberMeta,
          juzNumber.isAcceptableOrUnknown(data['juz_number']!, _juzNumberMeta));
    } else if (isInserting) {
      context.missing(_juzNumberMeta);
    }
    if (data.containsKey('first_verse_id')) {
      context.handle(
          _firstVerseIdMeta,
          firstVerseId.isAcceptableOrUnknown(
              data['first_verse_id']!, _firstVerseIdMeta));
    } else if (isInserting) {
      context.missing(_firstVerseIdMeta);
    }
    if (data.containsKey('last_verse_id')) {
      context.handle(
          _lastVerseIdMeta,
          lastVerseId.isAcceptableOrUnknown(
              data['last_verse_id']!, _lastVerseIdMeta));
    } else if (isInserting) {
      context.missing(_lastVerseIdMeta);
    }
    if (data.containsKey('verses_count')) {
      context.handle(_versesCountMeta,
          versesCount.isAcceptableOrUnknown(data['verses_count']!, _versesCountMeta));
    } else if (isInserting) {
      context.missing(_versesCountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {juzNumber};
  @override
  JuzRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JuzRow(
      juzNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}juz_number'])!,
      firstVerseId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}first_verse_id'])!,
      lastVerseId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_verse_id'])!,
      versesCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}verses_count'])!,
    );
  }

  @override
  $JuzsTable createAlias(String alias) {
    return $JuzsTable(attachedDatabase, alias);
  }
}

class JuzsCompanion extends UpdateCompanion<JuzRow> {
  final Value<int> juzNumber;
  final Value<int> firstVerseId;
  final Value<int> lastVerseId;
  final Value<int> versesCount;
  const JuzsCompanion({
    this.juzNumber = const Value.absent(),
    this.firstVerseId = const Value.absent(),
    this.lastVerseId = const Value.absent(),
    this.versesCount = const Value.absent(),
  });
  JuzsCompanion.insert({
    required int juzNumber,
    required int firstVerseId,
    required int lastVerseId,
    required int versesCount,
  })  : juzNumber = Value(juzNumber),
        firstVerseId = Value(firstVerseId),
        lastVerseId = Value(lastVerseId),
        versesCount = Value(versesCount);
  static Insertable<JuzRow> custom({
    Expression<int>? juzNumber,
    Expression<int>? firstVerseId,
    Expression<int>? lastVerseId,
    Expression<int>? versesCount,
  }) {
    return RawValuesInsertable({
      if (juzNumber != null) 'juz_number': juzNumber,
      if (firstVerseId != null) 'first_verse_id': firstVerseId,
      if (lastVerseId != null) 'last_verse_id': lastVerseId,
      if (versesCount != null) 'verses_count': versesCount,
    });
  }

  JuzsCompanion copyWith(
      {Value<int>? juzNumber,
      Value<int>? firstVerseId,
      Value<int>? lastVerseId,
      Value<int>? versesCount}) {
    return JuzsCompanion(
      juzNumber: juzNumber ?? this.juzNumber,
      firstVerseId: firstVerseId ?? this.firstVerseId,
      lastVerseId: lastVerseId ?? this.lastVerseId,
      versesCount: versesCount ?? this.versesCount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (juzNumber.present) {
      map['juz_number'] = Variable<int>(juzNumber.value);
    }
    if (firstVerseId.present) {
      map['first_verse_id'] = Variable<int>(firstVerseId.value);
    }
    if (lastVerseId.present) {
      map['last_verse_id'] = Variable<int>(lastVerseId.value);
    }
    if (versesCount.present) {
      map['verses_count'] = Variable<int>(versesCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JuzsCompanion(')
          ..write('juzNumber: $juzNumber, ')
          ..write('firstVerseId: $firstVerseId, ')
          ..write('lastVerseId: $lastVerseId, ')
          ..write('versesCount: $versesCount')
          ..write(')'))
        .toString();
  }
}

class TranslationRow extends DataClass implements Insertable<TranslationRow> {
  final int ayahId;
  final String translationKey;
  final String body;
  const TranslationRow(
      {required this.ayahId,
      required this.translationKey,
      required this.body});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['ayah_id'] = Variable<int>(ayahId);
    map['translation_key'] = Variable<String>(translationKey);
    map['body'] = Variable<String>(body);
    return map;
  }

  TranslationsCompanion toCompanion(bool nullToAbsent) {
    return TranslationsCompanion(
      ayahId: Value(ayahId),
      translationKey: Value(translationKey),
      body: Value(body),
    );
  }

  factory TranslationRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TranslationRow(
      ayahId: serializer.fromJson<int>(json['ayahId']),
      translationKey: serializer.fromJson<String>(json['translationKey']),
      body: serializer.fromJson<String>(json['body']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'ayahId': serializer.toJson<int>(ayahId),
      'translationKey': serializer.toJson<String>(translationKey),
      'body': serializer.toJson<String>(body),
    };
  }

  TranslationRow copyWith(
          {int? ayahId, String? translationKey, String? body}) =>
      TranslationRow(
        ayahId: ayahId ?? this.ayahId,
        translationKey: translationKey ?? this.translationKey,
        body: body ?? this.body,
      );
  @override
  String toString() {
    return (StringBuffer('TranslationRow(')
          ..write('ayahId: $ayahId, ')
          ..write('translationKey: $translationKey, ')
          ..write('body: $body')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(ayahId, translationKey, body);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TranslationRow &&
          other.ayahId == this.ayahId &&
          other.translationKey == this.translationKey &&
          other.body == this.body);
}

class $TranslationsTable extends Translations
    with TableInfo<$TranslationsTable, TranslationRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TranslationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _ayahIdMeta =
      const VerificationMeta('ayahId');
  @override
  late final GeneratedColumn<int> ayahId = GeneratedColumn<int>(
      'ayah_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _translationKeyMeta =
      const VerificationMeta('translationKey');
  @override
  late final GeneratedColumn<String> translationKey = GeneratedColumn<String>(
      'translation_key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
      'body', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [ayahId, translationKey, body];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'translations';
  @override
  VerificationContext validateIntegrity(Insertable<TranslationRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('ayah_id')) {
      context.handle(_ayahIdMeta,
          ayahId.isAcceptableOrUnknown(data['ayah_id']!, _ayahIdMeta));
    } else if (isInserting) {
      context.missing(_ayahIdMeta);
    }
    if (data.containsKey('translation_key')) {
      context.handle(
          _translationKeyMeta,
          translationKey.isAcceptableOrUnknown(
              data['translation_key']!, _translationKeyMeta));
    } else if (isInserting) {
      context.missing(_translationKeyMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {ayahId, translationKey};
  @override
  TranslationRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TranslationRow(
      ayahId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ayah_id'])!,
      translationKey: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}translation_key'])!,
      body: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body'])!,
    );
  }

  @override
  $TranslationsTable createAlias(String alias) {
    return $TranslationsTable(attachedDatabase, alias);
  }
}

class TranslationsCompanion extends UpdateCompanion<TranslationRow> {
  final Value<int> ayahId;
  final Value<String> translationKey;
  final Value<String> body;
  const TranslationsCompanion({
    this.ayahId = const Value.absent(),
    this.translationKey = const Value.absent(),
    this.body = const Value.absent(),
  });
  TranslationsCompanion.insert({
    required int ayahId,
    required String translationKey,
    required String body,
  })  : ayahId = Value(ayahId),
        translationKey = Value(translationKey),
        body = Value(body);
  static Insertable<TranslationRow> custom({
    Expression<int>? ayahId,
    Expression<String>? translationKey,
    Expression<String>? body,
  }) {
    return RawValuesInsertable({
      if (ayahId != null) 'ayah_id': ayahId,
      if (translationKey != null) 'translation_key': translationKey,
      if (body != null) 'body': body,
    });
  }

  TranslationsCompanion copyWith(
      {Value<int>? ayahId,
      Value<String>? translationKey,
      Value<String>? body}) {
    return TranslationsCompanion(
      ayahId: ayahId ?? this.ayahId,
      translationKey: translationKey ?? this.translationKey,
      body: body ?? this.body,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (ayahId.present) {
      map['ayah_id'] = Variable<int>(ayahId.value);
    }
    if (translationKey.present) {
      map['translation_key'] = Variable<String>(translationKey.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TranslationsCompanion(')
          ..write('ayahId: $ayahId, ')
          ..write('translationKey: $translationKey, ')
          ..write('body: $body')
          ..write(')'))
        .toString();
  }
}

class BookmarkRow extends DataClass implements Insertable<BookmarkRow> {
  final int id;
  final int ayahId;
  final int surahNumber;
  final int ayahNumber;
  final String? tag;
  final int createdAt;
  const BookmarkRow(
      {required this.id,
      required this.ayahId,
      required this.surahNumber,
      required this.ayahNumber,
      this.tag,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ayah_id'] = Variable<int>(ayahId);
    map['surah_number'] = Variable<int>(surahNumber);
    map['ayah_number'] = Variable<int>(ayahNumber);
    if (!nullToAbsent || tag != null) {
      map['tag'] = Variable<String>(tag);
    }
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  BookmarksCompanion toCompanion(bool nullToAbsent) {
    return BookmarksCompanion(
      id: Value(id),
      ayahId: Value(ayahId),
      surahNumber: Value(surahNumber),
      ayahNumber: Value(ayahNumber),
      tag: tag == null && nullToAbsent ? const Value.absent() : Value(tag),
      createdAt: Value(createdAt),
    );
  }

  factory BookmarkRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookmarkRow(
      id: serializer.fromJson<int>(json['id']),
      ayahId: serializer.fromJson<int>(json['ayahId']),
      surahNumber: serializer.fromJson<int>(json['surahNumber']),
      ayahNumber: serializer.fromJson<int>(json['ayahNumber']),
      tag: serializer.fromJson<String?>(json['tag']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ayahId': serializer.toJson<int>(ayahId),
      'surahNumber': serializer.toJson<int>(surahNumber),
      'ayahNumber': serializer.toJson<int>(ayahNumber),
      'tag': serializer.toJson<String?>(tag),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  BookmarkRow copyWith(
          {int? id,
          int? ayahId,
          int? surahNumber,
          int? ayahNumber,
          Value<String?> tag = const Value.absent(),
          int? createdAt}) =>
      BookmarkRow(
        id: id ?? this.id,
        ayahId: ayahId ?? this.ayahId,
        surahNumber: surahNumber ?? this.surahNumber,
        ayahNumber: ayahNumber ?? this.ayahNumber,
        tag: tag.present ? tag.value : this.tag,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('BookmarkRow(')
          ..write('id: $id, ')
          ..write('ayahId: $ayahId, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('ayahNumber: $ayahNumber, ')
          ..write('tag: $tag, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, ayahId, surahNumber, ayahNumber, tag, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookmarkRow &&
          other.id == this.id &&
          other.ayahId == this.ayahId &&
          other.surahNumber == this.surahNumber &&
          other.ayahNumber == this.ayahNumber &&
          other.tag == this.tag &&
          other.createdAt == this.createdAt);
}

class $BookmarksTable extends Bookmarks
    with TableInfo<$BookmarksTable, BookmarkRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BookmarksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _ayahIdMeta =
      const VerificationMeta('ayahId');
  @override
  late final GeneratedColumn<int> ayahId = GeneratedColumn<int>(
      'ayah_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _surahNumberMeta =
      const VerificationMeta('surahNumber');
  @override
  late final GeneratedColumn<int> surahNumber = GeneratedColumn<int>(
      'surah_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _ayahNumberMeta =
      const VerificationMeta('ayahNumber');
  @override
  late final GeneratedColumn<int> ayahNumber = GeneratedColumn<int>(
      'ayah_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _tagMeta = const VerificationMeta('tag');
  @override
  late final GeneratedColumn<String> tag = GeneratedColumn<String>(
      'tag', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, ayahId, surahNumber, ayahNumber, tag, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bookmarks';
  @override
  VerificationContext validateIntegrity(Insertable<BookmarkRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ayah_id')) {
      context.handle(_ayahIdMeta,
          ayahId.isAcceptableOrUnknown(data['ayah_id']!, _ayahIdMeta));
    } else if (isInserting) {
      context.missing(_ayahIdMeta);
    }
    if (data.containsKey('surah_number')) {
      context.handle(_surahNumberMeta,
          surahNumber.isAcceptableOrUnknown(data['surah_number']!, _surahNumberMeta));
    } else if (isInserting) {
      context.missing(_surahNumberMeta);
    }
    if (data.containsKey('ayah_number')) {
      context.handle(_ayahNumberMeta,
          ayahNumber.isAcceptableOrUnknown(data['ayah_number']!, _ayahNumberMeta));
    } else if (isInserting) {
      context.missing(_ayahNumberMeta);
    }
    if (data.containsKey('tag')) {
      context.handle(
          _tagMeta, tag.isAcceptableOrUnknown(data['tag']!, _tagMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BookmarkRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookmarkRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      ayahId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ayah_id'])!,
      surahNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}surah_number'])!,
      ayahNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ayah_number'])!,
      tag: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tag']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $BookmarksTable createAlias(String alias) {
    return $BookmarksTable(attachedDatabase, alias);
  }
}

class BookmarksCompanion extends UpdateCompanion<BookmarkRow> {
  final Value<int> id;
  final Value<int> ayahId;
  final Value<int> surahNumber;
  final Value<int> ayahNumber;
  final Value<String?> tag;
  final Value<int> createdAt;
  const BookmarksCompanion({
    this.id = const Value.absent(),
    this.ayahId = const Value.absent(),
    this.surahNumber = const Value.absent(),
    this.ayahNumber = const Value.absent(),
    this.tag = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  BookmarksCompanion.insert({
    this.id = const Value.absent(),
    required int ayahId,
    required int surahNumber,
    required int ayahNumber,
    this.tag = const Value.absent(),
    required int createdAt,
  })  : ayahId = Value(ayahId),
        surahNumber = Value(surahNumber),
        ayahNumber = Value(ayahNumber),
        createdAt = Value(createdAt);
  static Insertable<BookmarkRow> custom({
    Expression<int>? id,
    Expression<int>? ayahId,
    Expression<int>? surahNumber,
    Expression<int>? ayahNumber,
    Expression<String>? tag,
    Expression<int>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ayahId != null) 'ayah_id': ayahId,
      if (surahNumber != null) 'surah_number': surahNumber,
      if (ayahNumber != null) 'ayah_number': ayahNumber,
      if (tag != null) 'tag': tag,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  BookmarksCompanion copyWith(
      {Value<int>? id,
      Value<int>? ayahId,
      Value<int>? surahNumber,
      Value<int>? ayahNumber,
      Value<String?>? tag,
      Value<int>? createdAt}) {
    return BookmarksCompanion(
      id: id ?? this.id,
      ayahId: ayahId ?? this.ayahId,
      surahNumber: surahNumber ?? this.surahNumber,
      ayahNumber: ayahNumber ?? this.ayahNumber,
      tag: tag ?? this.tag,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ayahId.present) {
      map['ayah_id'] = Variable<int>(ayahId.value);
    }
    if (surahNumber.present) {
      map['surah_number'] = Variable<int>(surahNumber.value);
    }
    if (ayahNumber.present) {
      map['ayah_number'] = Variable<int>(ayahNumber.value);
    }
    if (tag.present) {
      map['tag'] = Variable<String?>(tag.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookmarksCompanion(')
          ..write('id: $id, ')
          ..write('ayahId: $ayahId, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('ayahNumber: $ayahNumber, ')
          ..write('tag: $tag, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class NoteRow extends DataClass implements Insertable<NoteRow> {
  final int id;
  final int ayahId;
  final int surahNumber;
  final int ayahNumber;
  final String body;
  final int createdAt;
  final int updatedAt;
  const NoteRow(
      {required this.id,
      required this.ayahId,
      required this.surahNumber,
      required this.ayahNumber,
      required this.body,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ayah_id'] = Variable<int>(ayahId);
    map['surah_number'] = Variable<int>(surahNumber);
    map['ayah_number'] = Variable<int>(ayahNumber);
    map['body'] = Variable<String>(body);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  NotesCompanion toCompanion(bool nullToAbsent) {
    return NotesCompanion(
      id: Value(id),
      ayahId: Value(ayahId),
      surahNumber: Value(surahNumber),
      ayahNumber: Value(ayahNumber),
      body: Value(body),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory NoteRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoteRow(
      id: serializer.fromJson<int>(json['id']),
      ayahId: serializer.fromJson<int>(json['ayahId']),
      surahNumber: serializer.fromJson<int>(json['surahNumber']),
      ayahNumber: serializer.fromJson<int>(json['ayahNumber']),
      body: serializer.fromJson<String>(json['body']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ayahId': serializer.toJson<int>(ayahId),
      'surahNumber': serializer.toJson<int>(surahNumber),
      'ayahNumber': serializer.toJson<int>(ayahNumber),
      'body': serializer.toJson<String>(body),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  NoteRow copyWith(
          {int? id,
          int? ayahId,
          int? surahNumber,
          int? ayahNumber,
          String? body,
          int? createdAt,
          int? updatedAt}) =>
      NoteRow(
        id: id ?? this.id,
        ayahId: ayahId ?? this.ayahId,
        surahNumber: surahNumber ?? this.surahNumber,
        ayahNumber: ayahNumber ?? this.ayahNumber,
        body: body ?? this.body,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('NoteRow(')
          ..write('id: $id, ')
          ..write('ayahId: $ayahId, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('ayahNumber: $ayahNumber, ')
          ..write('body: $body, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, ayahId, surahNumber, ayahNumber, body, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoteRow &&
          other.id == this.id &&
          other.ayahId == this.ayahId &&
          other.surahNumber == this.surahNumber &&
          other.ayahNumber == this.ayahNumber &&
          other.body == this.body &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class $NotesTable extends Notes with TableInfo<$NotesTable, NoteRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _ayahIdMeta =
      const VerificationMeta('ayahId');
  @override
  late final GeneratedColumn<int> ayahId = GeneratedColumn<int>(
      'ayah_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _surahNumberMeta =
      const VerificationMeta('surahNumber');
  @override
  late final GeneratedColumn<int> surahNumber = GeneratedColumn<int>(
      'surah_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _ayahNumberMeta =
      const VerificationMeta('ayahNumber');
  @override
  late final GeneratedColumn<int> ayahNumber = GeneratedColumn<int>(
      'ayah_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
      'body', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, ayahId, surahNumber, ayahNumber, body, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notes';
  @override
  VerificationContext validateIntegrity(Insertable<NoteRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ayah_id')) {
      context.handle(_ayahIdMeta,
          ayahId.isAcceptableOrUnknown(data['ayah_id']!, _ayahIdMeta));
    } else if (isInserting) {
      context.missing(_ayahIdMeta);
    }
    if (data.containsKey('surah_number')) {
      context.handle(_surahNumberMeta,
          surahNumber.isAcceptableOrUnknown(data['surah_number']!, _surahNumberMeta));
    } else if (isInserting) {
      context.missing(_surahNumberMeta);
    }
    if (data.containsKey('ayah_number')) {
      context.handle(_ayahNumberMeta,
          ayahNumber.isAcceptableOrUnknown(data['ayah_number']!, _ayahNumberMeta));
    } else if (isInserting) {
      context.missing(_ayahNumberMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NoteRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NoteRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      ayahId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ayah_id'])!,
      surahNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}surah_number'])!,
      ayahNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ayah_number'])!,
      body: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $NotesTable createAlias(String alias) {
    return $NotesTable(attachedDatabase, alias);
  }
}

class NotesCompanion extends UpdateCompanion<NoteRow> {
  final Value<int> id;
  final Value<int> ayahId;
  final Value<int> surahNumber;
  final Value<int> ayahNumber;
  final Value<String> body;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  const NotesCompanion({
    this.id = const Value.absent(),
    this.ayahId = const Value.absent(),
    this.surahNumber = const Value.absent(),
    this.ayahNumber = const Value.absent(),
    this.body = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  NotesCompanion.insert({
    this.id = const Value.absent(),
    required int ayahId,
    required int surahNumber,
    required int ayahNumber,
    required String body,
    required int createdAt,
    required int updatedAt,
  })  : ayahId = Value(ayahId),
        surahNumber = Value(surahNumber),
        ayahNumber = Value(ayahNumber),
        body = Value(body),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<NoteRow> custom({
    Expression<int>? id,
    Expression<int>? ayahId,
    Expression<int>? surahNumber,
    Expression<int>? ayahNumber,
    Expression<String>? body,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ayahId != null) 'ayah_id': ayahId,
      if (surahNumber != null) 'surah_number': surahNumber,
      if (ayahNumber != null) 'ayah_number': ayahNumber,
      if (body != null) 'body': body,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  NotesCompanion copyWith(
      {Value<int>? id,
      Value<int>? ayahId,
      Value<int>? surahNumber,
      Value<int>? ayahNumber,
      Value<String>? body,
      Value<int>? createdAt,
      Value<int>? updatedAt}) {
    return NotesCompanion(
      id: id ?? this.id,
      ayahId: ayahId ?? this.ayahId,
      surahNumber: surahNumber ?? this.surahNumber,
      ayahNumber: ayahNumber ?? this.ayahNumber,
      body: body ?? this.body,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ayahId.present) {
      map['ayah_id'] = Variable<int>(ayahId.value);
    }
    if (surahNumber.present) {
      map['surah_number'] = Variable<int>(surahNumber.value);
    }
    if (ayahNumber.present) {
      map['ayah_number'] = Variable<int>(ayahNumber.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotesCompanion(')
          ..write('id: $id, ')
          ..write('ayahId: $ayahId, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('ayahNumber: $ayahNumber, ')
          ..write('body: $body, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class HifzCardRow extends DataClass implements Insertable<HifzCardRow> {
  final int id;
  final int ayahId;
  final int surahNumber;
  final int ayahNumber;
  final double stability;
  final double difficulty;
  final int scheduledDays;
  final int reps;
  final int lapses;
  final int dueAt;
  final int? lastReviewAt;
  const HifzCardRow(
      {required this.id,
      required this.ayahId,
      required this.surahNumber,
      required this.ayahNumber,
      required this.stability,
      required this.difficulty,
      required this.scheduledDays,
      required this.reps,
      required this.lapses,
      required this.dueAt,
      this.lastReviewAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ayah_id'] = Variable<int>(ayahId);
    map['surah_number'] = Variable<int>(surahNumber);
    map['ayah_number'] = Variable<int>(ayahNumber);
    map['stability'] = Variable<double>(stability);
    map['difficulty'] = Variable<double>(difficulty);
    map['scheduled_days'] = Variable<int>(scheduledDays);
    map['reps'] = Variable<int>(reps);
    map['lapses'] = Variable<int>(lapses);
    map['due_at'] = Variable<int>(dueAt);
    if (!nullToAbsent || lastReviewAt != null) {
      map['last_review_at'] = Variable<int>(lastReviewAt);
    }
    return map;
  }

  HifzCardsCompanion toCompanion(bool nullToAbsent) {
    return HifzCardsCompanion(
      id: Value(id),
      ayahId: Value(ayahId),
      surahNumber: Value(surahNumber),
      ayahNumber: Value(ayahNumber),
      stability: Value(stability),
      difficulty: Value(difficulty),
      scheduledDays: Value(scheduledDays),
      reps: Value(reps),
      lapses: Value(lapses),
      dueAt: Value(dueAt),
      lastReviewAt: lastReviewAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastReviewAt),
    );
  }

  factory HifzCardRow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HifzCardRow(
      id: serializer.fromJson<int>(json['id']),
      ayahId: serializer.fromJson<int>(json['ayahId']),
      surahNumber: serializer.fromJson<int>(json['surahNumber']),
      ayahNumber: serializer.fromJson<int>(json['ayahNumber']),
      stability: serializer.fromJson<double>(json['stability']),
      difficulty: serializer.fromJson<double>(json['difficulty']),
      scheduledDays: serializer.fromJson<int>(json['scheduledDays']),
      reps: serializer.fromJson<int>(json['reps']),
      lapses: serializer.fromJson<int>(json['lapses']),
      dueAt: serializer.fromJson<int>(json['dueAt']),
      lastReviewAt: serializer.fromJson<int?>(json['lastReviewAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ayahId': serializer.toJson<int>(ayahId),
      'surahNumber': serializer.toJson<int>(surahNumber),
      'ayahNumber': serializer.toJson<int>(ayahNumber),
      'stability': serializer.toJson<double>(stability),
      'difficulty': serializer.toJson<double>(difficulty),
      'scheduledDays': serializer.toJson<int>(scheduledDays),
      'reps': serializer.toJson<int>(reps),
      'lapses': serializer.toJson<int>(lapses),
      'dueAt': serializer.toJson<int>(dueAt),
      'lastReviewAt': serializer.toJson<int?>(lastReviewAt),
    };
  }

  HifzCardRow copyWith(
          {int? id,
          int? ayahId,
          int? surahNumber,
          int? ayahNumber,
          double? stability,
          double? difficulty,
          int? scheduledDays,
          int? reps,
          int? lapses,
          int? dueAt,
          Value<int?> lastReviewAt = const Value.absent()}) =>
      HifzCardRow(
        id: id ?? this.id,
        ayahId: ayahId ?? this.ayahId,
        surahNumber: surahNumber ?? this.surahNumber,
        ayahNumber: ayahNumber ?? this.ayahNumber,
        stability: stability ?? this.stability,
        difficulty: difficulty ?? this.difficulty,
        scheduledDays: scheduledDays ?? this.scheduledDays,
        reps: reps ?? this.reps,
        lapses: lapses ?? this.lapses,
        dueAt: dueAt ?? this.dueAt,
        lastReviewAt:
            lastReviewAt.present ? lastReviewAt.value : this.lastReviewAt,
      );
  @override
  String toString() {
    return (StringBuffer('HifzCardRow(')
          ..write('id: $id, ')
          ..write('ayahId: $ayahId, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('ayahNumber: $ayahNumber, ')
          ..write('stability: $stability, ')
          ..write('difficulty: $difficulty, ')
          ..write('scheduledDays: $scheduledDays, ')
          ..write('reps: $reps, ')
          ..write('lapses: $lapses, ')
          ..write('dueAt: $dueAt, ')
          ..write('lastReviewAt: $lastReviewAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, ayahId, surahNumber, ayahNumber,
      stability, difficulty, scheduledDays, reps, lapses, dueAt, lastReviewAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HifzCardRow &&
          other.id == this.id &&
          other.ayahId == this.ayahId &&
          other.surahNumber == this.surahNumber &&
          other.ayahNumber == this.ayahNumber &&
          other.stability == this.stability &&
          other.difficulty == this.difficulty &&
          other.scheduledDays == this.scheduledDays &&
          other.reps == this.reps &&
          other.lapses == this.lapses &&
          other.dueAt == this.dueAt &&
          other.lastReviewAt == this.lastReviewAt);
}

class $HifzCardsTable extends HifzCards
    with TableInfo<$HifzCardsTable, HifzCardRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HifzCardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _ayahIdMeta =
      const VerificationMeta('ayahId');
  @override
  late final GeneratedColumn<int> ayahId = GeneratedColumn<int>(
      'ayah_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _surahNumberMeta =
      const VerificationMeta('surahNumber');
  @override
  late final GeneratedColumn<int> surahNumber = GeneratedColumn<int>(
      'surah_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _ayahNumberMeta =
      const VerificationMeta('ayahNumber');
  @override
  late final GeneratedColumn<int> ayahNumber = GeneratedColumn<int>(
      'ayah_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _stabilityMeta =
      const VerificationMeta('stability');
  @override
  late final GeneratedColumn<double> stability = GeneratedColumn<double>(
      'stability', aliasedName, false,
      type: DriftSqlType.real, requiredDuringInsert: true);
  static const VerificationMeta _difficultyMeta =
      const VerificationMeta('difficulty');
  @override
  late final GeneratedColumn<double> difficulty = GeneratedColumn<double>(
      'difficulty', aliasedName, false,
      type: DriftSqlType.real, requiredDuringInsert: true);
  static const VerificationMeta _scheduledDaysMeta =
      const VerificationMeta('scheduledDays');
  @override
  late final GeneratedColumn<int> scheduledDays = GeneratedColumn<int>(
      'scheduled_days', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _repsMeta = const VerificationMeta('reps');
  @override
  late final GeneratedColumn<int> reps = GeneratedColumn<int>(
      'reps', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lapsesMeta =
      const VerificationMeta('lapses');
  @override
  late final GeneratedColumn<int> lapses = GeneratedColumn<int>(
      'lapses', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dueAtMeta = const VerificationMeta('dueAt');
  @override
  late final GeneratedColumn<int> dueAt = GeneratedColumn<int>(
      'due_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lastReviewAtMeta =
      const VerificationMeta('lastReviewAt');
  @override
  late final GeneratedColumn<int> lastReviewAt = GeneratedColumn<int>(
      'last_review_at', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        ayahId,
        surahNumber,
        ayahNumber,
        stability,
        difficulty,
        scheduledDays,
        reps,
        lapses,
        dueAt,
        lastReviewAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hifz_cards';
  @override
  VerificationContext validateIntegrity(Insertable<HifzCardRow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ayah_id')) {
      context.handle(_ayahIdMeta,
          ayahId.isAcceptableOrUnknown(data['ayah_id']!, _ayahIdMeta));
    } else if (isInserting) {
      context.missing(_ayahIdMeta);
    }
    if (data.containsKey('surah_number')) {
      context.handle(_surahNumberMeta,
          surahNumber.isAcceptableOrUnknown(data['surah_number']!, _surahNumberMeta));
    } else if (isInserting) {
      context.missing(_surahNumberMeta);
    }
    if (data.containsKey('ayah_number')) {
      context.handle(_ayahNumberMeta,
          ayahNumber.isAcceptableOrUnknown(data['ayah_number']!, _ayahNumberMeta));
    } else if (isInserting) {
      context.missing(_ayahNumberMeta);
    }
    if (data.containsKey('stability')) {
      context.handle(_stabilityMeta,
          stability.isAcceptableOrUnknown(data['stability']!, _stabilityMeta));
    } else if (isInserting) {
      context.missing(_stabilityMeta);
    }
    if (data.containsKey('difficulty')) {
      context.handle(_difficultyMeta,
          difficulty.isAcceptableOrUnknown(data['difficulty']!, _difficultyMeta));
    } else if (isInserting) {
      context.missing(_difficultyMeta);
    }
    if (data.containsKey('scheduled_days')) {
      context.handle(
          _scheduledDaysMeta,
          scheduledDays.isAcceptableOrUnknown(
              data['scheduled_days']!, _scheduledDaysMeta));
    } else if (isInserting) {
      context.missing(_scheduledDaysMeta);
    }
    if (data.containsKey('reps')) {
      context.handle(
          _repsMeta, reps.isAcceptableOrUnknown(data['reps']!, _repsMeta));
    } else if (isInserting) {
      context.missing(_repsMeta);
    }
    if (data.containsKey('lapses')) {
      context.handle(_lapsesMeta,
          lapses.isAcceptableOrUnknown(data['lapses']!, _lapsesMeta));
    } else if (isInserting) {
      context.missing(_lapsesMeta);
    }
    if (data.containsKey('due_at')) {
      context.handle(
          _dueAtMeta, dueAt.isAcceptableOrUnknown(data['due_at']!, _dueAtMeta));
    } else if (isInserting) {
      context.missing(_dueAtMeta);
    }
    if (data.containsKey('last_review_at')) {
      context.handle(
          _lastReviewAtMeta,
          lastReviewAt.isAcceptableOrUnknown(
              data['last_review_at']!, _lastReviewAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HifzCardRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HifzCardRow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      ayahId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ayah_id'])!,
      surahNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}surah_number'])!,
      ayahNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ayah_number'])!,
      stability: attachedDatabase.typeMapping
          .read(DriftSqlType.real, data['${effectivePrefix}stability'])!,
      difficulty: attachedDatabase.typeMapping
          .read(DriftSqlType.real, data['${effectivePrefix}difficulty'])!,
      scheduledDays: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}scheduled_days'])!,
      reps: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}reps'])!,
      lapses: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}lapses'])!,
      dueAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}due_at'])!,
      lastReviewAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_review_at']),
    );
  }

  @override
  $HifzCardsTable createAlias(String alias) {
    return $HifzCardsTable(attachedDatabase, alias);
  }
}

class HifzCardsCompanion extends UpdateCompanion<HifzCardRow> {
  final Value<int> id;
  final Value<int> ayahId;
  final Value<int> surahNumber;
  final Value<int> ayahNumber;
  final Value<double> stability;
  final Value<double> difficulty;
  final Value<int> scheduledDays;
  final Value<int> reps;
  final Value<int> lapses;
  final Value<int> dueAt;
  final Value<int?> lastReviewAt;
  const HifzCardsCompanion({
    this.id = const Value.absent(),
    this.ayahId = const Value.absent(),
    this.surahNumber = const Value.absent(),
    this.ayahNumber = const Value.absent(),
    this.stability = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.scheduledDays = const Value.absent(),
    this.reps = const Value.absent(),
    this.lapses = const Value.absent(),
    this.dueAt = const Value.absent(),
    this.lastReviewAt = const Value.absent(),
  });
  HifzCardsCompanion.insert({
    this.id = const Value.absent(),
    required int ayahId,
    required int surahNumber,
    required int ayahNumber,
    required double stability,
    required double difficulty,
    required int scheduledDays,
    required int reps,
    required int lapses,
    required int dueAt,
    this.lastReviewAt = const Value.absent(),
  })  : ayahId = Value(ayahId),
        surahNumber = Value(surahNumber),
        ayahNumber = Value(ayahNumber),
        stability = Value(stability),
        difficulty = Value(difficulty),
        scheduledDays = Value(scheduledDays),
        reps = Value(reps),
        lapses = Value(lapses),
        dueAt = Value(dueAt);
  static Insertable<HifzCardRow> custom({
    Expression<int>? id,
    Expression<int>? ayahId,
    Expression<int>? surahNumber,
    Expression<int>? ayahNumber,
    Expression<double>? stability,
    Expression<double>? difficulty,
    Expression<int>? scheduledDays,
    Expression<int>? reps,
    Expression<int>? lapses,
    Expression<int>? dueAt,
    Expression<int>? lastReviewAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ayahId != null) 'ayah_id': ayahId,
      if (surahNumber != null) 'surah_number': surahNumber,
      if (ayahNumber != null) 'ayah_number': ayahNumber,
      if (stability != null) 'stability': stability,
      if (difficulty != null) 'difficulty': difficulty,
      if (scheduledDays != null) 'scheduled_days': scheduledDays,
      if (reps != null) 'reps': reps,
      if (lapses != null) 'lapses': lapses,
      if (dueAt != null) 'due_at': dueAt,
      if (lastReviewAt != null) 'last_review_at': lastReviewAt,
    });
  }

  HifzCardsCompanion copyWith(
      {Value<int>? id,
      Value<int>? ayahId,
      Value<int>? surahNumber,
      Value<int>? ayahNumber,
      Value<double>? stability,
      Value<double>? difficulty,
      Value<int>? scheduledDays,
      Value<int>? reps,
      Value<int>? lapses,
      Value<int>? dueAt,
      Value<int?>? lastReviewAt}) {
    return HifzCardsCompanion(
      id: id ?? this.id,
      ayahId: ayahId ?? this.ayahId,
      surahNumber: surahNumber ?? this.surahNumber,
      ayahNumber: ayahNumber ?? this.ayahNumber,
      stability: stability ?? this.stability,
      difficulty: difficulty ?? this.difficulty,
      scheduledDays: scheduledDays ?? this.scheduledDays,
      reps: reps ?? this.reps,
      lapses: lapses ?? this.lapses,
      dueAt: dueAt ?? this.dueAt,
      lastReviewAt: lastReviewAt ?? this.lastReviewAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ayahId.present) {
      map['ayah_id'] = Variable<int>(ayahId.value);
    }
    if (surahNumber.present) {
      map['surah_number'] = Variable<int>(surahNumber.value);
    }
    if (ayahNumber.present) {
      map['ayah_number'] = Variable<int>(ayahNumber.value);
    }
    if (stability.present) {
      map['stability'] = Variable<double>(stability.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<double>(difficulty.value);
    }
    if (scheduledDays.present) {
      map['scheduled_days'] = Variable<int>(scheduledDays.value);
    }
    if (reps.present) {
      map['reps'] = Variable<int>(reps.value);
    }
    if (lapses.present) {
      map['lapses'] = Variable<int>(lapses.value);
    }
    if (dueAt.present) {
      map['due_at'] = Variable<int>(dueAt.value);
    }
    if (lastReviewAt.present) {
      map['last_review_at'] = Variable<int?>(lastReviewAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HifzCardsCompanion(')
          ..write('id: $id, ')
          ..write('ayahId: $ayahId, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('ayahNumber: $ayahNumber, ')
          ..write('stability: $stability, ')
          ..write('difficulty: $difficulty, ')
          ..write('scheduledDays: $scheduledDays, ')
          ..write('reps: $reps, ')
          ..write('lapses: $lapses, ')
          ..write('dueAt: $dueAt, ')
          ..write('lastReviewAt: $lastReviewAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$QuranDatabase extends GeneratedDatabase {
  _$QuranDatabase(super.executor);
  late final $SurahsTable surahs = $SurahsTable(this);
  late final $AyahsTable ayahs = $AyahsTable(this);
  late final $JuzsTable juzs = $JuzsTable(this);
  late final $TranslationsTable translations = $TranslationsTable(this);
  late final $BookmarksTable bookmarks = $BookmarksTable(this);
  late final $NotesTable notes = $NotesTable(this);
  late final $HifzCardsTable hifzCards = $HifzCardsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [surahs, ayahs, juzs, translations, bookmarks, notes, hifzCards];
}
