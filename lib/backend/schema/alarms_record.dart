import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AlarmsRecord extends FirestoreRecord {
  AlarmsRecord._(
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

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "Status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "Affirmation_Category" field.
  String? _affirmationCategory;
  String get affirmationCategory => _affirmationCategory ?? '';
  bool hasAffirmationCategory() => _affirmationCategory != null;

  // "Alarm_tone" field.
  String? _alarmTone;
  String get alarmTone => _alarmTone ?? '';
  bool hasAlarmTone() => _alarmTone != null;

  void _initializeFields() {
    _alarmTitle = castToType<int>(snapshotData['Alarm_title']);
    _alarmDatetime = castToType<int>(snapshotData['Alarm_datetime']);
    _owner = snapshotData['owner'] as DocumentReference?;
    _status = snapshotData['Status'] as bool?;
    _affirmationCategory = snapshotData['Affirmation_Category'] as String?;
    _alarmTone = snapshotData['Alarm_tone'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Alarms');

  static Stream<AlarmsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AlarmsRecord.fromSnapshot(s));

  static Future<AlarmsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AlarmsRecord.fromSnapshot(s));

  static AlarmsRecord fromSnapshot(DocumentSnapshot snapshot) => AlarmsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AlarmsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AlarmsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AlarmsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AlarmsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAlarmsRecordData({
  int? alarmTitle,
  int? alarmDatetime,
  DocumentReference? owner,
  bool? status,
  String? affirmationCategory,
  String? alarmTone,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Alarm_title': alarmTitle,
      'Alarm_datetime': alarmDatetime,
      'owner': owner,
      'Status': status,
      'Affirmation_Category': affirmationCategory,
      'Alarm_tone': alarmTone,
    }.withoutNulls,
  );

  return firestoreData;
}

class AlarmsRecordDocumentEquality implements Equality<AlarmsRecord> {
  const AlarmsRecordDocumentEquality();

  @override
  bool equals(AlarmsRecord? e1, AlarmsRecord? e2) {
    return e1?.alarmTitle == e2?.alarmTitle &&
        e1?.alarmDatetime == e2?.alarmDatetime &&
        e1?.owner == e2?.owner &&
        e1?.status == e2?.status &&
        e1?.affirmationCategory == e2?.affirmationCategory &&
        e1?.alarmTone == e2?.alarmTone;
  }

  @override
  int hash(AlarmsRecord? e) => const ListEquality().hash([
        e?.alarmTitle,
        e?.alarmDatetime,
        e?.owner,
        e?.status,
        e?.affirmationCategory,
        e?.alarmTone
      ]);

  @override
  bool isValidKey(Object? o) => o is AlarmsRecord;
}
