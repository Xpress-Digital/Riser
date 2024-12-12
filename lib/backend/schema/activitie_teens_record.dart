import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActivitieTeensRecord extends FirestoreRecord {
  ActivitieTeensRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Activity" field.
  String? _activity;
  String get activity => _activity ?? '';
  bool hasActivity() => _activity != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _activity = snapshotData['Activity'] as String?;
    _description = snapshotData['Description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Activitie-teens');

  static Stream<ActivitieTeensRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActivitieTeensRecord.fromSnapshot(s));

  static Future<ActivitieTeensRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ActivitieTeensRecord.fromSnapshot(s));

  static ActivitieTeensRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActivitieTeensRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActivitieTeensRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActivitieTeensRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActivitieTeensRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActivitieTeensRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActivitieTeensRecordData({
  String? activity,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Activity': activity,
      'Description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActivitieTeensRecordDocumentEquality
    implements Equality<ActivitieTeensRecord> {
  const ActivitieTeensRecordDocumentEquality();

  @override
  bool equals(ActivitieTeensRecord? e1, ActivitieTeensRecord? e2) {
    return e1?.activity == e2?.activity && e1?.description == e2?.description;
  }

  @override
  int hash(ActivitieTeensRecord? e) =>
      const ListEquality().hash([e?.activity, e?.description]);

  @override
  bool isValidKey(Object? o) => o is ActivitieTeensRecord;
}
