import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResponsibilityRecord extends FirestoreRecord {
  ResponsibilityRecord._(
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

  // "Affirmation" field.
  String? _affirmation;
  String get affirmation => _affirmation ?? '';
  bool hasAffirmation() => _affirmation != null;

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  bool hasNumber() => _number != null;

  void _initializeFields() {
    _group = snapshotData['Group'] as String?;
    _audio = snapshotData['Audio'] as String?;
    _color = snapshotData['color'] as String?;
    _icon = snapshotData['icon'] as String?;
    _affirmation = snapshotData['Affirmation'] as String?;
    _number = castToType<int>(snapshotData['number']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Responsibility');

  static Stream<ResponsibilityRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ResponsibilityRecord.fromSnapshot(s));

  static Future<ResponsibilityRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ResponsibilityRecord.fromSnapshot(s));

  static ResponsibilityRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ResponsibilityRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResponsibilityRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResponsibilityRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ResponsibilityRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ResponsibilityRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createResponsibilityRecordData({
  String? group,
  String? audio,
  String? color,
  String? icon,
  String? affirmation,
  int? number,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Group': group,
      'Audio': audio,
      'color': color,
      'icon': icon,
      'Affirmation': affirmation,
      'number': number,
    }.withoutNulls,
  );

  return firestoreData;
}

class ResponsibilityRecordDocumentEquality
    implements Equality<ResponsibilityRecord> {
  const ResponsibilityRecordDocumentEquality();

  @override
  bool equals(ResponsibilityRecord? e1, ResponsibilityRecord? e2) {
    return e1?.group == e2?.group &&
        e1?.audio == e2?.audio &&
        e1?.color == e2?.color &&
        e1?.icon == e2?.icon &&
        e1?.affirmation == e2?.affirmation &&
        e1?.number == e2?.number;
  }

  @override
  int hash(ResponsibilityRecord? e) => const ListEquality()
      .hash([e?.group, e?.audio, e?.color, e?.icon, e?.affirmation, e?.number]);

  @override
  bool isValidKey(Object? o) => o is ResponsibilityRecord;
}