import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmotionsRecord extends FirestoreRecord {
  EmotionsRecord._(
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

  // "Affirmations" field.
  String? _affirmations;
  String get affirmations => _affirmations ?? '';
  bool hasAffirmations() => _affirmations != null;

  // "Number" field.
  int? _number;
  int get number => _number ?? 0;
  bool hasNumber() => _number != null;

  void _initializeFields() {
    _group = snapshotData['Group'] as String?;
    _audio = snapshotData['Audio'] as String?;
    _color = snapshotData['color'] as String?;
    _icon = snapshotData['icon'] as String?;
    _affirmations = snapshotData['Affirmations'] as String?;
    _number = castToType<int>(snapshotData['Number']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Emotions');

  static Stream<EmotionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EmotionsRecord.fromSnapshot(s));

  static Future<EmotionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EmotionsRecord.fromSnapshot(s));

  static EmotionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EmotionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EmotionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EmotionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EmotionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EmotionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEmotionsRecordData({
  String? group,
  String? audio,
  String? color,
  String? icon,
  String? affirmations,
  int? number,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Group': group,
      'Audio': audio,
      'color': color,
      'icon': icon,
      'Affirmations': affirmations,
      'Number': number,
    }.withoutNulls,
  );

  return firestoreData;
}

class EmotionsRecordDocumentEquality implements Equality<EmotionsRecord> {
  const EmotionsRecordDocumentEquality();

  @override
  bool equals(EmotionsRecord? e1, EmotionsRecord? e2) {
    return e1?.group == e2?.group &&
        e1?.audio == e2?.audio &&
        e1?.color == e2?.color &&
        e1?.icon == e2?.icon &&
        e1?.affirmations == e2?.affirmations &&
        e1?.number == e2?.number;
  }

  @override
  int hash(EmotionsRecord? e) => const ListEquality().hash(
      [e?.group, e?.audio, e?.color, e?.icon, e?.affirmations, e?.number]);

  @override
  bool isValidKey(Object? o) => o is EmotionsRecord;
}