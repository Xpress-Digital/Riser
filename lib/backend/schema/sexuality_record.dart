import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SexualityRecord extends FirestoreRecord {
  SexualityRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Group" field.
  String? _group;
  String get group => _group ?? '';
  bool hasGroup() => _group != null;

  // "Audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  bool hasAudio() => _audio != null;

  // "color" field.
  String? _color;
  String get color => _color ?? '';
  bool hasColor() => _color != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  bool hasIcon() => _icon != null;

  // "Affffirmations" field.
  String? _affffirmations;
  String get affffirmations => _affffirmations ?? '';
  bool hasAffffirmations() => _affffirmations != null;

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  bool hasNumber() => _number != null;

  void _initializeFields() {
    _group = snapshotData['Group'] as String?;
    _audio = snapshotData['Audio'] as String?;
    _color = snapshotData['color'] as String?;
    _icon = snapshotData['icon'] as String?;
    _affffirmations = snapshotData['Affffirmations'] as String?;
    _number = castToType<int>(snapshotData['number']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Sexuality');

  static Stream<SexualityRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SexualityRecord.fromSnapshot(s));

  static Future<SexualityRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SexualityRecord.fromSnapshot(s));

  static SexualityRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SexualityRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SexualityRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SexualityRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SexualityRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SexualityRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSexualityRecordData({
  String? group,
  String? audio,
  String? color,
  String? icon,
  String? affffirmations,
  int? number,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Group': group,
      'Audio': audio,
      'color': color,
      'icon': icon,
      'Affffirmations': affffirmations,
      'number': number,
    }.withoutNulls,
  );

  return firestoreData;
}

class SexualityRecordDocumentEquality implements Equality<SexualityRecord> {
  const SexualityRecordDocumentEquality();

  @override
  bool equals(SexualityRecord? e1, SexualityRecord? e2) {
    return e1?.group == e2?.group &&
        e1?.audio == e2?.audio &&
        e1?.color == e2?.color &&
        e1?.icon == e2?.icon &&
        e1?.affffirmations == e2?.affffirmations &&
        e1?.number == e2?.number;
  }

  @override
  int hash(SexualityRecord? e) => const ListEquality().hash(
      [e?.group, e?.audio, e?.color, e?.icon, e?.affffirmations, e?.number]);

  @override
  bool isValidKey(Object? o) => o is SexualityRecord;
}
