import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PositivityRecord extends FirestoreRecord {
  PositivityRecord._(
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

  // "Positivity" field.
  String? _positivity;
  String get positivity => _positivity ?? '';
  bool hasPositivity() => _positivity != null;

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  bool hasNumber() => _number != null;

  void _initializeFields() {
    _group = snapshotData['Group'] as String?;
    _audio = snapshotData['Audio'] as String?;
    _color = snapshotData['color'] as String?;
    _icon = snapshotData['icon'] as String?;
    _positivity = snapshotData['Positivity'] as String?;
    _number = castToType<int>(snapshotData['number']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Positivity');

  static Stream<PositivityRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PositivityRecord.fromSnapshot(s));

  static Future<PositivityRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PositivityRecord.fromSnapshot(s));

  static PositivityRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PositivityRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PositivityRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PositivityRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PositivityRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PositivityRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPositivityRecordData({
  String? group,
  String? audio,
  String? color,
  String? icon,
  String? positivity,
  int? number,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Group': group,
      'Audio': audio,
      'color': color,
      'icon': icon,
      'Positivity': positivity,
      'number': number,
    }.withoutNulls,
  );

  return firestoreData;
}

class PositivityRecordDocumentEquality implements Equality<PositivityRecord> {
  const PositivityRecordDocumentEquality();

  @override
  bool equals(PositivityRecord? e1, PositivityRecord? e2) {
    return e1?.group == e2?.group &&
        e1?.audio == e2?.audio &&
        e1?.color == e2?.color &&
        e1?.icon == e2?.icon &&
        e1?.positivity == e2?.positivity &&
        e1?.number == e2?.number;
  }

  @override
  int hash(PositivityRecord? e) => const ListEquality()
      .hash([e?.group, e?.audio, e?.color, e?.icon, e?.positivity, e?.number]);

  @override
  bool isValidKey(Object? o) => o is PositivityRecord;
}