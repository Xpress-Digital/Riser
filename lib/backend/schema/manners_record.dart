import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MannersRecord extends FirestoreRecord {
  MannersRecord._(
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

  // "Affirmation" field.
  List<String>? _affirmation;
  List<String> get affirmation => _affirmation ?? const [];
  bool hasAffirmation() => _affirmation != null;

  // "color" field.
  String? _color;
  String get color => _color ?? '';
  bool hasColor() => _color != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  bool hasIcon() => _icon != null;

  void _initializeFields() {
    _group = snapshotData['Group'] as String?;
    _audio = snapshotData['Audio'] as String?;
    _affirmation = getDataList(snapshotData['Affirmation']);
    _color = snapshotData['color'] as String?;
    _icon = snapshotData['icon'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Manners');

  static Stream<MannersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MannersRecord.fromSnapshot(s));

  static Future<MannersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MannersRecord.fromSnapshot(s));

  static MannersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MannersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MannersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MannersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MannersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MannersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMannersRecordData({
  String? group,
  String? audio,
  String? color,
  String? icon,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Group': group,
      'Audio': audio,
      'color': color,
      'icon': icon,
    }.withoutNulls,
  );

  return firestoreData;
}

class MannersRecordDocumentEquality implements Equality<MannersRecord> {
  const MannersRecordDocumentEquality();

  @override
  bool equals(MannersRecord? e1, MannersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.group == e2?.group &&
        e1?.audio == e2?.audio &&
        listEquality.equals(e1?.affirmation, e2?.affirmation) &&
        e1?.color == e2?.color &&
        e1?.icon == e2?.icon;
  }

  @override
  int hash(MannersRecord? e) => const ListEquality()
      .hash([e?.group, e?.audio, e?.affirmation, e?.color, e?.icon]);

  @override
  bool isValidKey(Object? o) => o is MannersRecord;
}
