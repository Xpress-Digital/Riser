import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AlarmRecord extends FirestoreRecord {
  AlarmRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Alarm_title" field.
  int? _alarmTitle;
  int get alarmTitle => _alarmTitle ?? 0;
  bool hasAlarmTitle() => _alarmTitle != null;

  // "Alarm_datetime" field.
  int? _alarmDatetime;
  int get alarmDatetime => _alarmDatetime ?? 0;
  bool hasAlarmDatetime() => _alarmDatetime != null;

  // "Affirmation_tone" field.
  DocumentReference? _affirmationTone;
  DocumentReference? get affirmationTone => _affirmationTone;
  bool hasAffirmationTone() => _affirmationTone != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _alarmTitle = castToType<int>(snapshotData['Alarm_title']);
    _alarmDatetime = castToType<int>(snapshotData['Alarm_datetime']);
    _affirmationTone = snapshotData['Affirmation_tone'] as DocumentReference?;
    _owner = snapshotData['owner'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Alarm')
          : FirebaseFirestore.instance.collectionGroup('Alarm');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Alarm').doc(id);

  static Stream<AlarmRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AlarmRecord.fromSnapshot(s));

  static Future<AlarmRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AlarmRecord.fromSnapshot(s));

  static AlarmRecord fromSnapshot(DocumentSnapshot snapshot) => AlarmRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AlarmRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AlarmRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AlarmRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AlarmRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAlarmRecordData({
  int? alarmTitle,
  int? alarmDatetime,
  DocumentReference? affirmationTone,
  DocumentReference? owner,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Alarm_title': alarmTitle,
      'Alarm_datetime': alarmDatetime,
      'Affirmation_tone': affirmationTone,
      'owner': owner,
    }.withoutNulls,
  );

  return firestoreData;
}

class AlarmRecordDocumentEquality implements Equality<AlarmRecord> {
  const AlarmRecordDocumentEquality();

  @override
  bool equals(AlarmRecord? e1, AlarmRecord? e2) {
    return e1?.alarmTitle == e2?.alarmTitle &&
        e1?.alarmDatetime == e2?.alarmDatetime &&
        e1?.affirmationTone == e2?.affirmationTone &&
        e1?.owner == e2?.owner;
  }

  @override
  int hash(AlarmRecord? e) => const ListEquality()
      .hash([e?.alarmTitle, e?.alarmDatetime, e?.affirmationTone, e?.owner]);

  @override
  bool isValidKey(Object? o) => o is AlarmRecord;
}
