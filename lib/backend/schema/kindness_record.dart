import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KindnessRecord extends FirestoreRecord {
  KindnessRecord._(
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
      FirebaseFirestore.instance.collection('Kindness');

  static Stream<KindnessRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => KindnessRecord.fromSnapshot(s));

  static Future<KindnessRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => KindnessRecord.fromSnapshot(s));

  static KindnessRecord fromSnapshot(DocumentSnapshot snapshot) =>
      KindnessRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static KindnessRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      KindnessRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'KindnessRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is KindnessRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createKindnessRecordData({
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

class KindnessRecordDocumentEquality implements Equality<KindnessRecord> {
  const KindnessRecordDocumentEquality();

  @override
  bool equals(KindnessRecord? e1, KindnessRecord? e2) {
    return e1?.group == e2?.group &&
        e1?.audio == e2?.audio &&
        e1?.color == e2?.color &&
        e1?.icon == e2?.icon &&
        e1?.affffirmations == e2?.affffirmations &&
        e1?.number == e2?.number;
  }

  @override
  int hash(KindnessRecord? e) => const ListEquality().hash(
      [e?.group, e?.audio, e?.color, e?.icon, e?.affffirmations, e?.number]);

  @override
  bool isValidKey(Object? o) => o is KindnessRecord;
}
