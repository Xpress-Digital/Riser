import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfidenceRecord extends FirestoreRecord {
  ConfidenceRecord._(
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

  // "Number" field.
  int? _number;
  int get number => _number ?? 0;
  bool hasNumber() => _number != null;

  // "Affirmations" field.
  String? _affirmations;
  String get affirmations => _affirmations ?? '';
  bool hasAffirmations() => _affirmations != null;

  void _initializeFields() {
    _group = snapshotData['Group'] as String?;
    _audio = snapshotData['Audio'] as String?;
    _color = snapshotData['color'] as String?;
    _icon = snapshotData['icon'] as String?;
    _number = castToType<int>(snapshotData['Number']);
    _affirmations = snapshotData['Affirmations'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Confidence');

  static Stream<ConfidenceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConfidenceRecord.fromSnapshot(s));

  static Future<ConfidenceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConfidenceRecord.fromSnapshot(s));

  static ConfidenceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConfidenceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConfidenceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConfidenceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConfidenceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConfidenceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConfidenceRecordData({
  String? group,
  String? audio,
  String? color,
  String? icon,
  int? number,
  String? affirmations,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Group': group,
      'Audio': audio,
      'color': color,
      'icon': icon,
      'Number': number,
      'Affirmations': affirmations,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConfidenceRecordDocumentEquality implements Equality<ConfidenceRecord> {
  const ConfidenceRecordDocumentEquality();

  @override
  bool equals(ConfidenceRecord? e1, ConfidenceRecord? e2) {
    return e1?.group == e2?.group &&
        e1?.audio == e2?.audio &&
        e1?.color == e2?.color &&
        e1?.icon == e2?.icon &&
        e1?.number == e2?.number &&
        e1?.affirmations == e2?.affirmations;
  }

  @override
  int hash(ConfidenceRecord? e) => const ListEquality().hash(
      [e?.group, e?.audio, e?.color, e?.icon, e?.number, e?.affirmations]);

  @override
  bool isValidKey(Object? o) => o is ConfidenceRecord;
}
