import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IdentityRecord extends FirestoreRecord {
  IdentityRecord._(
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

  // "number" field.
  String? _number;
  String get number => _number ?? '';
  bool hasNumber() => _number != null;

  // "text" field.
  List<String>? _text;
  List<String> get text => _text ?? const [];
  bool hasText() => _text != null;

  void _initializeFields() {
    _group = snapshotData['Group'] as String?;
    _audio = snapshotData['Audio'] as String?;
    _color = snapshotData['color'] as String?;
    _icon = snapshotData['icon'] as String?;
    _affirmations = snapshotData['Affirmations'] as String?;
    _number = snapshotData['number'] as String?;
    _text = getDataList(snapshotData['text']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Identity');

  static Stream<IdentityRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IdentityRecord.fromSnapshot(s));

  static Future<IdentityRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IdentityRecord.fromSnapshot(s));

  static IdentityRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IdentityRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IdentityRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IdentityRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IdentityRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IdentityRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIdentityRecordData({
  String? group,
  String? audio,
  String? color,
  String? icon,
  String? affirmations,
  String? number,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Group': group,
      'Audio': audio,
      'color': color,
      'icon': icon,
      'Affirmations': affirmations,
      'number': number,
    }.withoutNulls,
  );

  return firestoreData;
}

class IdentityRecordDocumentEquality implements Equality<IdentityRecord> {
  const IdentityRecordDocumentEquality();

  @override
  bool equals(IdentityRecord? e1, IdentityRecord? e2) {
    const listEquality = ListEquality();
    return e1?.group == e2?.group &&
        e1?.audio == e2?.audio &&
        e1?.color == e2?.color &&
        e1?.icon == e2?.icon &&
        e1?.affirmations == e2?.affirmations &&
        e1?.number == e2?.number &&
        listEquality.equals(e1?.text, e2?.text);
  }

  @override
  int hash(IdentityRecord? e) => const ListEquality().hash([
        e?.group,
        e?.audio,
        e?.color,
        e?.icon,
        e?.affirmations,
        e?.number,
        e?.text
      ]);

  @override
  bool isValidKey(Object? o) => o is IdentityRecord;
}
